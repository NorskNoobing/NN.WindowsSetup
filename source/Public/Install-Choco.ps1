function Install-Choco {
    try {
        $null = choco --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        Invoke-gsudoCheck
        Invoke-gsudo {
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            Write-Warning "You'll need to restart all terminal applications before using choco."
        }
    }
}