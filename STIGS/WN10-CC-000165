  <#
.SYNOPSIS
    This PowerShell script ensures that Unauthenticated RPC clients are restricted from connecting to the RPC server..
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000165

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000165 
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Rpc"

# Check if the registry path exists, and create it if it doesn't
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the "RestrictRemoteClients" registry key to 1
Set-ItemProperty -Path $regPath -Name "RestrictRemoteClients" -Value 1 -Type DWord

Write-Host "Registry key added/modified successfully."


 
