# Microsoft Entra ID – View Registered Devices

##  Objective

Understand how to view, analyze, and manage **registered devices** in Microsoft Entra ID using the portal interface. This is useful for auditing, compliance, Conditional Access, and device-based access policies.

---

##  Steps to View Devices in Microsoft Entra Admin Center

### 1. Sign in to Microsoft Entra Admin Center
- URL: [https://entra.microsoft.com](https://entra.microsoft.com)
- Login with an account that has Global Administrator or Cloud Device Administrator role.

---

### 2. Go to Devices
- In the left navigation panel, go to:
  **Identity > Devices**

---

### 3. View the List of Registered Devices
- You will see a grid displaying:
  - **Device Name**
  - **Join Type** (Azure AD Joined / Hybrid Azure AD Joined / Registered)
  - **Registration Date**
  - **Compliance Status**
  - **Owner**
  - **MDM Enrollment**
  - **Enabled / Disabled Status**

<img width="1596" height="463" alt="image" src="https://github.com/user-attachments/assets/04d664c2-22af-4dda-91a4-b199f7f45717" />

The above snap show two Windows 10 VMs have different icons: DESKTOP-JMBQCVL (Autopilot) shows a distinct icon
while DESKTOP-2PJV5CO (normal device) displays the standard one.
 
---

### 4. Click on a Device for More Details
- Click a device name to open detailed info:
  - **Device ID**
  - **Operating System**
  - **BitLocker Status**
  - **MDM Provider**
  - **Last Sign-in / Check-in Time**
  - **Associated User**
  - **Device Trust Type** (Workplace Join, Azure AD Join)

<img width="981" height="687" alt="image" src="https://github.com/user-attachments/assets/590d05ff-1c35-4aeb-ad53-4625e862d9cf" />

---

### 5. (Optional) Disable or Delete Devices
- Select the device > Click **… (More)** > Choose:
  - **Disable** – Prevents sign-in from this device.
  - **Delete** – Removes the device from Entra ID.

#### Entra ID Device Deletion Summary

* **Autopilot Devices:** Cannot be deleted directly from Entra ID. **Must be removed from Intune's Windows Autopilot Devices section first.**
* **Normal Devices:** Can be deleted directly from the Entra ID "All devices" list.
---

## Use Cases

- Monitor what devices are registered to your directory.
- Ensure users are signing in from **trusted and compliant** devices.
- Use device data in **Conditional Access policies**.
- Audit user activity across devices.

---

## Notes

- Devices are added through Azure AD Join, Intune MDM enrollment, or manual registration.
- Only **user-associated devices** appear under Identity > Devices.
- Join types:
  - **Azure AD Joined** – Typically corporate-owned, Intune-managed.
  - **Registered** – BYOD (personal devices).
  - **Hybrid Azure AD Joined** – Domain-joined with cloud sync.

---
