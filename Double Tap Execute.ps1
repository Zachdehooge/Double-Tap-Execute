If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    Exit
}

Write-Host "Changing Powershell to Execute on Click..."

New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR

Set-ItemProperty -Path "HKCR:\Microsoft.PowerShellScript.1\Shell\Open\Command" -Name "(Default)" -Type String -Value "`"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe`" -noLogo -ExecutionPolicy unrestricted -file `"%1`""

