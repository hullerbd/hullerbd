  <#
.SYNOPSIS
    This PowerShell script ensures that Solicited Remote Assistance are not allowed.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000155

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000155 
#>

# Define the registry paths
$terminalServicesPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"
$clientPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client"
$usbBlockDevicePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client\UsbBlockDeviceBySetupClasses"
$usbSelectDevicePath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client\UsbSelectDeviceByInterfaces"

# Create the registry entries for Terminal Services
New-ItemProperty -Path $terminalServicesPath -Name "KeepAliveEnable" -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $terminalServicesPath -Name "KeepAliveInterval" -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $terminalServicesPath -Name "fDisableCdm" -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $terminalServicesPath -Name "fAllowToGetHelp" -Value 0 -PropertyType DWord -Force

# Create the registry entries for Terminal Services Client
New-ItemProperty -Path $clientPath -Name "fEnableUsbBlockDeviceBySetupClass" -Value 1 -PropertyType DWord -Force
New-ItemProperty -Path $clientPath -Name "fEnableUsbNoAckIsochWriteToDevice" -Value 80 -PropertyType DWord -Force
New-ItemProperty -Path $clientPath -Name "fEnableUsbSelectDeviceByInterface" -Value 1 -PropertyType DWord -Force

# Create the registry key and entry for UsbBlockDeviceBySetupClasses
New-Item -Path $usbBlockDevicePath -Force
New-ItemProperty -Path $usbBlockDevicePath -Name "1000" -Value "{3376f4ce-ff8d-40a2-a80f-bb4359d1415c}" -PropertyType String -Force

# Create the registry key and entry for UsbSelectDeviceByInterfaces
New-Item -Path $usbSelectDevicePath -Force
New-ItemProperty -Path $usbSelectDevicePath -Name "1000" -Value "{6bdd1fc6-810f-11d0-bec7-08002be2092f}" -PropertyType String -Force

Write-Host "Registry changes have been applied successfully."





  
