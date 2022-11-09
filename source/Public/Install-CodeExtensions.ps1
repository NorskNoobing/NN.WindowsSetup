function Install-CodeExtensions {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][string]$ExtensionListPath
    )

    begin {
        try {
            $null = code --version
        }
        catch [System.Management.Automation.CommandNotFoundException] {
            Write-Error "Please run `"Install-VSCode`" before running this command." -ErrorAction Stop
        }
    }
    
    process {
        $CodeExtensions = Get-Content -Path $ExtensionListPath
        $CodeExtensions.ForEach({
            code --install-extension $_
        })
    }
}