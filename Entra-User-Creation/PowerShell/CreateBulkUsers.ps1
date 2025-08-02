# Connect to Microsoft Graph with required permission
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Import users from the CSV file
$users = Import-Csv -Path "C:\Users\Desktop\ENTRA\02-User-Creation-PowerShell\Bulk users creations.csv"

# Loop through each user and create the account
foreach ($user in $users) {
    $body = @{
        accountEnabled = $true
        displayName = $user.displayName
        mailNickname = $user.mailNickname
        userPrincipalName = $user.userPrincipalName
        passwordProfile = @{
            password = $user.password
            forceChangePasswordNextSignIn = $true
        }
    }

    try {
        New-MgUser -BodyParameter $body
        Write-Host "Created: $($user.userPrincipalName)" -ForegroundColor Green
    }
    catch {
        Write-Host "Error creating $($user.userPrincipalName): $_" -ForegroundColor Red
    }
}
