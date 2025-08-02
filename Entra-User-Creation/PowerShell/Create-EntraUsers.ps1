Connect-MgGraph -Scopes "User.ReadWrite.All"

$body = @{
    accountEnabled = $true
    displayName = "User4"
    mailNickname = "User4"
    userPrincipalName = "User4@AshDC454.onmicrosoft.com"
    passwordProfile = @{
        password = "P@ssword@2025"
        forceChangePasswordNextSignIn = $true
    }
}

New-MgUser -BodyParameter $body
