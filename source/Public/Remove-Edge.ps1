function Remove-Edge {
    Start-Process -FilePath "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\**\Installer\setup.exe" -Args "--uninstall --system-level --force-uninstall"
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdate" -Name "DoNotUpdateToEdgeWithChromium" -Type dword -Value 1
}