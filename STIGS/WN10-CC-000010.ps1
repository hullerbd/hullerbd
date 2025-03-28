 <#
.SYNOPSIS
    This PowerShell script ensures that the display of slide shows on the lock screen is disabled.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000010 
#>

# Set registry key path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry values
Set-ItemProperty -Path $registryPath -Name "NoLockScreenCamera" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "NoLockScreenSlideshow" -Value 1 -Type DWord

Write-Host "Registry values have been updated."
