#  Enterprise App — MyPnPAppReg

This module documents the Enterprise Application view of `MyPnPAppReg`, used for app-only automation in Microsoft Entra ID.

##  Scope

- Review granted permissions
- Monitor sign-in activity
- Customize app settings

##  Tasks

| Task | Description 
|------|-------------
|  Review Permissions | Inspect granted Graph API scopes
|  Monitor Sign-ins | View token usage and activity
|  Customize Settings | Modify visibility and assignment flags


#  Review Permissions — MyPnPAppReg

## Goal
Confirm which Graph API permissions are granted to the app.

##  Steps

1. Go to **Entra ID > Enterprise Applications > MyPnPAppReg**
2. Select **Permissions** from the left pane
3. Review:
   - Application permissions (e.g., `User.Read.All`, `Directory.Read.All`)
   - Admin consent status (green check)
<img width="1562" height="777" alt="image" src="https://github.com/user-attachments/assets/c9725082-d7a2-463a-a84c-bffb748df50f" />

##  Notes

- These permissions were granted during app registration
- No delegated permissions should appear (app-only)

#  Monitor Sign-ins — MyPnPAppReg

## Goal
Track token usage and activity for the app.

## Steps

1. Go to **Enterprise Applications > MyPnPAppReg**
2. Select **Sign-in logs**
3. Filter by:
   - Date range
   - Status (Success/Failure)
   - App ID or user (if interactive)
<img width="1586" height="772" alt="image" src="https://github.com/user-attachments/assets/84855dba-113c-4eba-bcdc-b839a8d8dc4f" />

## Notes

- App-only tokens may not show detailed user context
- Useful for troubleshooting token failures or consent issues


#  Customize Settings — MyPnPAppReg

## Goal
Modify app-specific settings like visibility and assignment requirements.

## Steps

1. Go to **Enterprise Applications > MyPnPAppReg**
2. Select **Properties**
3. Review and configure:
   - `User assignment required` → Leave as **No** (app-only)
   - `Visible to users` → Optional
   - `Enabled for users to sign in` → Leave as **Yes**
<img width="1231" height="791" alt="image" src="https://github.com/user-attachments/assets/1278061a-2883-479a-b70f-96c34f449240" />

## Notes

- These settings mostly affect interactive apps
- For app-only use, minimal changes are needed

