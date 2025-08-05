
## Objective

Create a **Microsoft 365 security group** using Microsoft Graph PowerShell and add multiple users as members.

---

## Prerequisites

Make sure you have the following before starting:

- Microsoft Graph PowerShell module installed  
- Required permissions: `Group.ReadWrite.All`, `User.Read.All`  
- A list of user UPNs or object IDs to add as group members

---

## Steps Performed

### 1. Connect to Microsoft Graph

```powershell
Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"
```
---

### 2. Create a New Security Group

```$groupParams = @{
    DisplayName     = "Demo Group"
    Description     = "Security group created via PowerShell"
    MailEnabled     = $false
    MailNickname    = "Demogroup"
    SecurityEnabled = $true
    GroupTypes      = @()
}

$group = New-MgGroup @groupParams
$groupId = $group.Id
```
This creates a mail-disabled, security-enabled group and stores its ID for use in the next steps.
<img width="641" height="235" alt="image" src="https://github.com/user-attachments/assets/f10fdb19-a0ff-496f-9136-eb4229be5a56" />

<img width="1418" height="681" alt="image" src="https://github.com/user-attachments/assets/5916f6a6-9c0a-494c-af91-3fc15fb3d8fb" />

---

### 3. Get Users to Add to the Group
You can retrieve users by UPN or use any filter logic. Example for specific UPNs:
```
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

```
<img width="712" height="450" alt="image" src="https://github.com/user-attachments/assets/892790fe-649f-4692-ad5e-a936c65e55cf" />

---

### 4. Add Users to the Group
```
foreach ($userId in $userIds) {
    New-MgGroupMember -GroupId $groupId -DirectoryObjectId $userId
}
This loop adds each user to the newly created group using their object ID.

```

---

A new security group named Demo Group has been created, and users User17, User18, and User19 were successfully added as members.

<img width="1377" height="592" alt="image" src="https://github.com/user-attachments/assets/67398bc5-39d0-4c2b-b755-84c909d471a8" />

---
