<#
    Prerequisites: 
    * gsudo
#>
function Install-RSAT {
    param (
        [switch]$WUServerBypass,
        [string]$ModulePathPassthrough
    )

    try {
        $null = Get-ADUser -Filter "Name -eq 0"
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        try {
            Invoke-gsudo {
                Import-Module NN.WindowsSetup
    
                if ($using:WUServerBypass) {
                    Invoke-WUServerBypass
                }
            
                $RSATNames = (Get-WindowsCapability -Name RSAT* -online | Where-Object State -NotLike 'Installed').Name 
                
                foreach ($item in $RSATNames) {
                    Get-WindowsCapability -Name $item -Online | Add-WindowsCapability -Online
                }
            }
        }
        catch [System.Management.Automation.CommandNotFoundException] {
            throw "Please run Install-gsudo before running this command."
        }
    }
}