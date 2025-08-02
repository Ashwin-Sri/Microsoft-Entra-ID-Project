## Microsoft Entra ID – User Creation via PowerShell

This task demonstrates how to create a new cloud-only user in Microsoft Entra ID using PowerShell and Microsoft Graph SDK.

PowerShell is used to define user properties like display name, user principal name, mail nickname, and password. The account is created by passing this data to Microsoft Graph using the `New-MgUser` command.

The Graph module is first installed and imported if not already present. A connection to Microsoft Graph is then established using the scope `User.ReadWrite.All`.

In this example, the user created is:

- Display Name: User4  
- User Principal Name: `User04@AshDC454.onmicrosoft.com`  
- Mail Nickname: User04  
- Password: P@ssword@2025  
- Force password change at next sign-in: Enabled

After successfully running the script, the user4 is added to Microsoft Entra ID and can be verified from the Entra admin portal under -Users--All Users.

<img width="906" height="212" alt="image" src="https://github.com/user-attachments/assets/6a1671a4-bbf7-430a-833d-129fc1a0307f" />

---

## Microsoft Entra ID – Bulk User Creation via PowerShell and CSV

This task demonstrates how to create multiple cloud-only users in Microsoft Entra ID using PowerShell, the Microsoft Graph SDK, and a CSV input file.

The script reads user data from a file named `users.csv`, which includes values for display name, user principal name, mail nickname, and password. Each user entry is processed in a loop, and accounts are created by passing the data to the `New-MgUser` command.

The Graph module must be installed and imported beforehand, and a connection to Microsoft Graph is established using the scope `User.ReadWrite.All`.

In this example, 15 users (User5 to User19) are created using consistent password values and account settings. Each user is configured to reset their password on first sign-in.

The script file `CreateBulkUsers.ps1` and the `bulk users creations.csv` file are located in the same folder.

This setup helps automate bulk onboarding of users efficiently using Microsoft Entra ID and PowerShell.
