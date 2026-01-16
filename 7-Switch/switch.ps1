$filePath="C:\Scripts\7-Switch\test.txt"

$Data = Get-Content -Path $filePath

$firstName=$Data[3]

if ($firstName -eq "Tim") {write-Host "My name is Tim"

} elseif ($firstName -eq "Steve") {
    write-Host "My name is Steve"
} elseif ($firstName -eq "John") {
    write-Host "My name is John"
} else {
    write-Host "I dont know my name"
}

switch ($firstName) {
    "Tim" { write-Host "My name is Tim" 
            break}
    "Steve" { write-Host "My name is Steve" 
            break}
    "James" { write-Host "My name is James" 
            break}
    Default { write-Host "I dont know my name" 
            break}
}

switch ($Data.Count) {
    {$_ -lt 2} {write-Host "This file has less than 2 lines"; break}
    {$_ -eq 7} {write-Host "This file has 7 lines exactly"; break}
    {$_ -in 8..9} {write-Host "This file has less than 10 lines, at least 8 lines"; break}

    Default {
        write-Host "This file has more than 10 lines"
    }
}