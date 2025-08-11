#  Task 13 – Microsoft Entra ID: Privileged Identity Management (PIM)
   Privileged Identity Management (PIM) is a feature in Microsoft Entra ID that enables organizations to manage, control, and monitor access to privileged roles. Instead of granting permanent admin rights, PIM allows users to be assigned as eligible for roles, which they can activate temporarily when needed.
   
   PIM enforces just-in-time (JIT) access, requiring users to complete conditions such as multi-factor authentication (MFA), justification, and optionally approval before activating a role. It also provides audit logs, notifications, and access reviews to support governance and reduce standing privilege.

##  Objective
This task demonstrates how to configure **Privileged Identity Management (PIM)** in **Microsoft Entra ID** to enforce **just-in-time (JIT)** access to administrative roles. The goal is to reduce standing privilege and implement strong access governance.

---

##  Prerequisites

-  Microsoft Entra ID P2 license assigned to your user
-  Admin access to Microsoft Entra admin center
-  Role management permissions (e.g., Global Admin or Privileged Role Admin)

---

##  Features Implemented

- Time-bound access to Entra roles
- Role activation with MFA & justification
- Audit logs and alerts

---

##  Step-by-Step Guide

### 1 Access the PIM Dashboard in Entra

- Open the **Entra admin center**
- Navigate to:

  Identity Governance > Privileged Identity Management`

- You’ll see three areas:
  - Microsoft Entra roles
  - Groups
  - Azure resources 
    
---

### 2 Assign a Role

1. In PIM, select **Microsoft Entra roles**>**Roles**
2. Go to **Add assignments**
3. Choose a role (e.g., Global Administrator or Security Administrator)
4. Set the **Assignment type** to `Eligible`
5. Choose the user (yourself or another test user)
6. Click **Assign**
   
<img width="1645" height="852" alt="image" src="https://github.com/user-attachments/assets/afac20fb-de2a-4d86-b03a-9569a6fd26c2" />

7. Here we have assigned a role (Security Administrator to User1)
   
<img width="1546" height="613" alt="image" src="https://github.com/user-attachments/assets/dc4d697d-d5bb-49b2-ba2a-c04ef76a63ce" />

---

### 3 Configure Role Activation Policies

1. In PIM, go to **Settings**
2. Choose the role you assigned (e.g., Security Administrator)

   <img width="1552" height="775" alt="image" src="https://github.com/user-attachments/assets/f84e97f6-f8cc-4a03-96f0-1b532df72ced" />

4. Configure:
   
   - **Activation duration** (e.g., 1 hour)
   - **Require MFA** 
   - **Require justification** 
   - **Require approval to activate** (optional)
   - **Notification settings** 

   <img width="1120" height="848" alt="image" src="https://github.com/user-attachments/assets/a40427d9-6418-40ec-96f9-270d6012a2da" />

---

### 4 Test Role Activation as End User

1. Sign in to https://entra.microsoft.com as User1
2. Go to **My roles > Microsoft Entra roles**
3. Under **Eligible roles**, find the assigned role
4. Click **Activate**
5. Enter:
   - Justification
   - Complete MFA if prompted
   - Submit for approval if required

 <img width="1916" height="855" alt="image" src="https://github.com/user-attachments/assets/a9e8e42b-6c61-473c-8a3c-cc1e80ab274e" />

6. After approval (if configured), the role becomes active for the defined duration.

7. Here the below snap shows testing for Groups Administrator approval request

 <img width="1566" height="687" alt="image" src="https://github.com/user-attachments/assets/fc8f444f-c1e6-4995-8e81-337c7efe8e41" />

 <img width="1915" height="851" alt="image" src="https://github.com/user-attachments/assets/0c6b4a62-554f-4932-a903-0f36430ab9b1" />

---

### 5 Monitor Role Activity

1. Navigate to:

   `Identity Governance > Privileged Identity Management > Microsoft Entra roles > Audit history`

2. Review:
   - Who activated which roles
   - Justifications
   - Duration
   
<img width="1785" height="805" alt="image" src="https://github.com/user-attachments/assets/b88b27ec-1c60-4de6-be2e-63649deda6fd" />

---

##  Outcome

By completing this task, the following objectives were achieved:

-  Enabled just-in-time access for admin roles
-  Enforced MFA and justifications
-  Reduced standing privilege
-  Enabled auditability and governance over role usage

---
