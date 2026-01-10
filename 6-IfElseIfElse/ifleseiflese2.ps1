# Get a number from the user
$number = Read-Host "Enter a number"

# Convert to integer
$number = [int]$number

# Check the number using if-elseif-else
if ($number -gt 0) {
    Write-Host "The number is positive"
}
elseif ($number -lt 0) {
    Write-Host "The number is negative"
}
else {
    Write-Host "The number is zero"
}