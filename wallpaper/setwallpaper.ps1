
# 定义图片保存文件夹和文件名
$folderName = "download"
$fileName = "FY4B"

$currentTime = Get-Date -Format "yyyyMMddHHmm"

$scriptPath = $MyInvocation.MyCommand.Path
$scriptDirectory = Split-Path -Path $scriptPath -Parent

$folderPath = Join-Path -Path $scriptDirectory -ChildPath $folderName
New-Item -ItemType Directory -Path $folderPath

$fullPath = Join-Path -Path $folderPath -ChildPath "$fileName.jpg"


# $fullPath | Out-File -FilePath "z:\output.txt" -Encoding UTF8

# 下载图片
$url = "https://img.nsmc.org.cn/CLOUDIMAGE/FY4B/AGRI/GCLR/FY4B_REGC_GCLR.JPG"
Invoke-WebRequest -Uri $url -OutFile $fullPath

# 将图片设置为桌面背景
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name 'Wallpaper' -Value $fullPath

# 刷新桌面
$signature = @"
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
"@

$systemParamsInfo = Add-Type -MemberDefinition $signature -Name WinAPI -Namespace Wallpaper -PassThru
$systemParamsInfo::SystemParametersInfo(0x0014, 0, $fullPath, 0x0002)