# Conditional Access Policy – Require MFA for All Users

## Objective

Enforce **Multi-Factor Authentication (MFA)** for all users in **Group 3** when accessing Microsoft 365 cloud applications.

---

## Scenario

- Target: **Group 3**
- Cloud apps: **All cloud apps**
- Control: **Require MFA**
- Condition: **Always enforced** (no exceptions for location or device)

---

## Steps Performed

### 1. Sign in to Microsoft Entra Admin Center

- URL: [https://entra.microsoft.com](https://entra.microsoft.com)

---

### 2. Go to Conditional Access

- Navigate to: Left panel > Conditional Access**
- Click: **+ Create new policy**

---

### 3. Name the Policy

- Policy name: `Require MFA for All Users`

---

### 4. Assign Users

- Under **Assignments > Users**:  
  - **Include**: Group 3  
  - **Exclude**: (Optional) Emergency or Break Glass accounts
<img width="1187" height="838" alt="image" src="https://github.com/user-attachments/assets/258e529d-a55c-4122-9b1a-b1679c6ebca2" />

---

### 5. Assign Cloud Apps

- Under **Resources (formerly cloud apps)**:  
  - **Select Resources:Edit Filter> select> (office 365)**
<img width="1313" height="735" alt="image" src="https://github.com/user-attachments/assets/5129d8fc-4df6-4a87-baf1-a0dd671a876b" />

---

### 6. Access Controls

- Go to: **Grant > Grant access**  
  - Select: **Require multi-factor authentication**
  - Click: **Select**
<img width="1911" height="800" alt="image" src="https://github.com/user-attachments/assets/6bbcb569-9ec7-42e0-8352-54286476d401" />

---

### 7. Enable and Create Policy

- Set **Enable Policy**: `On`
- Click **Create**
<img width="648" height="861" alt="image" src="https://github.com/user-attachments/assets/eb14ee1e-c3d3-47cd-92a7-53d4274ce265" />

---

## Verification

- Sign in using a test user from Group 3
- Confirm that an MFA prompt is triggered during login
- Testing with User11 from Group 3 by signing in to Teams. Then proceed with Microsoft Authenticator procedure to set up the MFA.
<img width="997" height="526" alt="image" src="https://github.com/user-attachments/assets/577334cb-346e-4123-86ff-73efb56d5488" />

---

## Note

- Testing with a limited group (e.g., Group 3) prevents accidental lockouts.
- Always exclude break-glass accounts when deploying broad MFA enforcement.
