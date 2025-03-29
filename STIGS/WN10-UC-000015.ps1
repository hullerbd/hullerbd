  <#
.SYNOPSIS
    This PowerShell script ensures that the Toast notifications to the lock screen are turned off..
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UC-000015   

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-UC-000015    
#>

# Define the registry path and the key value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications"
$keyName = "NoCloudApplicationNotification"
$keyValue = 1  # Equivalent to dword:00000001

# Check if the registry path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry key value
Set-ItemProperty -Path $registryPath -Name $keyName -Value $keyValue -Type DWord

Write-Host "Registry key set: $keyName = $keyValue"

 
