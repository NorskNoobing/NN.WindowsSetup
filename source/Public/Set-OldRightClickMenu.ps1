function Set-OldRightClickMenu {
    [CmdletBinding()]
    param (
        
    )

    process {
        $RegistryPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"

        if (!(Test-Path $RegistryPath)) {
            $null = New-Item -Path $RegistryPath -Force
        }
        
        Set-ItemProperty -Path $RegistryPath -Name "(Default)" -Value $null
        Write-Warning -Message "A restart is required to apply the old right-click context menu."
    }
}