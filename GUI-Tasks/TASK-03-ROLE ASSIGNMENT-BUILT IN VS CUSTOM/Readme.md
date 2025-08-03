### Role Assignment to User

To assign admin roles to a user (User1) in Microsoft Entra using the Entra admin portal.


###  Steps Performed:

1. **Login to Microsoft Entra admin portal**  
   [https://entra.microsoft.com](https://entra.microsoft.com)

2. **Go to “Users”**  
   Navigated to: **Users > All Users > `User1@AshDC454.onmicrosoft.com**`

3. **Open 'Assigned roles'**  
   - Selected the user  
   - Clicked on **"Assigned roles"** from the left-hand menu

4. **Click “+ Add assignment”**
   - Clicked **“+ Add assignment”** at the top

5. **Assigned the following roles:**
   - **Password Administrator**
   - **Teams Communications Support Specialist**

6. **Confirmed Role Assignment**
   - Verified both roles were successfully assigned to the user

---

### Verification:

- Navigated back to **“Assigned roles”** tab under User1's profile  
- Confirmed both roles are visible and active

---

### Screenshot:
<img width="1650" height="828" alt="image" src="https://github.com/user-attachments/assets/d2ad6337-0719-4c41-9571-149d6e5aaf8b" />

---

# Create Custom Role in Microsoft Entra ID

## Objective

Create a **Custom Role** in Microsoft Entra ID with specific permissions tailored to your organization’s needs.

---

## Steps

### 1. Navigate to Microsoft Entra Admin Center

- Open the [Microsoft Entra admin center](https://entra.microsoft.com)
- Click on **Roles and administrators** in the left-hand menu
- Click **+ New custom role**
<img width="1642" height="848" alt="image" src="https://github.com/user-attachments/assets/f7859cc2-eb1b-4ef4-a975-6ede729a1eaf" />

---

### 2. Define Custom Role Basics

- Enter a **Name** for the role (e.g., `Helpdesk Operator`)
- Add a **Description** (option) explaining the role’s purpose
- Click **Next**

---

### 3. Add Permissions

- Click **Add permissions**
- Search for and select the required permissions (e.g., `User.Read.All`, `User.ReadWrite.All`, `Directory.Read.All`)
- We have assigned these four permissions for the Role

                "microsoft.directory/devices/registeredUsers/read",
                "microsoft.directory/devices/registeredUsers/update",
                "microsoft.directory/users/ownedDevices/read",
                "microsoft.directory/users/registeredDevices/read"
- Click **Next**

---

### 4. Review and Create

- Review the role details
- Click **Create**

---

### 5. Assign the Custom Role to Users or Groups

The custom role exists but isn’t effective until assigned.

You assign the role to one or more users or groups who need those specific permissions.

Assignments can be done via:

-Microsoft Entra admin portal

-PowerShell scripts

-Microsoft Graph API

 For reference we have assgined this role to `User 19`
 
 <img width="1658" height="857" alt="image" src="https://github.com/user-attachments/assets/1c5e3c9c-6338-46ec-a2fe-aecabbd67b87" />

---

## Notes

- Custom roles allow granular control by specifying only the permissions your organization requires.
- Follow the principle of least privilege when assigning permissions.
