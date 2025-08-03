Connect-MgGraph -Scopes "User.ReadWrite.All"

$users = Import-Csv -Path "C:\Users\Desktop\ENTRA\02-User-Creation-PowerShell\bulk users creations.csv"

foreach ($user in $users) {
    $body = @{
        accountEnabled = $true
        displayName = $user.DisplayName
        mailNickname = $user.MailNickname
        userPrincipalName = $user.UserPrincipalName
        passwordProfile = @{
            password = $user.Password
            forceChangePasswordNextSignIn = $true
        }
    }

    New-MgUser -BodyParameter $body
}
