 <#
.SYNOPSIS
    This PowerShell script ensures that the Camera access from the lock screen must be disabled.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-25
    Last Modified   : 2025-03-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000005.ps1 
#>

# YOUR CODE GOES HERE


# Define the registry key path and value
$regKeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$regValueName = "NoLockScreenCamera"
$regValueData = 1

# Check if the registry key exists, if not create it
if (-not (Test-Path $regKeyPath)) {
    New-Item -Path $regKeyPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regKeyPath -Name $regValueName -Value $regValueData -Type DWord

# Confirm the change
Write-Output "Registry key set: $regKeyPath\$regValueName = $regValueData"
