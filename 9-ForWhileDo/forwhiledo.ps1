for($i=0; $i -lt 10; $i++) {
    Write-Output $i
}


$testArray = @("Steve", "Bill", "Mark")

for($i=0; $i -lt $testArray.Length; $i++) {
     $testArray[$i]+=" Jobs"
}

$testArray

$testArray = @("Steve", "Bill", "Mark")

foreach($item in $testArray) {
    $item += " Test"
    Write-Output $item
}

$testArray

Get-Date

while ((Get-Date).Minute -eq 22) {
    Get-Date
}


Write-Output "Welcome to Infinite Loop"
Write-Output "Press q to quit"
$input = Read-Host -Prompt "Please Enter your choice"

while ($input -ne 'q') {
    write-Output "You entered: $input"
    $input = Read-Host -Prompt "Please Enter your choice"
    
}




do {

    write-Output "Hi "

}until ($false)

write-Output "Welcome to Infinite Loop"
write-Output "Press q to quit"

do {
$input = Read-Host -Prompt "Please Enter your choice"
if ($input -ne "q") {
    write-Output "You entered: $input"
}
    
} until ($input -eq 'q')

