# Microsoft Entra ID – Create Security Group and Add Members

## Objective
Create a **Security Group** named `Group 3` in Microsoft Entra ID using the portal, and manually assign members ranging from `User11` to `User19`.

---

### 1. Create the Group

1. Go to [Microsoft Entra Admin Center](https://entra.microsoft.com)
2. Navigate to **Groups > All groups**
3. Click **+ New group**
4. Fill in the group details:
   - **Group type**: Security
   - **Group name**: `Group 3`
   - **Group description**: (Optional) Entra group for User11–User19
   - **Membership type**: Assigned
5. Click **Create**

*Note: Group creation may take a few seconds to reflect.*
<img width="1665" height="857" alt="image" src="https://github.com/user-attachments/assets/6d3aa837-0e66-47da-ada3-b7ad703106ed" />

Similarly, you can create **Microsoft 365 Groups** by selecting **Microsoft 365** as the **Group type** during creation.  
These groups are typically used for collaborative workloads such as Microsoft Teams, SharePoint, and Outlook.

---

### 2. Add Members to the Group

1. Open the newly created group `Group 3`
2. Go to **Members** in the left panel
3. Click **+ Add members**
4. In the search bar, find and select each of the following users:
   - `User11@AshDC454.onmicrosoft.com`
   - `User12@AshDC454.onmicrosoft.com`
   - `User13@AshDC454.onmicrosoft.com`
   - `User14@AshDC454.onmicrosoft.com`
   - `User15@AshDC454.onmicrosoft.com`
   - `User16@AshDC454.onmicrosoft.com`
   - `User17@AshDC454.onmicrosoft.com`
   - `User18@AshDC454.onmicrosoft.com`
   - `User19@AshDC454.onmicrosoft.com`
5. We can add the owner also in this if we want to.
<img width="1447" height="775" alt="image" src="https://github.com/user-attachments/assets/5c4e39bb-a9c8-4b52-8af4-0cc79f42f159" />

---
