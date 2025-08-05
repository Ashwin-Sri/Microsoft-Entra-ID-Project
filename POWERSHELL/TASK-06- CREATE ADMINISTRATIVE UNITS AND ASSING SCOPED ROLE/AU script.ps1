# Connect to Microsoft Graph with required scopes
Connect-MgGraph -Scopes "AdministrativeUnit.ReadWrite.All", "RoleManagement.ReadWrite.Directory", "Directory.ReadWrite.All", "User.Read.All"

# Create a new Administrative Unit named "AU 2"
$au = New-MgDirectoryAdministrativeUnit -DisplayName "AU 2" -Description "Test AU for scoped role" -Visibility "Public"
$auId = $au.Id

# Add members to Administrative Unit AU 2
$auName = "AU 2"
$adminUnit = Get-MgDirectoryAdministrativeUnit -Filter "displayName eq '$auName'"
$adminUnitId = $adminUnit.Id
$userUPNs = @("user16@AshDC454.onmicrosoft.com", "user17@AshDC454.onmicrosoft.com")

foreach ($upn in $userUPNs) {
    $user = Get-MgUser -Filter "userPrincipalName eq '$upn'"
    $userId = $user.Id
    $existingMembers = Get-MgDirectoryAdministrativeUnitMember -AdministrativeUnitId $adminUnitId
    if (-not ($existingMembers.Id -contains $userId)) {
        New-MgDirectoryAdministrativeUnitMemberByRef -AdministrativeUnitId $adminUnitId `
            -BodyParameter @{ "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$userId" }
        Write-Host " Added $upn to AU: $auName"
    } else {
        Write-Host " $upn is already a member of AU: $auName"
    }
}

# Assign the 'User Administrator' role scoped to AU 2 to User15
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory", "Directory.ReadWrite.All"
$au = Get-MgDirectoryAdministrativeUnit -Filter "displayName eq 'AU 2'"
$auId = $au.Id
$user = Get-MgUser -Filter "userPrincipalName eq 'user15@AshDC454.onmicrosoft.com'"
$userId = $user.Id
$roleDef = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq 'User Administrator'"
$roleDefId = $roleDef.Id
$directoryScopeId = "/administrativeUnits/$auId"

New-MgRoleManagementDirectoryRoleAssignment -PrincipalId $userId `
    -RoleDefinitionId $roleDefId `
    -DirectoryScopeId $directoryScopeId
Write-Host "✅ Assigned 'User Administrator' role to User15 scoped to AU 2"
