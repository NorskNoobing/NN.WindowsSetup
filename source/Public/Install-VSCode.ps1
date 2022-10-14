function Install-VSCode {
    Install-Choco
    choco install -y vscode
    
    Write-Warning "Terminal requires a restart before using the `"code`" command."
}
#todo: check if restart is required