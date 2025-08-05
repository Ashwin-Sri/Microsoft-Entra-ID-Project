Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"

$groupParams = @{
    DisplayName     = "PowerShell-Security-Group"
    Description     = "Security group created via PowerShell"
    MailEnabled     = $false
    MailNickname    = "pssecuritygroup"
    SecurityEnabled = $true
    GroupTypes      = @()
}

$group = New-MgGroup @groupParams
$groupId = $group.Id


$userUPNs = @(
    "User17@AshDC454.onmicrosoft.com",
    "User18@AshDC454.onmicrosoft.com",
    "User19@AshDC454.onmicrosoft.com"
)

$userIds = @()

foreach ($upn in $userUPNs) {
    $user = Get-MgUser -Filter "userPrincipalName eq '$upn'"
    if ($user -ne $null) {
        $userIds += $user.Id
    } else {
        Write-Warning "User not found: $upn"
    }
}


foreach ($userId in $userIds) {
    New-MgGroupMember -GroupId $groupId -DirectoryObjectId $userId
}
