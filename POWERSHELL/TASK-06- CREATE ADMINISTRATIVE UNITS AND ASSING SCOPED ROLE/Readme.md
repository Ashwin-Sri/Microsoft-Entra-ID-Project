# Task 10 - Create Administrative Unit and Assign Scoped Role (PowerShell)

## Objective

Use PowerShell to:

1. Create a new **Administrative Unit** named `AU-2`
2. Add users (`User16` and `User17`) as members
3. Assign the **User Administrator** role scoped only to this AU to `User 15`

---

### 1. Connect to Microsoft Graph with Required Scopes
```powershell
Connect-MgGraph -Scopes "AdministrativeUnit.ReadWrite.All", "RoleManagement.ReadWrite.Directory", "Directory.ReadWrite.All", "User.Read.All"
```
---

### 2. Create a New Administrative Unit- AU 2
``` powershell
# # Create a new Administrative Unit named "AU 2"
$au = New-MgDirectoryAdministrativeUnit -DisplayName "AU 2" -Description "Test AU for scoped role" -Visibility "Public"
# Output AU ID
$au.Id
```
<img width="1467" height="542" alt="image" src="https://github.com/user-attachments/assets/c0eefcb6-fc90-46f7-8747-e95a374e85fb" />

---

## 3. Add members to the Administrative unit AU 2
``` powershell
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.Read.All"

# Target AU display name
$auName = "AU 2"
$adminUnit = Get-MgDirectoryAdministrativeUnit -Filter "displayName eq '$auName'"
$adminUnitId = $adminUnit.Id

# Users to add (update UPNs if needed)
$userUPNs = @("user16@AshDC454.onmicrosoft.com", "user17@AshDC454.onmicrosoft.com")

foreach ($upn in $userUPNs) {
    $user = Get-MgUser -Filter "userPrincipalName eq '$upn'"
    $userId = $user.Id

    # Check if the user is already in the AU
    $existingMembers = Get-MgDirectoryAdministrativeUnitMember -AdministrativeUnitId $adminUnitId
    if (-not ($existingMembers.Id -contains $userId)) {
        New-MgDirectoryAdministrativeUnitMemberByRef -AdministrativeUnitId $adminUnitId `
            -BodyParameter @{ "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$userId" }
        Write-Host " Added $upn to AU: $auName"
    } else {
        Write-Host " $upn is already a member of AU: $auName"
    }
}
```

---
<img width="1005" height="752" alt="image" src="https://github.com/user-attachments/assets/9254a9d7-6b44-4caf-8ff1-5219d9e4ba89" />
<img width="1510" height="507" alt="image" src="https://github.com/user-attachments/assets/b1717aef-6a5d-4832-806c-d5ae1223bb2a" />

---

### 4. Assigning the Role to the Administrative unit

Lets Assign User15 the role User administrator to the admin unit AU 2
```powershell
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory", "Directory.ReadWrite.All"

# Get AU 2
$au = Get-MgDirectoryAdministrativeUnit -Filter "displayName eq 'AU 2'"
$auId = $au.Id

# Get User15
$user = Get-MgUser -Filter "userPrincipalName eq 'user15@AshDC454.onmicrosoft.com'"
$userId = $user.Id

# Get Role Definition ID for 'User Administrator'
$roleDef = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq 'User Administrator'"
$roleDefId = $roleDef.Id

# Assign the role scoped to AU 2
$directoryScopeId = "/administrativeUnits/$auId"

New-MgRoleManagementDirectoryRoleAssignment -PrincipalId $userId `
    -RoleDefinitionId $roleDefId `
    -DirectoryScopeId $directoryScopeId
Write-Host "✅ Assigned 'User Administrator' role to User15 scoped to AU 2"
```

<img width="1887" height="810" alt="image" src="https://github.com/user-attachments/assets/b1235a12-dc0a-46ab-a145-56fa3a61dfa1" />

## 5. Now the User 15 has the Role Assigned Successfully
<img width="1552" height="676" alt="image" src="https://github.com/user-attachments/assets/80ffe965-b2c3-4493-9589-a5042d268fcb" />

---
