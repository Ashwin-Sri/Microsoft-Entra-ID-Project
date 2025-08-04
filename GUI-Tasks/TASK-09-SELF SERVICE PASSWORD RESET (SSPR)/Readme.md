# Self-Service Password Reset (SSPR) Setup and Testing

## Objective

Enable and configure **Self-Service Password Reset (SSPR)** for users in Microsoft Entra ID, and test the end-user experience.

---

## Scenario

- Apply SSPR policy to a specific group (e.g., **Group 3**).
- Require users to register at least one authentication method.
- Verify that users can reset their password without administrator intervention.

---

## Steps Performed

### 1. Assign Users to SSPR

- Sign in to **Microsoft Entra Admin Center**: [https://entra.microsoft.com](https://entra.microsoft.com)
- In the Left panel select: **Password reset**
- Set **Self-service password reset enabled** to: `Selected`
- Under **Select group**, choose: `Group 3`
- Click **Save**
<img width="1177" height="718" alt="image" src="https://github.com/user-attachments/assets/a0f243ae-0cf4-44d0-91c5-d90d930760b2" />

---

### 2. Configure Authentication Methods

- Go to: **Authentication methods** 
- Methods available to user: Security questions
- Note: **Authentication Methods for SSPR and Signin can now be managed in one converged policy**
- Number of questions required to register:3
- Number of questions required to reset:3
- Then select the security questions from pre defined set of questions.
- Click **Save**
<img width="1266" height="736" alt="image" src="https://github.com/user-attachments/assets/b3ba7bcc-28cf-4628-be31-ac35e1b5dceb" />

---

### 3. Register Authentication Info as End-User

- Sign in to: [https://mysignins.microsoft.com](https://mysignins.microsoft.com)
- Go to: **Security info**
- Add required authentication method(s)
<img width="525" height="421" alt="image" src="https://github.com/user-attachments/assets/9b717203-84f3-49e5-bd80-78dd5e9e278c" />
<img width="1312" height="791" alt="image" src="https://github.com/user-attachments/assets/c1c7cb98-3de5-45d2-a444-47f89e45bee6" />

---

### 4. Test Password Reset

- Go to: [https://passwordreset.microsoftonline.com](https://passwordreset.microsoftonline.com)
- Enter test user (e.g., **User11**)
- Follow the prompts to reset the password using the registered method

---

## Verification

- Reset is successful only if:
  - The user is part of the assigned SSPR group
  - At least one authentication method is registered
- You can verify registered methods via **Users > Authentication methods**

---

## Screenshot

<img width="615" height="513" alt="image" src="https://github.com/user-attachments/assets/d9048173-6a9e-481c-8fce-3003bf915b5e" />

---

## Notes

- If a user has not registered, they’ll be prompted during next sign-in.
- SSPR improves security and reduces helpdesk calls for password resets.
