 <#
.SYNOPSIS
    This PowerShell script ensures that Group Policy objects are reprocessed even if they have not changed.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000090 
#>

# Set the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy"

# Create the registry key for Group Policy if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry key for the GUID if it doesn't exist
$guidPath = "$registryPath\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"
if (-not (Test-Path $guidPath)) {
    New-Item -Path $guidPath -Force
}

# Set the 'NoBackgroundPolicy' value to 0
Set-ItemProperty -Path $guidPath -Name "NoBackgroundPolicy" -Value 0 -Type DWord

# Set the 'NoGPOListChanges' value to 0
Set-ItemProperty -Path $guidPath -Name "NoGPOListChanges" -Value 0 -Type DWord

Write-Host "Registry keys and values have been successfully set."

