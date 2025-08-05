# Step 1: Install the Microsoft Graph module
Install-Module Microsoft.Graph -Scope CurrentUser -Force

# Step 2: Connect with required scopes
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory", "User.Read.All"

# Optional: Verify you're connected
Get-MgUserMe

# Step 3: Get the user object
$user = Get-MgUser -Filter "userPrincipalName eq 'User13@AshDC454.onmicrosoft.com'"
$userId = $user.Id

# Step 4: Get role definition ID (example: Global Administrator)
# You can use this to dynamically fetch it, or stick with a known GUID
$role = Get-MgDirectoryRoleTemplate | Where-Object {$_.DisplayName -eq "Global Administrator"}
$roleDefinitionId = $role.Id

# Step 5: Create the role assignment
New-MgRoleManagementDirectoryRoleAssignment -PrincipalId $userId `
    -RoleDefinitionId $roleDefinitionId `
    -DirectoryScopeId "/"
