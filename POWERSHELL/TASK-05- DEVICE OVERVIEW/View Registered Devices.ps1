# Connect to Microsoft Graph

Connect-MgGraph -Scopes "Device.Read.All", "Directory.Read.All"

# Retrieve all registered devices
$devices = Get-MgDevice -All

# Display relevant details
$devices | Select-Object DisplayName, OperatingSystem, DeviceId, TrustType, IsCompliant, IsEnabled

Optional: Export Device List to CSV

$devices | Select-Object DisplayName, OperatingSystem, DeviceId, TrustType, IsCompliant, IsEnabled |
Export-Csv -Path "C:\Entra-Registered-Devices.csv" -NoTypeInformation
