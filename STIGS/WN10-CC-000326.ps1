 <#
.SYNOPSIS
    This PowerShell script ensures that PowerShell script block logging is enabled.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000326 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Define the subkey for ScriptBlockLogging
$scriptBlockLoggingPath = "$registryPath\ScriptBlockLogging"

# Check if the subkey exists, if not, create it
if (-not (Test-Path $scriptBlockLoggingPath)) {
    New-Item -Path $scriptBlockLoggingPath -Force
}

# Set the "EnableScriptBlockLogging" DWORD value to 1 (enabled)
Set-ItemProperty -Path $scriptBlockLoggingPath -Name "EnableScriptBlockLogging" -Value 1 -Type DWord

Write-Host "Registry settings have been applied successfully."



 
