  <#
.SYNOPSIS
    This PowerShell script ensures that Insecure logons to an SMB server is disabled..
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000040    

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000040     
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"
$registryValue = "AllowInsecureGuestAuth"
$valueData = 0

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $registryValue -Value $valueData -Type DWord

# Confirm the change
Get-ItemProperty -Path $registryPath -Name $registryValue
 
