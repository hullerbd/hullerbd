  <#
.SYNOPSIS
    This PowerShell script ensures that Windows Update must not obtain updates from other PCs on the internet.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000206 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000206  
#>

# Define the registry path and the value to be set
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
$valueName = "DODownloadMode"
$valueData = 0x64 # Hexadecimal value (100 in decimal)

# Check if the registry path exists
if (-not (Test-Path $regPath)) {
    # Create the registry path if it does not exist
    New-Item -Path $regPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regPath -Name $valueName -Value $valueData

Write-Output "Registry key '$valueName' set to $valueData at '$regPath'"
 
