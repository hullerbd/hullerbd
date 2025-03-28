 <#
.SYNOPSIS
    This PowerShell script ensures that Kerberos encryption types are configured to prevent the use of DES and RC4 encryption suites.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000190 
#>

# Define the registry paths and values
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos"
$parametersPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"
$encryptionValueName = "SupportedEncryptionTypes"
$encryptionValue = 0x7ffffff8

# Create the registry keys if they don't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

if (-not (Test-Path $parametersPath)) {
    New-Item -Path $parametersPath -Force
}

# Set the value for SupportedEncryptionTypes
Set-ItemProperty -Path $parametersPath -Name $encryptionValueName -Value $encryptionValue -Type DWord

Write-Host "Registry keys and values have been successfully set."
