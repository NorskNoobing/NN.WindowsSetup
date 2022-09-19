#Requires -RunAsAdministrator
function Add-Cursor {
    if (!(Test-Path -Path "$env:SystemRoot\cursors\")) {
        New-Item -Path "$env:SystemRoot\cursors" -ItemType "directory"
    }
    
    Invoke-WebRequest -Uri "http://dl.dropbox.com/s/20hr9j0dkyumrj1/material_design_dark.zip?dl=0" -OutFile "$env:TEMP\material_design_dark.zip"
    Expand-Archive -Force -Path "$env:TEMP\material_design_dark.zip" -DestinationPath "$env:SystemRoot\cursors\"
}