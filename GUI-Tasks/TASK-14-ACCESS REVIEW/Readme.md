# Task 14 – Microsoft Entra ID: Access Reviews

## Definition

Access Reviews in Microsoft Entra ID allow administrators to periodically evaluate whether users should retain access to specific resources—such as group memberships, role eligibility, or application assignments. Reviews can be scheduled or one-time, and decisions can be made by admins, group owners, or users themselves. This supports least privilege enforcement and compliance-driven access governance.

---

## Objective

This task demonstrates how to configure and run Access Reviews to validate user access to Microsoft 365 groups. The goal is to reduce stale permissions, enforce governance, and automate access cleanup.

---

## Prerequisites

- Microsoft Entra ID P2 license assigned to reviewer and target users
- Admin access to Microsoft Entra admin center
- At least one Microsoft 365 group with members assigned

---

## Features Implemented

- One-time access review for group membership
- Reviewer assignment (self-review or admin)
- Decision helper (last sign-in visibility)
- Post-review action: remove access if not reviewed

---

## Navigation Path

1. Go to [https://entra.microsoft.com](https://entra.microsoft.com)
2. Navigate to:  
   `Identity Governance > Access Reviews`

---

## Step-by-Step Guide

### 1. Create an Access Review

- Click **+ New access review**
  
  <img width="1640" height="852" alt="image" src="https://github.com/user-attachments/assets/a2ade8ab-28b7-4121-b905-cce0bba6bfba" />
  
- Select what to review: `Teams + Groups`
- Scope: Select a group (e.g., "M365 Group 1")

  <img width="1057" height="780" alt="image" src="https://github.com/user-attachments/assets/e8f41bae-761b-438e-b9ca-3f283d85231e" />

- Reviewers: Choose `Group Owners`
- Duration: Set review period (e.g., 3 days)

  <img width="837" height="693" alt="image" src="https://github.com/user-attachments/assets/55281075-f333-432a-8c51-75dff927ac1b" />

- Decision helpers: Enable `Show sign-in activity`
- Auto apply results: Enable `Remove access if not approved`

  <img width="650" height="777" alt="image" src="https://github.com/user-attachments/assets/0ebd8dc6-c8e9-4f73-99c5-bdd334d757f7" />

- Click **Create**

  <img width="1597" height="495" alt="image" src="https://github.com/user-attachments/assets/f0363b2d-d74f-45ac-856e-f7a167cafa01" />

---

### 2. Review Access as a User

- Sign in as a group member
- Go to:  
  `https://myaccess.microsoft.com`
- Locate the active review
- Select Details from the right hand side of the Active Review
- Review your access → Approve or Deny

 <img width="1883" height="702" alt="image" src="https://github.com/user-attachments/assets/99f8c8fd-bf45-44b7-be3b-afadf7c195c0" />

 <img width="551" height="812" alt="image" src="https://github.com/user-attachments/assets/87da831d-38d1-448f-a207-b2dd6e36e619" />

---

### 3. Monitor Review Progress

- Return to:  
  `Identity Governance > Access Reviews`
- Select the review → View progress
- See decisions, pending reviews, and sign-in data

<img width="1532" height="368" alt="image" src="https://github.com/user-attachments/assets/4a127081-98b7-4cea-b84b-e61ac4e44aab" />

---

### 4. Apply Results

  - After review period ends:
  - Decisions are auto-applied (if configured)
  - Users not reviewed or denied are removed from the group
  - Audit logs reflect changes

   In this validation, I acted as both the group owner and assigned reviewer, completing the review via My Access.
   
   <img width="1560" height="412" alt="image" src="https://github.com/user-attachments/assets/f75be834-1259-4ac7-bf0f-1baff13b7b7b" />

---

## Outcome

- Group membership validated via access review
- Inactive or unreviewed users removed automatically
- Access governance enforced with audit traceability

---

> 🔒 Note: Access Reviews require Microsoft Entra ID P2 licensing for both reviewers and target users. In production, reviews should be scheduled periodically to maintain least privilege.
