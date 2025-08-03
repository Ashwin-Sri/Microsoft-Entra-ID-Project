Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.Read.All"

$userUPN = "user11@AshDC454.onmicrosoft.com"

# Get the user
$user = Get-MgUser -Filter "userPrincipalName eq '$userUPN'"
$userId = $user.Id

# Set usage location (e.g., India)
Update-MgUser -UserId $userId -UsageLocation "IN"

# Get SKU ID for Business Premium
$skuId = (Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "SPB" }).SkuId

# Assign license
Set-MgUserLicense -UserId $userId `
    -AddLicenses @{ SkuId = $skuId } `
    -RemoveLicenses @()
