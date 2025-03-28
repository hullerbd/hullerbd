  <#
.SYNOPSIS
    This PowerShell script ensures that Windows 10 systems must use a BitLocker PIN for pre-boot authentication.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000031

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-00-000031 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Create the registry key if it doesn't already exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry values
Set-ItemProperty -Path $registryPath -Name "UseAdvancedStartup" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "EnableBDEWithNoTPM" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPM" -Value 2 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMPIN" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMKey" -Value 2 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMKeyPIN" -Value 2 -Type DWord

Write-Host "Registry values set successfully."
 
