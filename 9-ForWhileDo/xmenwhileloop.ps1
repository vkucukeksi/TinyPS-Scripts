$xmen = @('Wolverine' , 'Cyclop' , 'Storm' , 'Professor X' , 'Gambi' , 'Dr. Jean Grey')
$counter = 0
while($counter -ne 6) {
    Write-Host $xmen[$counter] "is a mutant!"
    Write-Host $xmen[$counter].length
    $counter++;
}