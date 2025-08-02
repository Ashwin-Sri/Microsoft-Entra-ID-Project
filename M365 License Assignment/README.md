# Microsoft Entra ID – License Assignment (Portal & PowerShell)

This document explains six commonly used methods to assign Microsoft 365 licenses to users in Microsoft 365 , using both **Admin Center (Portal)** and **PowerShell (Microsoft Graph)**.

---

##  Portal-Based Methods

### 1. Assign License to a Single User (Portal)
- Go to [Microsoft 365 Admin Center](https://admin.microsoft.com)
- Navigate to **Users > Active Users**
- Click the user you want to assign the license to
- Go to **Licenses and apps**
- Select the appropriate license SKU (e.g., Microsoft 365 Business Premium)
- Enable/disable specific services under the license
- Click **Save changes**

---

### 2. Assign License to Multiple Users in Bulk (Portal)
- Go to **Users > Active Users**
- Use checkboxes to select multiple users
- Click **Manage product licenses**
- Choose **Assign** or **Replace existing licenses**
- Select the license SKU and services
- Click **Save changes**
<img width="1797" height="865" alt="image" src="https://github.com/user-attachments/assets/3bd1592c-823e-4bb9-9770-a968d16df550" />

---

### 3. Assign License Based on Group (Portal)
- Go to **Groups > Active Groups**
- Select the **Microsoft 365 Group** or **Security Group**
- Click **Licenses > Assign licenses**
- Choose the license SKU
- Click **Next**
- Enable/disable services if needed
- Complete the wizard to assign licenses to all members of the group
<img width="1791" height="858" alt="image" src="https://github.com/user-attachments/assets/12af1e12-5dc3-4a4e-99fe-0583e1e9097b" />

---

##  PowerShell-Based Methods

> 🛠 Prerequisites:  
> Install Microsoft Graph PowerShell module if not already installed:  
> `Install-Module Microsoft.Graph`  
> Connect to Graph:  
> `Connect-MgGraph -Scopes "User.ReadWrite.All", "Group.Read.All"`

---

### 4. Assign License to a Single User (PowerShell)

```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All"

$userUPN = "user1@yourtenant.onmicrosoft.com"
$userId = (Get-MgUser -UserPrincipalName $userUPN).Id

$skuId = (Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "SPB" }).SkuId

Set-MgUserLicense -UserId $userId -AddLicenses @{ SkuId = $skuId } -RemoveLicenses @()
```

---

### 5. Assign License to Multiple Users (PowerShell Bulk)

```powershell
Connect-MgGraph -Scopes "User.ReadWrite.All"

$skuId = (Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "SPB" }).SkuId

$userUPNs = @(
    "user1@yourtenant.onmicrosoft.com",
    "user2@yourtenant.onmicrosoft.com",
    "user3@yourtenant.onmicrosoft.com"
)

foreach ($user in $userUPNs) {
    $userId = (Get-MgUser -UserPrincipalName $user).Id
    Set-MgUserLicense -UserId $userId -AddLicenses @{ SkuId = $skuId } -RemoveLicenses @()
}
```

---

### 6. Assign License Based on Group Members (PowerShell)

```Connect-MgGraph -Scopes "User.ReadWrite.All", "Group.Read.All"

$groupName = "Group 2"
$groupId = (Get-MgGroup -Filter "DisplayName eq '$groupName'").Id

if (-not $groupId) {
    Write-Error "Group '$groupName' not found. Please check the group name."
    exit
}

$members = Get-MgGroupMember -GroupId $groupId -All
$skuId = (Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "SPB" }).SkuId

foreach ($member in $members) {
    $odataType = $member.AdditionalProperties.'@odata.type'
    if ($odataType -eq "#microsoft.graph.user") {
        $userId = $member.Id
        $displayName = $member.AdditionalProperties.displayName

        Update-MgUser -UserId $userId -UsageLocation "IN"
        Write-Host "Set UsageLocation for user: $displayName"

        Set-MgUserLicense -UserId $userId -AddLicenses @{ SkuId = $skuId } -RemoveLicenses @()
        Write-Host "Assigned license to user: $displayName"
    }
    else {
        Write-Host "Skipping non-user object"
    }
}
```
---

# License Assignment to Users in a Group (PowerShell)

This script assigns Microsoft 365 licenses to all users in a specified security group using Microsoft Graph PowerShell.

## How the Script Works

1. **Connects to Microsoft Graph** with permissions to read/write users and read groups.
2. **Specifies the group name** (e.g., `"Group 2"`) and retrieves its unique ID.
3. **Verifies the group exists**; stops execution if not found.
4. **Retrieves all members** of the group.
5. **Fetches the SKU ID** of the license to assign (e.g., `"SPB"`).
6. **Loops through each member**:
   - Checks if the member is a user (skips devices, other groups, etc.).
   - Sets the user’s **UsageLocation** (mandatory for license assignment).
   - Assigns the license SKU to the user.
   - Prints status messages.
7. **Skips any non-user objects** found in the group.

## Script Usage Notes

- Update `$groupName` to the exact display name of your target group.
- Update the license SKU part number in the script if assigning a different license.
- Change the UsageLocation value (`"IN"`) to the user's correct country code as needed.

## Sample PowerShell Script

*(Refer to the separate script file for the actual runnable script.)*

