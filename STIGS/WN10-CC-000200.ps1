 <#
.SYNOPSIS
    This PowerShell script ensures that the Administrator accounts is not be enumerated during elevation.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-26
    Last Modified   : 2025-03-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000200

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000200.ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI"
$valueName = "EnumerateAdministrators"
$valueData = 0

# Check if the registry path exists; if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "Registry value $valueName set to $valueData at $registryPath"
 
