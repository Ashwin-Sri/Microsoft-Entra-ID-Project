# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Import users from the CSV file
$users = Import-Csv ".\users.csv"

# Loop through each user and update their properties
foreach ($user in $users) {
    Write-Host "Updating: $($user.UserPrincipalName)" -ForegroundColor Cyan

    Set-MgUser -UserId $user.UserPrincipalName `
        -JobTitle $user.JobTitle `
        -Department $user.Department `
        -OfficeLocation $user.OfficeLocation
}
