  <#
.SYNOPSIS
    This PowerShell script ensures that Enhanced anti-spoofing for facial recognition are enabled on Window 10.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000195    

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000195     
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics\FacialFeatures"
$valueName = "EnhancedAntiSpoofing"
$valueData = 1  # Equivalent to dword:00000001

# Check if the registry key exists, create it if it doesn't
if (-not (Test-Path $registryPath)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Biometrics" -Force
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData

Write-Host "Registry key and value have been set successfully."
 
