# PowerShell: As a shell language

## help

```powershell
Update-Help -Force
help Get-WmiObject -Full
Get-Help Get-Help -Detailed
Get-Help Get-Service -ShowWindow
help about*
<cmdlet> -?
get-help about_Functions_Advanced_Parameters -showWindow
```

## Useful

```powershell
Get-PSDrive
Get-PSSnapin
Get-ChildItem Variable:
Set-ExecutionPolicy RemoteSigned
Get-EventLog -LogName Security -Newest 50
$env:COMPUTERNAME
$PSVersionTable
Expand-Archive <filename> -DestinationPath
Start-Sleep
Get-Process | Out-GridView -PassThru
Invoke-Item
Get-Alias -Definition Get-Process
```

## Pipeline

```powershell
'hello world' | Get-Member
Get-Service | Get-Member

Get-Service | Stop-Service
Get-Service | Stop-Process -WhatIf

Get-ChildItem | Out-GridView

Get-Service | Export-Csv service.csv
Get-Service | Export-Clixml service.xml
Get-Process | Export-Clixml a.xml

Get-Service | ConvertTo-Json
Get-Service | ConvertTo-Html | Out-File test.html

Get-Process | Sort-Object -Property VM -Descending

Get-Service -DisplayName *bi* | Stop-Service -WhatIf
Get-Service -DisplayName *bi* | Stop-Service -Confirm
Get-Service | Stop-Service -WhatIf
Stop-Computer -WhatIf
Get-Service | Stop-Service -Confirm
```

## 別のプログラムを起動させる

```powershell
calc
notepad.exe
mspaint.exe
Start-Process chrome.exe
```

## Remote

```powershell
Invoke-Command -ScriptBlock { Get-ChildItem }
Enable-PSRemoting
Enter-PSSession -ComputerName localhost
```

## Format-*

```powershell
# Format-Wide
Get-Process | Format-Wide
Get-Process | Format-Wide -Property Id -Column 3
# Format-Table
Get-Process | Select-Object -Property Name, Id | Format-Table -AutoSize
Get-Process | Format-Table -Property Id, VM, @{
    n="PM(MB)"
    e={$_.PM / 1MB -as [int]}
} -AutoSize
Get-Process | Format-Table -GroupBy Name
Get-Process | Format-Table Name, @{
    name='VM(MB)'; expression={$_.VM}; formatstring='F2'; align='right'
} -autosize
Import-Csv .\cgs_20200202.txt | Format-Table -AutoSize -Wrap
```

## Filter

```powershell
Get-Service | Where-Object -FilterScript { $_.Status -eq 'running'}
Get-Service | Where-Object -FilterScript { $_.Status -eq 'running' -and $_.Name -like '*code*'}
```

## Session

```powershell
New-PSSession -ComputerName localhost
Get-PSSession
Exit-PSSession
Remove-PSSession
```

## Verbose

```powershell
Get-Command -Verb Write
Write-Verbose "This is simply a test, nothing more"
$VerbosePreference = "continue"
Write-Verbose "So far so good?"
$VerbosePreference = "silentlycontinue"
Write-Verbose "What happens this time"
```

## Job

```powershell
Start-Job -ScriptBlock {Get-ChildItem}
Receive-Job -id 1
Get-Job -id 1 | Format-List *
Get-Job -Name job2 | Format-List *
Get-Job -id 1 | Select-Object -expand ChildJobs
Get-Job | Where-Object { -not $_.HasMoreData } | Remove-Job
Invoke-Command -Command { Nothing } -ComputerName notonline -AsJob
Get-Job -Id 6 | Format-List *
Get-Job -Name Job7
Receive-Job -Name Job7
```

## Module

```powershell
Get-Module -ListAvailable
Import-Module
```
