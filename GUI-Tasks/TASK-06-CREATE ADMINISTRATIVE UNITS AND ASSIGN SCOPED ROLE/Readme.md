# Create Administrative Unit and Assign Scoped Role

## Objective
Create a new **Administrative Unit** named `AU 1`, add users (`User11` to `User15`) as members, and assign the **User Administrator** role scoped only to this unit.

---

## Steps

### 1. Create a New Administrative Unit

- Go to **Microsoft Entra admin center**
- Navigate to:  
  `Role & Admins >Admin units > + Add`
- Enter the **Name** as `AU 1`
- Next Select Assgin roles, select User Administrator> select the User for this Role `(User 2)`
-Then select Add
- Click **Review + Create**, then **Create**
<img width="856" height="796" alt="image" src="https://github.com/user-attachments/assets/2cdbedb9-feea-4f7d-92be-10d6cbc2be52" />

---

### 2. Add Members to the Administrative Unit

- Select the **AU 1** unit from the list
- Go to the **Users** tab → Click **+ Add members**
- Search and add the following users:
  - `User05`
  - `User06`
  - `User07`
  - `User08`
  - `User09`
  - `User10`
- Click **Select** to confirm
  
<img width="1595" height="723" alt="image" src="https://github.com/user-attachments/assets/63527564-af41-45a6-9903-c1184eedd2ff" />

---

## Note

- Administrative Units (AUs) allow **delegated administration** to specific groups or departments.
- Scoped roles only apply within the AU, not tenant-wide.
- Keep "**Restricted management administrative unit**" set to No, unless you're specifically managing privileged roles like Global Admins. 
---
