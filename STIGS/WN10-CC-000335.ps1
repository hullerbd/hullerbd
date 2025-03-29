  <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) client must not allow unencrypted traffic.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000335   

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000335    
#>

# Define the registry path and the key-value pair
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"
$keyName = "AllowUnencryptedTraffic"
$keyValue = 0

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $keyName -Value $keyValue

Write-Host "Registry key added/modified successfully."


 
