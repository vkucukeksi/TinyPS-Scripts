Set-StrictMode -Off

$myHashTable = @{
    key1=100
    apple=2.4
    name="John Doe"
    key2=2
    key3=$true
}

$myHashTable.GetType()

$myHashTable.Keys
$myHashTable.Values

$myHashTable.key2

$myHashTable["key4"]

$myHashTable.ContainsKey("key3")

$myHashTable.ContainsValue(2.5)

$myHashTable.Add("key4", "testing add function")

$myHashTable["key5"] = "added via square braket"

$myHashTable

$myHashTable.apple = 0.5

$myHashTable.Remove("apple")
$myHashTable

$myHashTable2 = @{
    name = "Jane Smith"
    age = 28
    city="New York"
    country="USA"   
}

$combinedHashTable = $myHashTable + $myHashTable2
$combinedHashTable

$myHashTable
$myHashTable2

#######################################

$Employee1=New-Object -TypeName PSCustomObject

$Employee1.GetType()


Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name "FirstName" -Value "Alice"
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name "Title" -Value "CEO"
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name "EpmloyeeID" -Value 1001

$Employee1

Get-Member -InputObject $Employee1

$Employee2=[PSCustomObject]@

{FirstName="Bob";Title="CTO";EmployeeID=1002}


$Employee1