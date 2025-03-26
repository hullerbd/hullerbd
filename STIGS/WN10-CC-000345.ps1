 <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) service must not use Basic authentication.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-26
    Last Modified   : 2025-03-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000345 
#>

# Set the path for the registry key
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"

# Ensure the registry path exists (create it if necessary)
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the "AllowBasic" registry value to 0 (disabled)
Set-ItemProperty -Path $registryPath -Name "AllowBasic" -Value 0 -Type DWord

Write-Host "Registry key added/updated successfully."


 
