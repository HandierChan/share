scriptPath = "setwallpaper.ps1"

Set objFSO = CreateObject("Scripting.FileSystemObject")
strVBScriptPath = objFSO.GetParentFolderName(WScript.ScriptFullName)
strPowerShellScriptPath = objFSO.BuildPath(strVBScriptPath, scriptPath)

Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -File """ & strPowerShellScriptPath & """", 0, True



' WScript.Echo strPowerShellScriptPath


