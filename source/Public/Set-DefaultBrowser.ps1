function Set-DefaultBrowser {
    #Set Chrome as default browser
    Invoke-WebRequest -Uri https://kolbi.cz/SetDefaultBrowser.zip -OutFile $env:TEMP\SetDefaultBrowser.zip
    Expand-Archive -LiteralPath $env:TEMP\SetDefaultBrowser.zip -DestinationPath $env:TEMP
    Start-Process $env:TEMP\SetDefaultBrowser\SetDefaultBrowser.exe chrome
    Remove-Item $env:TEMP\SetDefaultBrowser.zip
    Remove-Item -Recurse $env:TEMP\SetDefaultBrowser
}