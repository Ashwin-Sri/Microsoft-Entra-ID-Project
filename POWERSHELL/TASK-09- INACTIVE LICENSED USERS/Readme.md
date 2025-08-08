# Get-InactiveLicensedUsers

## Overview

This PowerShell script identifies **licensed users in Microsoft Entra ID** who have not signed in for a specified number of days. It uses **app-only authentication** with the Microsoft Graph API and exports the results to a CSV file.

Designed for automation, reporting, and compliance tasks, this script is modular, reusable, and ready for scheduled execution.

---

## Features

- App-only authentication using client credentials
- Fetches licensed users with sign-in activity via Microsoft Graph `/beta`
- Filters users based on inactivity threshold
- Exports results to CSV
- Beginner-proof parameterization with inline guidance
- Modular functions for reuse and extension

---

## Inputs

These parameters must be provided when running the script:

| Parameter      | Description |
|----------------|-------------|
| `TenantId`     | Your Entra ID tenant GUID (e.g., `72f988bf-xxxx-xxxx-xxxx-xxxxxxxxxxxx`) |
| `ClientId`     | App registration's client ID |
| `ClientSecret` | App registration's client secret |
| `InactiveDays` | Number of days since last sign-in to consider a user inactive |
| `OutputPath`   | Full path to save the CSV output (e.g., `C:\Reports\InactiveUsers.csv`) |

---

## App Registration Requirements

Ensure your app registration has the following:

- **API Permissions** (Application type):
  - `User.Read.All`
  - `Directory.Read.All`
- **Admin Consent** granted
- **Entra ID P1 or P2 license** (required for `signInActivity` property)

---

### Run from PowerShell:

```powershell
.\Get-InactiveLicensedUsers.ps1 `
    -TenantId "72f988bf-xxxx-xxxx-xxxx-xxxxxxxxxxxx" `
    -ClientId "11111111-2222-3333-4444-555555555555" `
    -ClientSecret "your-client-secret-here" `
    -InactiveDays 90 `
    -OutputPath "C:\Reports\InactiveUsers.csv"
```
---

## 🔐 Credential Handling

This script uses a `param` block to accept credentials as input.  
For security reasons, no secrets are hardcoded or stored in the repo.  
If you're testing locally, provide your `TenantId`, `ClientId`, and `ClientSecret` manually when running the script.

This repo is for showcasing automation logic — not for sharing production-ready secrets or modules.
