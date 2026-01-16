$ErrorActionPreference = "Stop"


try {
$filePath = "C:\scripts\10-ErrorHandling1"
$files = Get-ChildItem -Path $filePath
foreach ($file in $files) {
    write-host $file.Name
}
write-host "This is after the error."
    
}
catch {
    write-host "Cought an error"
}
finally {
    write-host "This always runs no matter what."
}



