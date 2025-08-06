# Connect to Microsoft Graph with required scopes
Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"

# Define parameters for the new security group
$groupParams = @{
    DisplayName     = "Demo Group"
    Description     = "Security group created via PowerShell"
    MailEnabled     = $false
    MailNickname    = "Demogroup"
    SecurityEnabled = $true
    GroupTypes      = @()
}

# Create the group and store its ID
$group = New-MgGroup @groupParams
$groupId = $group.Id

# Define user UPNs to be added to the group
$userUPNs = @(
    "User17@AshDC454.onmicrosoft.com",
    "User18@AshDC454.onmicrosoft.com",
    "User19@AshDC454.onmicrosoft.com"
)

# Resolve user object IDs
$userIds = @()
foreach ($upn in $userUPNs) {
    $user = Get-MgUser -Filter "userPrincipalName eq '$upn'"
    if ($user -ne $null) {
        $userIds += $user.Id
    } else {
        Write-Warning "User not found: $upn"
    }
}

# Add users to the group
foreach ($userId in $userIds) {
    New-MgGroupMember -GroupId $groupId -DirectoryObjectId $userId
}
