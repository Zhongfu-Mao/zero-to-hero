# add the Param block

# [CmdletBinding()]
param(
    [String]$ComputerName='localhost',
    [String]$Drive='c:'
)
Get-WmiObject -class Win32_logicalDisk -Filter "DeviceID='$Drive'" -ComputerName $ComputerName