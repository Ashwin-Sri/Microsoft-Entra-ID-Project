Connect-MgGraph -Scopes "User.ReadWrite.All"

$body = @{
    accountEnabled = $true
    displayName = "User04"
    mailNickname = "User04"
    userPrincipalName = "User04@AshDC454.onmicrosoft.com"
    passwordProfile = @{
        password = "P@ssword@2025"
        forceChangePasswordNextSignIn = $true
    }
}

New-MgUser -BodyParameter $body
