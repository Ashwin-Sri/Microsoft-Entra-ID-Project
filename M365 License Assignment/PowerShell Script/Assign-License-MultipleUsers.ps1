Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.Read.All"

$skuId = (Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "SPB" }).SkuId

$userUPNs = @(
    "user12@AshDC454.onmicrosoft.com",
    "user13@AshDC454.onmicrosoft.com"
)

foreach ($userUPN in $userUPNs) {
    try {
        $user = Get-MgUser -Filter "userPrincipalName eq '$userUPN'"
        $userId = $user.Id

        Update-MgUser -UserId $userId -UsageLocation "IN"

        Set-MgUserLicense -UserId $userId -AddLicenses @{ SkuId = $skuId } -RemoveLicenses @()

        Write-Host "License assigned to $userUPN"
    }
    catch {
        Write-Warning "Failed to process ${userUPN}: $_"
    }
}
