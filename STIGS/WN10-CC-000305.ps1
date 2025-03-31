  <#
.SYNOPSIS
    This PowerShell script ensures that the Indexing of encrypted files are turned off.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-31
    Last Modified   : 2025-03-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000305    

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000305     
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"
$registryValue = "AllowInsecureGuestAuth"
$valueData = 0

# Define the registry path and key value
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
$regName = "AllowIndexingEncryptedStoresOrItems"
$regValue = 0

# Check if the registry path exists, if not, create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $regValue

# Verify the change
Get-ItemProperty -Path $regPath -Name $regName

 
