function Install-Choco {
    try {
        choco --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        if (Test-Path "$env:ProgramData\chocolatey\bin\choco.exe") {
            Write-Warning "Please restart all terminal applications before using the `"choco`" command."
        } else {
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        }
    }
}
#todo: check if restart is required