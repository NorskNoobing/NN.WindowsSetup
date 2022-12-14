param (
    #Manual params
    [string]$Description = "Functions for installing and configuring programs. Making it easier to setup and deploy a new computer.",
    [array]$Tags = @("Windows","Setup","Install","Config","Configuration"),
    [version]$PsVersion = "7.2",
    [string]$Author = "NorskNoobing",

    #Optional params
    [string]$IconUri = $null,

    #Automatic params
    [version]$Version = $null,
    [string]$ReleaseNotes = $env:COMMIT_RELEASE_NOTES,
    [string]$RepoRoot = (Get-Item $PSScriptRoot -Force).Parent.FullName,
    [string]$ModuleName = (Get-Item $RepoRoot).Name,
    [string]$ProjectUri = "https://github.com/$Author/$ModuleName",
    [string]$LicenseUri = "$ProjectUri/blob/main/LICENSE.md",
    [string]$ModulePath = "$RepoRoot\$ModuleName",
    [string]$ManifestPath = "$RepoRoot\source\$ModuleName.psd1"
)

#Install required modules
$RequiredModulesNameArray = @("ModuleBuilder")
$RequiredModulesNameArray.ForEach({
    if (Get-InstalledModule $_ -ErrorAction SilentlyContinue) {
        Import-Module $_ -Force
    } else {
        Install-Module $_ -Force
    }
})

#Create placeholder release note if it's not already defined
if (!$ReleaseNotes) {
    $ReleaseNotes = "Placeholder commit message"
}

#Auto increment version
if (!$Version) {
    $CurrentModuleVersion = (Find-Module -Name $ModuleName -ErrorAction SilentlyContinue).version
    if ($CurrentModuleVersion) {
        [int]$VersionSuffix = $CurrentModuleVersion -replace '.*\.'
        $VersionSuffix++
        $VersionPrefix = $CurrentModuleVersion.Substring(0, $CurrentModuleVersion.lastIndexOf('.'))
        
        $Version = "$VersionPrefix.$VersionSuffix"
    } else {
        $Version = "0.0.1"
    }
}

#Create module manifest
$ManifestSplat = @{
    "Description" = $Description
    "PowerShellVersion" = $PsVersion
    "Tags" = $Tags
    "ReleaseNotes" = $ReleaseNotes
    "Path" = $ManifestPath
    "RootModule" = "$ModuleName.psm1"
    "Author" = $Author
    "ProjectUri" = $ProjectUri
    "LicenseUri" = $LicenseUri
}

if ($IconUri) {
    $ManifestSplat = $ManifestSplat + @{"IconUri" = $IconUri}
}

New-ModuleManifest @ManifestSplat

#Build module
$BuildSplat = @{
    "SourcePath" = $ManifestPath
    "Version" = $Version
    "OutputDirectory" = $ModulePath
}
Build-Module @BuildSplat