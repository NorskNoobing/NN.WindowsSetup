function Install-Cursor {
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "(Default)" -Value "material_design_dark"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "AppStarting" -Value "%SystemRoot%\cursors\material_design_dark\work.ani"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Arrow" -Value "%SystemRoot%\cursors\material_design_dark\pointer.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Crosshair" -Value "%SystemRoot%\cursors\material_design_dark\cross.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Hand" -Value "%SystemRoot%\cursors\material_design_dark\link.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Help" -Value "%SystemRoot%\cursors\material_design_dark\help.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "IBeam" -Value "%SystemRoot%\cursors\material_design_dark\text.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "No" -Value "%SystemRoot%\cursors\material_design_dark\unavailiable.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "NWPen" -Value "%SystemRoot%\cursors\material_design_dark\handwriting.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Person" -Value "%SystemRoot%\cursors\material_design_dark\account.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Pin" -Value "%SystemRoot%\cursors\material_design_dark\place.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "SizeAll" -Value "%SystemRoot%\cursors\material_design_dark\move.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "SizeNESW" -Value "%SystemRoot%\cursors\material_design_dark\dgn2.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "SizeNS" -Value "%SystemRoot%\cursors\material_design_dark\vert.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "SizeNWSE" -Value "%SystemRoot%\cursors\material_design_dark\dgn1.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "SizeWE" -Value "%SystemRoot%\cursors\material_design_dark\horz.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "UpArrow" -Value "%SystemRoot%\cursors\material_design_dark\alternate.cur"
    Set-ItemProperty -Path "HKCU:\Control Panel\Cursors" -Name "Wait" -Value "%SystemRoot%\cursors\material_design_dark\busy.ani"

    if (!(Test-Path "HKCU:\Control Panel\Cursors\Schemes")) {
        New-Item -Force -Path "HKCU:\Control Panel\Cursors\Schemes"
    }
    $null = New-ItemProperty -Force -Path "HKCU:\Control Panel\Cursors\Schemes" -Name "material_design_dark" -PropertyType "String" -Value "C:\Windows\Cursors\material_design_dark\pointer.cur,C:\Windows\Cursors\material_design_dark\help.cur,C:\Windows\Cursors\material_design_dark\work.ani,C:\Windows\Cursors\material_design_dark\busy.ani,C:\Windows\Cursors\material_design_dark\cross.cur,C:\Windows\Cursors\material_design_dark\text.cur,C:\Windows\Cursors\material_design_dark\handwriting.cur,C:\Windows\Cursors\material_design_dark\unavailiable.cur,C:\Windows\Cursors\material_design_dark\vert.cur,C:\Windows\Cursors\material_design_dark\horz.cur,C:\Windows\Cursors\material_design_dark\dgn1.cur,C:\Windows\Cursors\material_design_dark\dgn2.cur,C:\Windows\Cursors\material_design_dark\move.cur,C:\Windows\Cursors\material_design_dark\alternate.cur,C:\Windows\Cursors\material_design_dark\link.cur,C:\Windows\Cursors\material_design_dark\place.cur,C:\Windows\Cursors\material_design_dark\account.cur"
    
    rundll32.exe shell32.dll,Control_RunDLL main.cpl "@0,1" #Open mouse pointer window
}