 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Michael Francis
    LinkedIn        :linkedin.com/in/michael-francis1
    GitHub          :github.com/mfrancis1009
    Date Created    : 2024-01-04
    Last Modified   : 2024-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>


# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$ValueData = 32768  # 0x00008000 in hexadecimal

# Ensure the registry path exists, if not create it 
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the MaxSize value 
Set-ItemProperty -Path $registryPath -Name $valueName -Value $ValueData -Type DWord 

# Output success message 
Write-Host "Registry value '$valueName' set to $valueData' at '$registryPath."  
