  <#
.SYNOPSIS
    This PowerShell script ensures that the network selection user interface (UI) must not be displayed on the logon screen.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000120    

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000120     
#>

# Set the registry keys as specified
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Create the registry key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the values
Set-ItemProperty -Path $registryPath -Name "AllowDomainPINLogon" -Value 0 -Type DWord
Set-ItemProperty -Path $registryPath -Name "DontDisplayNetworkSelectionUI" -Value 1 -Type DWord

# Verify changes
Get-ItemProperty -Path $registryPath
 
