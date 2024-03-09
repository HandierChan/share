strFileName = "setwallpaper.ps1"

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objShell = CreateObject("WScript.Shell")

strScriptPath = WScript.ScriptFullName
strCurrentDirectory = objFSO.GetParentFolderName(strScriptPath)
strPowerShellPath = strCurrentDirectory & "\" & strFileName
strPowerShellCommand = "powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -NoProfile  -File """&strPowerShellPath&""" "

' MsgBox strPowerShellPath
objShell.Run strPowerShellCommand, 0, True