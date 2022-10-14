function Install-Choco {
    try {
        $null = choco --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        if (Test-Path "$env:ProgramData\chocolatey\bin\choco.exe") {
            Write-Warning "Please restart all terminal applications before using the `"choco`" command."
        } else {
            [bool]$runAsAdmin = ([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544"
            if ($runAsAdmin) {
                Set-ExecutionPolicy Bypass -Scope Process -Force
                [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
                Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
                Write-Warning "You'll need to restart all terminal applications before using choco."
            } else {
                throw "Function needs to run with administrator privledges."
            }
        }
    }
}