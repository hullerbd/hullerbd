 <#
.SYNOPSIS
    This PowerShell script ensures that Internet connection sharing is disabled.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044  

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000044   
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"

# Set the registry values
Set-ItemProperty -Path $registryPath -Name "NC_PersonalFirewallConfig" -Value 0 -Type DWord
Set-ItemProperty -Path $registryPath -Name "NC_ShowSharedAccessUI" -Value 0 -Type DWord

# Output confirmation
Write-Host "Registry values have been successfully set."


