$serviceName = "Spooler"

Get-Service -Name $serviceName

Start-Service -Name $serviceName

Get-Help Stop-Service -Full

Get-Service -Name $serviceName | Stop-Service

Get-Help Get-Service -Full

$serviceName | Get-Service | Start-Service

$services=New-Object -TypeName System.Collections.ArrayList
$services.AddRange(@("Spooler","W32Time"))

$services | Get-Service

$services | Get-Service | Start-Service

$services | Get-Service | ForEach-Object {
    write-Output "Service: $($_.DisplayName) is currently $($_.Status)"
}