# Sign-in Logs and Audit Logs Review

## Objective

Explore and understand how to access and review **Sign-in logs** and **Audit logs** in Microsoft Entra ID for security monitoring and troubleshooting purposes.

---

## Scenario

- View recent user sign-in attempts
- Filter logs based on user or application
- Export sign-in and audit data
- Understand what actions were taken (e.g., login success, MFA required, group changes, etc.)

---

## Steps Performed

### 1. View Sign-in Logs

- Go to **Microsoft Entra Admin Center**: [https://entra.microsoft.com](https://entra.microsoft.com)
- Navigate to: **Monitoring** > **Sign-in logs**
  <img width="1567" height="532" alt="image" src="https://github.com/user-attachments/assets/ba6fc9a4-f091-4211-b8f2-860bd368ec39" />
- Click on a record to see:
  - Authentication Details (MFA status, method used)

  <img width="1046" height="425" alt="image" src="https://github.com/user-attachments/assets/ccac968d-89c1-4f70-a700-1b32dd577264" />
  - Conditional Access policies applied

  - <img width="1056" height="452" alt="image" src="https://github.com/user-attachments/assets/fa28e075-61b2-488a-8b0e-4acb25e3af58" />

  - Device info, client app, location

---

### 2. View Audit Logs

- Navigate to: **Monitoring** > **Audit logs**
<img width="1518" height="761" alt="image" src="https://github.com/user-attachments/assets/e0c8f3d0-ba80-4aab-9e3c-224773842e8b" />

- **Overview**:
  - <img width="695" height="796" alt="image" src="https://github.com/user-attachments/assets/1f421229-2077-4f40-9f3c-17bf13bd8759" />
  - Click on a log entry to view:
  - Target resource
  - Activity name
  - Initiated by
  - Correlation ID and detailed JSON for troubleshooting
<img width="1021" height="545" alt="image" src="https://github.com/user-attachments/assets/3810ae99-edc1-4ea2-9753-b86d83404fb3" />

---

### 3. Export Logs (Optional)

- In **Sign-in logs** or **Audit logs**, click **Download** to export data as `.csv`
- Use Excel or Power BI for deeper analysis

---
