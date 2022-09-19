function Enable-ClipboardHistory {
    if (!(Test-Path -Path "HKCU:\Software\Microsoft\Clipboard")) {
        New-Item -Force -Path "HKCU:\Software\Microsoft\Clipboard"
    }
    New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Clipboard" -Name "EnableClipboardHistory" -PropertyType "dword" -Value "1"
}