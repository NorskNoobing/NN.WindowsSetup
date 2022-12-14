function Invoke-gsudoCheck {
    try {
        $null = gsudo --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        throw "Please run `"Install-gsudo`" before running this command."
    }
}