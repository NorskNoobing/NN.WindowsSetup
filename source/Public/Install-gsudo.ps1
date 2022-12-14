function Install-gsudo {
    try {
        $null = gsudo --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        Set-ExecutionPolicy RemoteSigned -scope CurrentUser -Force
        [Net.ServicePointManager]::SecurityProtocol = 'Tls12'
        Invoke-WebRequest -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | Invoke-Expression
        Write-Warning "You'll need to restart all terminal applications before using gsudo."
    }
}