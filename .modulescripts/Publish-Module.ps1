param (
    #Automatic params
    [string]$RepoRoot = (Get-Item $PSScriptRoot -Force).Parent.FullName,
    [string]$ModuleName = (Get-Item $RepoRoot).Name,
    [string]$ModulePath = "$RepoRoot\$ModuleName"
)

$splat = @{
    "Path" = $ModulePath
    "NuGetApiKey" = $env:NUGET_APIKEY
}
Publish-Module @splat