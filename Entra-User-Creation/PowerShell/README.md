## Microsoft Entra ID – User Creation via PowerShell

This task demonstrates how to create a new cloud-only user in Microsoft Entra ID using PowerShell and Microsoft Graph SDK.

PowerShell is used to define user properties like display name, user principal name, mail nickname, and password. The account is created by passing this data to Microsoft Graph using the `New-MgUser` command.

The Graph module is first installed and imported if not already present. A connection to Microsoft Graph is then established using the scope `User.ReadWrite.All`.

In this example, the user created is:

- Display Name: User4  
- User Principal Name: `User4@AshDC454.onmicrosoft.com`
- Mail Nickname: User4  
- Password: P@ssword@2025  
- Force password change at next sign-in: Enabled

After successfully running the script, the user4 is added to Microsoft Entra ID and can be verified from the Entra admin portal under -Users--All Users.
-
<img width="906" height="212" alt="image" src="https://github.com/user-attachments/assets/6a1671a4-bbf7-430a-833d-129fc1a0307f" />
