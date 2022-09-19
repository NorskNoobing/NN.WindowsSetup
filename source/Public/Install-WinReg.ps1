function Install-WinReg {
    Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Type "String" -Name "Flags" -Value "506" #Disable hotkey for StickyKeys
    Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Type "String" -Name "Flags" -Value "59" #Enable ToggleKeys tone
    Set-ItemProperty -Path "HKCU:\Keyboard Layout\Toggle" -Type "String" -Name "Hotkey" -Value "3" #Disable keyboard language switching hotkey
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Type "dword" -Name "EnthusiastMode" -Value "1" #Show more details in file transfer dialog
}