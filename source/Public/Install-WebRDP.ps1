function Install-WebRDP {
    if (!(Test-Path HKCR:)) {
        New-PSDrive -PSProvider "registry" -Root "HKEY_CLASSES_ROOT" -Name "HKCR"
    }
    if (!(Test-Path HKCR:\rdp\DefaultIcon)) {
        New-Item -Force -Path "HKCR:\rdp\DefaultIcon"
    }
    if (!(Test-Path HKCR:\rdp\shell\open\command)) {
        New-Item -Force -Path "HKCR:\rdp\shell\open\command"
    }
    New-ItemProperty -Force -Path "HKCR:\rdp" -PropertyType "String" -Name "(Default)" -Value "URL:Remote Desktop Connection"
    New-ItemProperty -Force -Path "HKCR:\rdp" -PropertyType "String" -Name "URL Protocol"
    New-ItemProperty -Force -Path "HKCR:\rdp\DefaultIcon" -PropertyType "String" -Name "(Default)" -Value "C:\WINDOWS\System32\mstsc.exe"
    New-ItemProperty -Force -Path "HKCR:\rdp\shell\open\command" -PropertyType "String" -Name "(Default)" -Value "powershell.exe $('$URL') = '%1%'; $('$SERVER') = $('$url').replace('rdp://',''); $('$SERVER') = $('$SERVER').replace('/',''); mstsc.exe /v $('$SERVER')"
}