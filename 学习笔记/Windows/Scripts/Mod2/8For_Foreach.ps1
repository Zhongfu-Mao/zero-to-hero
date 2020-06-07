# Foreach - used often in our scripting for today
$services = Get-Service
ForEach ($s in $services) {
  $s.Displayname
}

#For loop
For ($i=0;$i –lt 5;$i++) {
 #do something
}

#Another way
1..5 | ForEach-Object -process {
    Start-Process calc
}
