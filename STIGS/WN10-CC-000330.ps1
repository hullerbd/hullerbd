 <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) client must not use Basic authentication.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-26
    Last Modified   : 2025-03-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000330

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000330 
#>

# Define the registry path for WinRM and Client settings
$winRMPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM"
$winRMClientPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Check if the parent key exists, create if not
if (-not (Test-Path $winRMPath)) {
    New-Item -Path $winRMPath -Force
}

if (-not (Test-Path $winRMClientPath)) {
    New-Item -Path $winRMClientPath -Force
}

# Set the AllowBasic DWORD value to 0 (disabled)
Set-ItemProperty -Path $winRMClientPath -Name "AllowBasic" -Value 0 -Type DWord

# Confirm that the change was made
Get-ItemProperty -Path $winRMClientPath -Name "AllowBasic"
 
