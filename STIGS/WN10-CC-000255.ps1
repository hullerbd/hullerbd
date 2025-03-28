 <#
.SYNOPSIS
    This PowerShell script ensures that the use of a hardware security device with Windows Hello for Business is enabled.
.NOTES
    Author          : Agbolade Oyebanjo
    LinkedIn        : linkedin.com/in/agbolade-oyebanjo-a7b88660/
    GitHub          : github.com/hullerbd
    Date Created    : 2025-03-28
    Last Modified   : 2025-03-28
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000255  

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000255   
#>

# Define registry paths and values
$registryPath1 = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork"
$registryPath2 = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork\ExcludeSecurityDevices"

# Create registry keys if they do not exist
if (-not (Test-Path $registryPath1)) {
    New-Item -Path $registryPath1 -Force
}

if (-not (Test-Path $registryPath2)) {
    New-Item -Path $registryPath2 -Force
}

# Set the "RequireSecurityDevice" registry value
Set-ItemProperty -Path $registryPath1 -Name "RequireSecurityDevice" -Value 1 -Type DWord

# Set the "TPM12" registry value under ExcludeSecurityDevices
Set-ItemProperty -Path $registryPath2 -Name "TPM12" -Value 0 -Type DWord

Write-Host "Registry keys have been updated successfully."

