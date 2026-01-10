
$filePath = "C:\scripts\10-ErrorHandling"
$files = Get-ChildItem -Path $filePath
foreach ($file in $files) {
    write-host $file.Name
}
