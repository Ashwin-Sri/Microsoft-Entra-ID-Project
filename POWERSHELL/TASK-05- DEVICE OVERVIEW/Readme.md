# Task 09: View Registered Devices via PowerShell

## Objective

Use Microsoft Graph PowerShell to **list and analyze registered devices** in Microsoft Entra ID. This helps in device inventory tracking, compliance monitoring, and supporting Conditional Access policies.

---

## Prerequisites

- Microsoft Graph PowerShell SDK installed  
- Connect to Microsoft Graph with the necessary scopes:
  - `Device.Read.All`
  - `Directory.Read.All`

>  Requires an account with **Global Administrator** or **Cloud Device Administrator** role.

---

## Script: View Registered Devices

```powershell
# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Device.Read.All", "Directory.Read.All"

# Retrieve all registered devices
$devices = Get-MgDevice -All

# Display relevant details
$devices | Select-Object DisplayName, OperatingSystem, DeviceId, TrustType, IsCompliant, IsEnabled
```

<img width="976" height="732" alt="image" src="https://github.com/user-attachments/assets/4f79fa70-306a-4f5f-81b7-7660e94c9fdf" />

---
