$wallpaperName = "wallpaper_FY4B.jpg"
$currentDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$wallpaperPath = $currentDirectory + "\" + $wallpaperName

# $wallpaperPath | Out-File -FilePath  "z:\aa.txt"

# $url = "http://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_DISK_GCLR.JPG"
$url = "http://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_REGC_GCLR.JPG"
Invoke-WebRequest -Uri $url -OutFile $wallpaperPath

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class setWallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

[setWallpaper]::SystemParametersInfo(0x0014, 0, $wallpaperPath, 0x01 -bor 0x02)
