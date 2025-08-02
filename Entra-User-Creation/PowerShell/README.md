## 🎯 Objective  
Create a new Microsoft Entra ID cloud-only user account using PowerShell and Microsoft Graph.

## 🛠️ Steps Performed

1. Opened PowerShell as Administrator  
2. Installed Microsoft Graph module:  
   Install-Module Microsoft.Graph -Scope CurrentUser  
   Import-Module Microsoft.Graph  
3. Connected to Graph:  
   Connect-MgGraph -Scopes "User.ReadWrite.All"  
4. Created user:  
   New-MgUser -AccountEnabled $true `
   -DisplayName "User4" `
   -MailNickname "User4" `
   -UserPrincipalName "User4@AshDC454.onmicrosoft.com" `
   -PasswordProfile @{ ForceChangePasswordNextSignIn = $true; Password = "DemoP@ssword123" } `
   -UsageLocation "IN"  
5. Verified user in Entra Admin Center.
