  <#
.SYNOPSIS
    This PowerShell script ensures that Local drives are prevented from sharing with Remote Desktop Session Hosts.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000275

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000275 
#>

# Define the registry paths
$regPath1 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$regPath2 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client"
$regPath3 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client\UsbBlockDeviceBySetupClasses"
$regPath4 = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client\UsbSelectDeviceByInterfaces"

# Ensure the paths exist and create them if they don't
if (-not (Test-Path $regPath1)) {
    New-Item -Path $regPath1 -Force
}
if (-not (Test-Path $regPath2)) {
    New-Item -Path $regPath2 -Force
}
if (-not (Test-Path $regPath3)) {
    New-Item -Path $regPath3 -Force
}
if (-not (Test-Path $regPath4)) {
    New-Item -Path $regPath4 -Force
}

# Set the registry values as specified
Set-ItemProperty -Path $regPath1 -Name "KeepAliveEnable" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath1 -Name "KeepAliveInterval" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath1 -Name "fDisableCdm" -Value 1 -Type DWord

Set-ItemProperty -Path $regPath2 -Name "fEnableUsbBlockDeviceBySetupClass" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath2 -Name "fEnableUsbNoAckIsochWriteToDevice" -Value 80 -Type DWord
Set-ItemProperty -Path $regPath2 -Name "fEnableUsbSelectDeviceByInterface" -Value 1 -Type DWord

Set-ItemProperty -Path $regPath3 -Name "1000" -Value "{3376f4ce-ff8d-40a2-a80f-bb4359d1415c}" -Type String

Set-ItemProperty -Path $regPath4 -Name "1000" -Value "{6bdd1fc6-810f-11d0-bec7-08002be2092f}" -Type String

Write-Host "Registry keys and values have been updated successfully."




  
