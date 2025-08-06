# Update User Properties via PowerShell

## Objective

Update user attributes such as **job title**, **department**, or **office location** for one or more users in Microsoft Entra ID using PowerShell (Microsoft Graph SDK).

---

## Prerequisites

- Microsoft Graph PowerShell SDK installed
- Connected to Microsoft Graph with required permissions:
  - `User.ReadWrite.All` (delegated or application)

---

## Scenario

We will update the following properties for a user named `User11`:

- **Job Title**: `IT Support Engineer`
- **Department**: `IT Services`
- **Office Location**: `Chennai HQ`

---

## Step 1: Run PowerShell Command

```powershell
Connect-MgGraph
$userUPN = "User11@AshDC454.onmicrosoft.com"

Set-MgUser -UserId $userUPN `
    -JobTitle "IT Support Engineer" `
    -Department "IT Services" `
    -OfficeLocation "Chennai HQ"
```
<img width="900" height="608" alt="image" src="https://github.com/user-attachments/assets/a298dfed-c68e-443f-8ae6-d07516f4c5f8" />

---

### Verify the Update
```
Get-MgUser -UserId $userUPN | Select-Object DisplayName, JobTitle, Department, OfficeLocation
```
<img width="1077" height="110" alt="image" src="https://github.com/user-attachments/assets/c6b4dfb2-8ecb-4c59-bb65-e1dfc772f757" />

<img width="1002" height="763" alt="image" src="https://github.com/user-attachments/assets/ecfdeccf-8bad-4737-8119-1b9d66d1412c" />

---

### Note
  1.You can update multiple properties in a single command.
  
  2.To update users in bulk, loop through a CSV or list of users with different values
