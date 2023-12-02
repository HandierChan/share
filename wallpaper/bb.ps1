# add task
# powershell.exe -ExecutionPolicy Bypass -File "z:\bb.ps1"

$wallpaperPath = "z:\aa.jpg"

# Load the required .NET assembly
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Set the wallpaper
[Wallpaper]::SystemParametersInfo(0x0014, 0, $wallpaperPath, 0x01 -bor 0x02)

