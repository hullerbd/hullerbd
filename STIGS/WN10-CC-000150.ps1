  <#
.SYNOPSIS
    This PowerShell script ensures that userS are prompted for a password on resume from sleep (plugged in).
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000150 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000150  
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Ensure the parent key exists
if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power" -Name "PowerSettings" -Force
}

# Create the key and set the ACSettingIndex value
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings" -Name "0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force
Set-ItemProperty -Path $regPath -Name "ACSettingIndex" -Value 1 -Type DWord

Write-Host "Registry entry has been set successfully."



 
