 <#
.SYNOPSIS
    This PowerShell script ensures that Microsoft accounts are set to optional for modern style apps.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000170

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000170 
#>

# Define the registry path and key
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$registryKey = "MSAOptional"
$registryValue = 1  # DWORD value for 0x00000001

# Check if the registry path exists
if (-not (Test-Path $registryPath)) {
    # Create the registry path if it doesn't exist
    New-Item -Path $registryPath -Force
}

# Set the registry key to the desired value
Set-ItemProperty -Path $registryPath -Name $registryKey -Value $registryValue

Write-Host "Registry key set successfully."

