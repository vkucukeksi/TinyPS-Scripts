$myArray=@("Test1","Test2","Test3")

$myArray

$myArray=$myArray + "Test4"

$myArray

$myArray.Count

$myArray+="Test5"

$myArray

$myArray.Count

$myArray=$myArray -ne "Test2"

$myArray

$myArray+="Test2"

#################################

$myList=New-Object -TypeName System.Collections.ArrayList

$myList1.GetType()
$myList.GetType()


$myList.Add("Test1")

$myList.Add("Test2")

$myList.AddRange(@("Test3","Test4","Test5"))

$myList.Remove("Test2")

$myList.RemoveAt(0)

$myList

$myList.RemoveRange(0,2)

$myList.AddRange(@("Test1","Test2","Test3","Test4","Test5"))

$myList
$myList.Count

$array=@()
$arrayList=New-Object -TypeName System.Collections.ArrayList



Measure-Command -Expression {@(0..50000).ForEach({ $array = $array += $_ })}
