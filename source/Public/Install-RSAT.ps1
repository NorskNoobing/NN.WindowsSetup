function Install-RSAT {
    [CmdletBinding()]
    param (
        [switch]$WUServerBypass
    )

    process {
        try {
            $null = Get-ADUser -Filter "Name -eq 0"
        }
        catch [System.Management.Automation.CommandNotFoundException] {
            Invoke-gsudoCheck
            
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
    }
}