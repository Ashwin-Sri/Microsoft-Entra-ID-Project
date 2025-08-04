# Major Conditional Access Policies (Reference List)

This document outlines the most commonly implemented Conditional Access (CA) policies in Microsoft Entra ID (formerly Azure AD). These are used to strengthen security, protect identities, and manage access in enterprise environments.

---

## 1. Require MFA for All Users

- **Users**: All users or specific security groups
- **Cloud Apps**: All cloud apps
- **Control**: Require multi-factor authentication (MFA)
- **Condition**: Always
- **Notes**: Exclude break-glass accounts

---

## 2. Require MFA for Admin Roles

- **Users**: Directory roles (Global Admin, Intune Admin, SharePoint Admin, etc.)
- **Cloud Apps**: All apps
- **Control**: Require MFA
- **Condition**: Always
- **Notes**: Protects privileged roles from compromise

---

## 3. Block Legacy Authentication

- **Users**: All users
- **Client Apps**: Legacy authentication clients (e.g., SMTP, POP, IMAP)
- **Control**: Block access
- **Notes**: Prevents sign-in from older, less secure protocols

---

## 4. Block Access from Untrusted Countries

- **Users**: All users or specific groups
- **Location**: Include Any, Exclude Trusted IP ranges or Named Locations (e.g., India HQ)
- **Control**: Block access
- **Notes**: Helps mitigate attacks from known risky geographies

---

## 5. Require Compliant or Hybrid Azure AD Joined Device

- **Users**: All or selected
- **Cloud Apps**: All or selected (e.g., SharePoint, Teams)
- **Device Platform**: All
- **Control**: Require compliant device / hybrid joined
- **Notes**: Ensures access only from managed or domain-joined devices

---

## 6. Require Password Change on Risky Sign-in

- **Users**: All users
- **Sign-in Risk**: Medium and above
- **Control**: Require password change
- **Notes**: Works with Microsoft Defender for Identity and Identity Protection

---

## 7. Block Access for Guest Users Except Browser

- **Users**: Guest and external users
- **Client Apps**: Exclude browser, block others (e.g., mobile, desktop)
- **Control**: Block non-browser clients
- **Notes**: Restricts guests to web-only access

---

## 8. Require Terms of Use Before Access

- **Users**: All users or external users
- **Apps**: All
- **Control**: Require acceptance of Terms of Use
- **Notes**: Used in regulated industries or for external collaboration

---

## 9. Require MFA for High-Risk Sign-ins

- **Users**: All users
- **Sign-in Risk**: High
- **Control**: Require MFA
- **Notes**: Depends on Microsoft Entra ID P2 for risk-based conditions

---

## 10. Block Personal Device Access to Sensitive Apps

- **Users**: All or selected
- **Apps**: Selected (e.g., Exchange Online, SharePoint)
- **Device State**: Require compliant
- **Control**: Block if non-compliant
- **Notes**: Prevents data leaks via personal devices

---

## ⚠️ Best Practices

- Start with **report-only** mode for testing
- Always **exclude break-glass accounts**
- Combine with **Named Locations**, **Device Compliance**, and **User Risk**
- Document each policy’s **impact and exclusions**

