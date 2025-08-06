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

# Run the PowerShell Script

```
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Import users from the CSV file
$users = Import-Csv ".\users.csv"

# Loop through each user and update their properties
foreach ($user in $users) {
    Write-Host "Updating: $($user.UserPrincipalName)" -ForegroundColor Cyan

    Set-MgUser -UserId $user.UserPrincipalName `
        -JobTitle $user.JobTitle `
        -Department $user.Department `
        -OfficeLocation $user.OfficeLocation
}
```
<img width="776" height="586" alt="image" src="https://github.com/user-attachments/assets/19eb4816-d047-4476-a658-7a121aa20d39" />

---

### Verify Updates (Per User)

```
Get-MgUser -UserId "User12@AshDC454.onmicrosoft.com" | Select DisplayName, JobTitle, Department, OfficeLocation
Get-MgUser -UserId "User13@AshDC454.onmicrosoft.com" | Select DisplayName, JobTitle, Department, OfficeLocation
Get-MgUser -UserId "User14@AshDC454.onmicrosoft.com" | Select DisplayName, JobTitle, Department, OfficeLocation
```

<img width="1207" height="217" alt="image" src="https://github.com/user-attachments/assets/095b879b-92dc-4964-88a8-0ae39b00c271" />

---

