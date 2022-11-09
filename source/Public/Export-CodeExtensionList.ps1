function Export-CodeExtensionList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][string]$Path
    )

    begin {
        try {
            $null = code --version
        }
        catch [System.Management.Automation.CommandNotFoundException] {
            Write-Error "Can't find a VSCode install on this computer." -ErrorAction Stop
        }
    }
    
    process {
        code --list-extensions | Out-File -FilePath $Path
    }
}