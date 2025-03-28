 <#
.SYNOPSIS
    This PowerShell script ensures that User Account Control must, at minimum, prompt administrators for consent on the secure desktop.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000250

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000250 
#>

# Define the registry key path and the values
$regKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Set the registry values
Set-ItemProperty -Path $regKeyPath -Name "MSAOptional" -Value 1 -Type DWord
Set-ItemProperty -Path $regKeyPath -Name "ConsentPromptBehaviorAdmin" -Value 2 -Type DWord

# Optionally, display a message to confirm the changes
Write-Host "Registry values have been successfully updated."
