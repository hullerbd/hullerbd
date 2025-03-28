 <#
.SYNOPSIS
    This PowerShell script ensures that Attachments are prevented from being downloaded from RSS feeds.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-26
    Last Modified   : 2025-03-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000295 
#>

# Set the registry key path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds"

# Create the registry key if it doesn't already exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the value for "DisableEnclosureDownload" to 1
Set-ItemProperty -Path $registryPath -Name "DisableEnclosureDownload" -Value 1 -Type DWord

Write-Output "Registry key and value set successfully."


 
