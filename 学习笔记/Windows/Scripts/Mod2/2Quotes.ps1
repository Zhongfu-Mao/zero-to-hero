#Quotation Markes

#Double quotes resolve the variable
$i="PowerShell"

"This is the variable $i, and $i Rocks!"
'This is the variable $i, and $i Rocks!'
"This is the variable `$i, and $i Rocks!"

$computerName="Client"
Get-service -name bits -ComputerName "$ComputerName" | 
    Select-Object MachineName, Name, Status

$p = Get-Process lsass
"Process id = $p.id"
$p.ToString()
"Process id = $($p.id)"
"Process id = $(Read-Host -Prompt "What should I give them")"