$groupName = "Group 2"
$groupId = (Get-MgGroup -Filter "DisplayName eq '$groupName'").Id

if (-not $groupId) {
    Write-Error "Group '$groupName' not found. Please check the group name."
    exit
}

$members = Get-MgGroupMember -GroupId $groupId -All
$skuId = (Get-MgSubscribedSku | Where-Object { $_.SkuPartNumber -eq "SPB" }).SkuId

foreach ($member in $members) {
    $odataType = $member.AdditionalProperties.'@odata.type'
    if ($odataType -eq "#microsoft.graph.user") {
        $userId = $member.Id
        $displayName = $member.AdditionalProperties.displayName

        Update-MgUser -UserId $userId -UsageLocation "IN"
        Write-Host "Set UsageLocation for user: $displayName"

        Set-MgUserLicense -UserId $userId -AddLicenses @{ SkuId = $skuId } -RemoveLicenses @()
        Write-Host "Assigned license to user: $displayName"
    }
    else {
        Write-Host "Skipping non-user object"
    }
}
