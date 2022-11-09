function Invoke-JpegExtensionFix {
    [CmdletBinding()]
    param ()
    process {
        $null = New-PSDrive -PSProvider registry -Root HKEY_CLASSES_ROOT -Name HKCR
        $jpegExtension = (Get-ItemProperty "HKCR:\MIME\Database\Content Type\image/jpeg" -Name Extension).Extension

        if ($jpegExtension -notlike ".jpg") {
            $null = New-ItemProperty -Path "HKCR:\MIME\Database\Content Type\image/jpeg" -Name "Extension" -PropertyType "String" -Value ".jpg" -Force
            Write-Information "Jpeg extension has been changed from `"$jpegExtension`" to `".jpg`""
        } else {
            Write-Information "Jpeg extension is already set to `"$jpegExtension`""
        }
    }
}