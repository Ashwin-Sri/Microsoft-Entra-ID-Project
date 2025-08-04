# Assign Custom Role via PowerShell in Microsoft Entra ID

This guide outlines the process of assigning a **custom directory role** to a specific user in Microsoft Entra ID using Microsoft Graph PowerShell.

---

## Objective

The primary objective is to demonstrate how to programmatically assign a pre-defined custom directory role to a user within Microsoft Entra ID leveraging PowerShell cmdlets that interact with the Microsoft Graph API.

---

## Prerequisites

Before proceeding, ensure you have the following:

* **Microsoft Graph PowerShell module installed:** If you haven't already, install it by running:
    ```powershell
    Install-Module Microsoft.Graph -Scope CurrentUser
    ```
* **Administrator privileges in Microsoft Entra ID:** You will need sufficient permissions to assign roles (e.g., Global Administrator, Privileged Role Administrator, or a custom role with the necessary permissions).
* **The UserPrincipalName (email) UserID of the target user.**
* **The `RoleDefinitionId` of your custom directory role:** This is a unique GUID that identifies your specific custom role. You can find this ID by listing your custom role templates (as shown in Step 2).

---

## Steps Performed

Follow these steps to connect to Microsoft Graph, retrieve user information,Custom Role ID and assign the custom role.

### 1. Connect to Microsoft Graph

Establish a connection to Microsoft Graph with the necessary permissions. The `RoleManagement.ReadWrite.Directory` scope is crucial for assigning roles, while `User.Read.All` is needed to retrieve user details.

```powershell
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory", "User.Read.All"
```
<img width="912" height="240" alt="image" src="https://github.com/user-attachments/assets/bec3e904-97bb-4aad-b2b8-0163f1d683bf" />

---

### 2. (Optional) View All Role Templates and Permissions

```powershell
Connect-MgGraph -Scopes "RoleManagement.Read.Directory"
Get-MgDirectoryRoleTemplate
```
<img width="1133" height="660" alt="image" src="https://github.com/user-attachments/assets/e8d1a9a0-1b07-4448-a7ae-5fcbe6d659a6" />

---

### 3. Retrieve the user object using their email (UserPrincipalName)

```powershell
$user = Get-MgUser -Filter "userPrincipalName eq 'User13@AshDC454.onmicrosoft.com'"
```

---

### 4. Store the user's object ID

```powershell
$userId = $user.Id
```

---

### 5. Assign the custom role using its RoleDefinitionId

```powershell
New-MgRoleManagementDirectoryRoleAssignment -PrincipalId $userId `
    -RoleDefinitionId "9360feb5-f418-4baa-8175-e2a00bac4301" `
    -DirectoryScopeId "/"
```
<img width="1106" height="482" alt="image" src="https://github.com/user-attachments/assets/4105ada8-7d7c-4d1b-bfed-659ef07ffdb9" />

---

### 6. The Role has been assgined to User13

<img width="1557" height="421" alt="image" src="https://github.com/user-attachments/assets/c87e3e47-6a54-48c1-acce-55fdc63ceb84" />

---
