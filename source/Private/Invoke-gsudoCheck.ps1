function Invoke-gsudoCheck {
    try {
        gsudo --version
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        throw "Please run `"Install-gsudo`" before running this command."
    }
}