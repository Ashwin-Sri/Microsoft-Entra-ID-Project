# Conditional Access Policy – Block Access from Non-Compliant Devices

## Objective

Block access to Microsoft 365 resources for users signing in from devices that are **not compliant** with Intune policies.

---

## Scenario

- Target: **Group 3** (example group)
- Cloud apps: **All cloud apps**
- Condition: **Device compliance**
- Access Control: **Block access** for non-compliant devices

---

## Steps Performed

### 1. Sign in to Microsoft Entra Admin Center

- URL: [https://entra.microsoft.com](https://entra.microsoft.com)

---

### 2. Go to Conditional Access

- Navigate to **Protection > Conditional Access**
- Click **+ Create new policy**

---

### 3. Name the Policy

- Enter a name: `Block Non-Compliant Devices`

---

### 4. Assign Users

- Under **Assignments > Users**:
  - **Include**: Group 3 (or the test group you're using)
  - **Exclude**: (Optional) Break-glass accounts

---

### 5. Assign Cloud Apps

- Under **Assignments > Cloud apps**:
  - Select: **All cloud apps**
<img width="771" height="757" alt="image" src="https://github.com/user-attachments/assets/3bc6a76b-1550-4723-9397-8e432fb9a71c" />

---

### 6. Conditions – Device Filter

- Go to **Conditions > Filter for devices**
- Set **Configure** to: `Yes`
- Set **Devices matching the rule** to: `Exclude filtered devices from policy`
- Add the following filter:
  - **Property**: `IsCompliant`
  - **Operator**: `Equals`
  - **Value**: `True`

This will apply the policy only to **non-compliant or unmanaged devices**, effectively **blocking access from personal/unregistered systems**.
<img width="1017" height="787" alt="image" src="https://github.com/user-attachments/assets/ecfa5e85-6236-4254-9929-959a79bc48ab" />

---

### 7. Access Controls

- Under **Grant**:
  - Select: **Block access**
  - Click: **Select**

---

### 8. Enable and Create

- Set **Enable policy**: `On`
- Click **Create**
<img width="500" height="757" alt="image" src="https://github.com/user-attachments/assets/f2c9ab8b-be6f-48e9-a170-b2a5638421ae" />

---

## Verification

### Method 1 – Incognito Browser on Personal Device

1. Open a private/incognito browser session on a **personal or unmanaged desktop**
2. Navigate to: [https://portal.office.com](https://portal.office.com)
3. Sign in using a **Group 3 test user**
4. You should see a message like:

> "You can't get there from here"  
> or  
> "Your sign-in was blocked due to conditional access"

---

## Screenshot

<img width="646" height="556" alt="image" src="https://github.com/user-attachments/assets/d6f9202b-8af5-42a6-bfce-a615b999de2b" />

---

## Note

- This policy ensures only **Intune-compliant devices** can access cloud resources
- Test thoroughly with non-production users/devices before applying to all users
- Always exclude **Break Glass accounts** to avoid lockout

## X Conditional Access Conflicts
If multiple Conditional Access policies apply to the same user, conflicting settings (e.g., one requiring MFA and another blocking access) can prevent policies from working as expected.
Always review existing policies to avoid overlaps or contradictions.
