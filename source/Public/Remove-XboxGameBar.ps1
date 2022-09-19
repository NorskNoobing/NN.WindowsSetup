function Remove-XboxGameBar {
    #Remove game bar
    Import-Module Appx -UseWindowsPowershell
    Get-AppxPackage -AllUsers *Microsoft.XboxGameOverlay* | Remove-AppxPackage
    Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage
    Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR"
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\GameDVR" -Name AllowGameDVR -Type dword -Value 0
}