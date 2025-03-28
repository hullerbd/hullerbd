  <#
.SYNOPSIS
    This PowerShell script ensures that the Windows Remote Management (WinRM) client must not use Digest authentication.

.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000360

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000360 
#>

# Set the registry path for WinRM client settings
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the values for AllowBasic and AllowDigest
Set-ItemProperty -Path $regPath -Name "AllowBasic" -Value 0 -Type DWord
Set-ItemProperty -Path $regPath -Name "AllowDigest" -Value 0 -Type DWord

Write-Host "Registry keys have been updated successfully."



  
