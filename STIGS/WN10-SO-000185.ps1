  <#
.SYNOPSIS
    This PowerShell script ensures that PKU2U authentication using online identities are prevented.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000185   

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000185    
#>

# Define the registry path and key-value pair
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\pku2u"
$regKey = "AllowOnlineID"
$regValue = 0  # dword:00000000

# Check if the registry path exists
if (Test-Path $registryPath) {
    # Set the registry value
    Set-ItemProperty -Path $registryPath -Name $regKey -Value $regValue
    Write-Host "Registry value updated successfully."
} else {
    Write-Host "Registry path not found."
}
 
