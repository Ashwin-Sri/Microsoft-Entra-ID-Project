param (
    [ValidateNotNullOrEmpty()]
    [string]$LogPath = "C:\ENTRA AUDIT\LOGS",

    [ValidateNotNullOrEmpty()]
    [string]$ReportPath = "C:\ENTRA AUDIT\REPORTS",

    [ValidateNotNullOrEmpty()]
    [string]$CredentialPath = "C:\ENTRA AUDIT\secrets.json", # 🔐 Path to JSON file with TenantId, ClientId, ClientSecret

    [int]$InactiveDays = 30
)

# --- Create directories if missing ---
foreach ($path in @($LogPath, $ReportPath)) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

# --- Logging setup ---
$timestamp  = Get-Date -Format "yyyy-MM-dd_HH-mm"
$logFile    = Join-Path $LogPath "InactiveLicensedUsers_$timestamp.log"
$errorLog   = Join-Path $LogPath "InactiveLicensedUsers_ERRORS_$timestamp.log"

Start-Transcript -Path $logFile -Append
Write-Host "=== Script started at $(Get-Date) ==="
Write-Host "Inactive days threshold: $InactiveDays"

# --- Load credentials securely ---
try {
    if (-not (Test-Path $CredentialPath)) {
        throw "Credential file not found at $CredentialPath"
    }

    $creds = Get-Content $CredentialPath | ConvertFrom-Json
    $TenantId    = $creds.TenantId
    $ClientId    = $creds.ClientId
    $PlainSecret = $creds.ClientSecret

    if (-not $TenantId -or -not $ClientId -or -not $PlainSecret) {
        throw "Credential file is missing required fields."
    }

    Write-Host "Credentials loaded successfully."
} catch {
    Write-Error "❌ Failed to load credentials: $_" | Tee-Object -FilePath $errorLog -Append
    Stop-Transcript
    exit 1
}

# --- Token acquisition ---
$TokenBody = @{
    grant_type    = "client_credentials"
    client_id     = $ClientId
    client_secret = $PlainSecret
    scope         = "https://graph.microsoft.com/.default"
}

try {
    $TokenResponse = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token" -Body $TokenBody
    $AccessToken   = $TokenResponse.access_token
    Write-Host "Access token acquired successfully."
} catch {
    Write-Error "❌ Token acquisition failed: $_" | Tee-Object -FilePath $errorLog -Append
    Stop-Transcript
    exit 1
}

$Headers = @{ Authorization = "Bearer $AccessToken" }

# --- Fetch licensed users with sign-in info ---
$InactiveUsers = @()
$cutoffDate = (Get-Date).AddDays(-$InactiveDays)
$Uri = "https://graph.microsoft.com/beta/users?`$select=displayName,userPrincipalName,assignedLicenses,signInActivity&`$top=999"
$loopCount = 0
$AllUsers = @()

do {
    $loopCount++
    Write-Host "Fetching page $loopCount..."

    try {
        $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Headers
        $AllUsers += $Response.value
        $Uri = $Response.'@odata.nextLink'
    } catch {
        Write-Warning "Failed to retrieve users: $_" | Tee-Object -FilePath $errorLog -Append
        break
    }
} while ($Uri)

# --- Filter licensed & inactive users ---
$LicensedUsers = $AllUsers | Where-Object { $_.assignedLicenses.Count -gt 0 }

foreach ($user in $LicensedUsers) {
    $lastSignIn = $null

    if ($user.signInActivity.lastSignInDateTime) {
        $lastSignIn = [datetime]$user.signInActivity.lastSignInDateTime
    }

    if (-not $lastSignIn -or $lastSignIn -lt $cutoffDate) {
        $InactiveUsers += [PSCustomObject]@{
            UserPrincipalName = $user.userPrincipalName
            DisplayName       = $user.displayName
            LastSignIn        = if ($lastSignIn) { $lastSignIn } else { "Never signed in" }
        }
    }
}

# --- Export CSV report ---
$reportFile = Join-Path $ReportPath "InactiveLicensedUsers_$timestamp.csv"
$InactiveUsers | Sort-Object LastSignIn | Export-Csv -Path $reportFile -NoTypeInformation -Encoding UTF8
Write-Host "Report saved to: $reportFile"
Write-Host "Total inactive licensed users: $($InactiveUsers.Count)"

Write-Host "=== Script completed at $(Get-Date) ==="
Stop-Transcript
