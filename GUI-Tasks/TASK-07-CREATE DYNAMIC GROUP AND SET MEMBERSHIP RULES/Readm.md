# Create Dynamic Group with Membership Rule

## Objective

Create a **Dynamic User Group** named `Operations Group 1` in Microsoft Entra ID. This group will automatically include users whose **department** attribute is set to `"Operations"`.

---

## Steps

### 1. Navigate to Microsoft Entra Admin Center

- Open the [Microsoft Entra admin center](https://entra.microsoft.com)
- Go to **Groups > All groups**
- Click **+ New group**

---

### 2. Configure Group Details

- **Group type**: Security  
- **Group name**: `Operations Group 1`  
- **Group description**: `Users from Operations Department`  
- **Membership type**: Dynamic User  
- Click **Add dynamic query**
<img width="1251" height="853" alt="image" src="https://github.com/user-attachments/assets/9651c631-0c30-4eec-bc71-7d82d6b8865d" />

---

### 3. Define Dynamic Membership Rule

- In the **Rule syntax** field, enter the following:
(user.department -eq "Operations")
<img width="1562" height="650" alt="image" src="https://github.com/user-attachments/assets/14d06baf-af91-4de3-bd66-d6a6105fc1c9" />

---
