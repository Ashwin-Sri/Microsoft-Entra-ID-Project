# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Device.Read.All", "Directory.Read.All"

# Retrieve all registered devices
$devices = Get-MgDevice -All

# Display relevant details
$devices | Select-Object DisplayName, OperatingSystem, DeviceId, TrustType, IsCompliant, IsEnabled
