#Requires -Module ModuleBuilder
[string]$moduleName = "NN.WindowsSetup"
[version]$version = "0.0.1"
[string]$author = "NorskNoobing"
[string]$ProjectUri = "https://github.com/$author/$moduleName"
[string]$releaseNotes = "Initial commit"
[string]$description = "Functions for installing and configuring programs. Making it easier to setup and deploy a new computer."
[array]$tags = @("Windows","Setup","Install","Config","Configuration")
[version]$PSversion = "5.1"

$manifestSplat = @{
    "Description" = $description
    "PowerShellVersion" = $PSversion
    "Tags" = $tags
    "ReleaseNotes" = $releaseNotes
    "Path" = ".\source\$moduleName.psd1"
    "RootModule" = "$moduleName.psm1"
    "Author" = $author
    "ProjectUri" = $ProjectUri
}
New-ModuleManifest @manifestSplat

$buildSplat = @{
    "SourcePath" = ".\source\$moduleName.psd1"
    "Version" = $version
}
Build-Module @buildSplat