# Connect to Microsoft Graph (interactive sign-in)
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Set the user UPN
$userUPN = "User11@AshDC454.onmicrosoft.com"

# Update the user's properties
Set-MgUser -UserId $userUPN `
    -JobTitle "IT Support Engineer" `
    -Department "IT Services" `
    -OfficeLocation "Chennai HQ"

# Optional: Verify the update
Get-MgUser -UserId $userUPN | Select-Object DisplayName, JobTitle, Department, OfficeLocation
