1 -eq 1 #Equals
1 -lt 2 #Less Than
3 -le 2 #Less Than or Equal
2 -gt 2 #Greater Than
4 -ge 3 #Greater Than or Equal
1 -ne 2 #Not Equals

@(1,2,3) -contains 2 #Contains
@(1,2,3) -notcontains 4 #Does Not Contain
@("Test","test") -contains "TEST" #Case Insensitive Contains
@("Test","test") -ccontains "TEST" #Case Sensitive Contains

'Test' -eq 'TEST' 

$filePath = "C:\Scripts\6-IfElseIfElse\Data\test.txt"


if (Test-Path $filePath) {
    $Data = Get-Content $filePath
    if($Data.Count -lt 2) {
        Write-Output "This file has 2 or less than 2 lines."
    }
    elseif ($Data.Count -lt 4) {
        Write-Output "This file has 3 lines."
    }
    else {
        Write-Output "This file has 4 or more lines."
    }

} else {
    Write-Output "File `"$filePath`" does not exist."
}
    