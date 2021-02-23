#Closes Chrome.
Get-Process chrome | stop-process

#Removes printers on old servers.
Remove-Printer \\kwsprintsrvr\*
Remove-Printer \\calsrv\*
Remove-Printer \\ontsrv\*
Remove-Printer \\heysrv\*

#Edits Chrome JSON preferences file removing recent print destinations. All other User Chrome preferences alone.
$path = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
$readableJSON = Get-Content -Path $path | ConvertFrom-Json -ErrorAction Stop
$readableJSON.printing.print_preview_sticky_settings = $false
if ($readableJSON){
New-Item -ItemType file -Path $path -Force
$readableJSON | ConvertTo-Json -depth 99 -Compress | Add-Content -Path $path
}

#Reopens Chrome.
Start-Process -FilePath "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
