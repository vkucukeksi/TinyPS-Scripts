$score = 60

if ($score -ge 90) {
    Write-Host "Grade: A"
}
elseif ($score -ge 80) {
    Write-Host "Grade: B"
}
elseif ($score -ge 70) {
    Write-Host "Grade: C"
}
elseif ($score -ge 60) {
    Write-Host "Grade: D"
}
else {
    Write-Host "Grade: F"
}


