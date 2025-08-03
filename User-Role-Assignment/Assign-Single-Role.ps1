Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory", "Directory.Read.All"

$roleName = "License Administrator"
$userUPN = "User02@AshDC454.onmicrosoft.com"

# Get user ID
$user = Get-MgUser -Filter "userPrincipalName eq '$userUPN'"
$userId = $user.Id

# Check if role is already active
$role = Get-MgDirectoryRole | Where-Object { $_.DisplayName -eq $roleName }

# If not active, activate the role using the template ID
if (-not $role) {
    $roleTemplate = Get-MgDirectoryRoleTemplate | Where-Object { $_.DisplayName -eq $roleName }

    if ($roleTemplate) {
        # Activate the role
        Invoke-MgGraphRequest -Method POST `
            -Uri "https://graph.microsoft.com/v1.0/directoryRoles" `
            -Body (@{ "roleTemplateId" = $roleTemplate.Id } | ConvertTo-Json -Depth 2)

        Start-Sleep -Seconds 10

        # Get the now-activated role
        $role = Get-MgDirectoryRole | Where-Object { $_.DisplayName -eq $roleName }
    } else {
        Write-Host "Role template '$roleName' not found."
        exit
    }
}

# Assign the role to the user
New-MgDirectoryRoleMemberByRef -DirectoryRoleId $role.Id -BodyParameter @{
    "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$userId"
}
