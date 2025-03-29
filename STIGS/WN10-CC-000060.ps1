 <#
.SYNOPSIS
    This PowerShell script ensures that Connections to non-domain networks when connected to a domain authenticated network are blocked.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-29
    Last Modified   : 2025-03-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000060   

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000060    
#>

# Define the registry key path and the value to be set
$regKeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"
$regValueName = "fBlockNonDomain"
$regValueData = 1

# Check if the registry key exists, if not, create it
if (-not (Test-Path $regKeyPath)) {
    New-Item -Path $regKeyPath -Force
}

# Set the registry value
Set-ItemProperty -Path $regKeyPath -Name $regValueName -Value $regValueData -Type DWord

# Output confirmation
Write-Host "Registry key '$regValueName' set to $regValueData at $regKeyPath"



