# Create Dynamic Group with Membership Rule

##  Objective

Use PowerShell to:

1. Create a **Security Group** with **Dynamic Membership**
2. Define a **Membership Rule** using user attributes

---

### 1.Connect to Microsoft Graph with Required Scopes

```powershell
Connect-MgGraph -Scopes "Group.ReadWrite.All", "User.Read.All"
```

---

### 2.Define membership rule (example: users with a specific department value)
$membershipRule = '(user.department -eq "Marketing")'


---

### 3.Create Dynamic Group
```powershell
New-MgGroup -DisplayName "Dynamic Group" `
    -MailNickname "DynamicGroupAlias" `
    -Description "Auto-managed group based on defined rule" `
    -MailEnabled:$false `
    -SecurityEnabled:$true `
    -GroupTypes @("DynamicMembership") `
    -MembershipRule '(user.department -eq "Marketing")' `
    -MembershipRuleProcessingState "On"
```
<img width="1151" height="360" alt="image" src="https://github.com/user-attachments/assets/0ffc0e80-d75b-49a1-99da-fb6c673fbb83" />

<img width="1456" height="762" alt="image" src="https://github.com/user-attachments/assets/7f860be3-18ec-426a-a564-bcdb8b950817" />

---
