#Variables to store your stuff
#Assigning a variable
$MyVar=2
${My Var}="Hello"

#Output a variable
$MyVar
${My Var}
Write-Output $MyVar

#Strongly type a variable
[String]$MyName="Jason"
[int]$Oops="Jason"
$x = [int]"1"
[int]$x = "1"

[ValidateSet("a", "b", "c")][string]$y = "a"
[ValidateSet("a", "b", "c")][string]$y = "test"

[string]$ComputerName=Read-host "Enter Computer Name"
Write-Output $ComputerName

