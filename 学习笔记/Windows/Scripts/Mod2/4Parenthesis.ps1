# Parenthesis help!

#Create a txt and csv file
'DC','Client' | Out-file c:\computers.txt
"ComputerName,IPAddress" | Out-file c:\Computers.csv
"DC,192.168.3.10" | Out-file c:\Computers.csv -Append
"Client,192.168.3.100" | Out-File c:\Computers.csv -Append

#Getting names from a txt file
Get-Service -ComputerName (Get-Content c:\computers.txt)

#Getting Names from a CSV
Get-Service -ComputerName (Import-csv C:\Computers.csv).ComputerName

#Using Get-Adcomputer
Invoke-Command -ComputerName (
    Get-Adcomputer -filter "name -like '*c*'" | 
    Select-Object -ExpandProperty Name) -ScriptBlock {Get-Service -name bits}