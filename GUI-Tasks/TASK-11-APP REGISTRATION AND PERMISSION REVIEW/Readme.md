# Module: App Registration & Permission Review

## Purpose
Manual app registration in Entra ID to understand identity setup, permissions, and token prerequisites.

## Part 1: Create New App
1. Register app in Entra portal
 <img width="1650" height="850" alt="image" src="https://github.com/user-attachments/assets/e74bc32c-9d26-4856-a15f-87b86d1ae526" />
 
 <img width="1372" height="857" alt="image" src="https://github.com/user-attachments/assets/8bc9cc45-7b25-4eb7-83de-44b526bbfc04" />

---

## Part 2: Review Existing App — `MyPnPAppReg`
- Confirm App ID and Tenant ID
  
  <img width="1656" height="726" alt="image" src="https://github.com/user-attachments/assets/35d46539-01d2-49bb-a611-409036b06589" />

- Validate client secret and expiry

  <img width="1563" height="817" alt="image" src="https://github.com/user-attachments/assets/51dce661-fbe1-435c-9779-9caac440dfc7" />

- Review assigned Graph API permissions and Ensure admin consent is granted

  <img width="1462" height="772" alt="image" src="https://github.com/user-attachments/assets/54068e73-dff2-4cf7-bb99-651d432aeb5c" />
 
- Inspect manifest for permission structure

  This manifest block shows delegated Microsoft Graph permissions (`type: Scope`) such as `User.Read.All`, `AuditLog.Read.All`, and `Directory.Read.All`. For app-only automation, consider switching to `type: Role`.

   <img width="1598" height="767" alt="image" src="https://github.com/user-attachments/assets/5a2c003e-abff-433b-9945-fa74ba5ada08" />

---

## Notes
- Use `Application (client) ID` and `Directory (tenant) ID` in automation scripts
- Secret must be copied immediately — not retrievable later
- Permissions must match token request type (delegated vs app-only)
