# PowerShell: As a shell language

## Help

```powershell
Update-Help -Force
help Get-WmiObject -Full
Get-Help Get-Help -Detailed
Get-Help Get-Service -ShowWindow
help about*
<cmdlet> -?
get-help about_Functions_Advanced_Parameters -showWindow
```

## Notice

* The Powershell escape character is a **backtick(`)**, not a backslash

## Alias

> Aliases in PowerShell are limited to aliasing the command name only. Unlike in other systems such as Ksh, Bash, and Zsh, PowerShell aliases **can’t include parameters**  
> PowerShell v6 for Linux and macOS removes these aliases(dir, ls etc.) to avoid confusion with native commands.

```powershell
Get-Command [Alias]
```

## Cmdlet

* Cmdlets are .NET Framework class objects and not just stand-alone executables.
* Cmdlets can be easily constructed from as few as a dozen lines of code.
* Parsing, error presentation, and output formatting are not handled by cmdlets. It is done by the Windows PowerShell runtime.
* Cmdlets process works on objects not on text stream and objects can be passed as output for pipelining.
* Cmdlets are record-based as they process a single object at a time.

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

Write-Output -- -InputObject  # Everything after `--` will be treated as an argument
```

## Pipeline

`Command [Switch parameter] [Parameter with argument] Pipe operator Command [Positional argument]`

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
notepad foo.txt | Sort-Object

mspaint.exe

powershell { Get-Process *code } | Format-Table name, handles

Start-Process chrome.exe
```

## Remote

```powershell
Invoke-Command -ScriptBlock { Get-ChildItem }

Enable-PSRemoting

Enter-PSSession -ComputerName localhost
Exit-PSSession
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

## Special Variables

| Operator             | Description                                                                                    |
| :------------------- | :--------------------------------------------------------------------------------------------- |
| `$$`                 | Last token in the last line received by the session.                                           |
| `$?`                 | The execution status(TRUE or FALSE) of the last operation.                                     |
| `$^`                 | The first token in the last line received by the session.                                      |
| `$_`                 | Same as $PSItem.                                                                               |
| `$ARGS`              | An array of arguments                                                                          |
| `$CONSOLEFILENAME`   | The path of the console file (.psc1) that was most recently used in the session.               |
| `$ERROR`             | An array of error objects that represent the most recent errors.                               |
| `$EVENT`             | The event that is being processed.                                                             |
| `$EVENTARGS`         | The first event argument derives from EventArgs of the event been processed.                   |
| `$EVENTSUBSCRIBER`   | The event subscriber of the event that is being processed.                                     |
| `$EXECUTIONCONTEXT`  | The execution context of the PowerShell host.                                                  |
| `$FALSE`             | FALSE.                                                                                         |
| `$FOREACH`           | The enumerator (not the resulting values) of a ForEach loop.                                   |
| `$HOME`              | The full path of the user's home directory.                                                    |
| `$HOST`              | An object that represents the current host application for PowerShell.                         |
| `$INPUT`             | An enumerator that enumerates all input that is passed to a function.                          |
| `$LASTEXITCODE`      | Represents the exit code of the last Windows-based program that was run.                       |
| `$MATCHES`           | Works with the -match and -notmatch operators.                                                 |
| `$MYINVOCATION`      | Populated only for scripts, function, and script blocks.                                       |
| `$NESTEDPROMPTLEVEL` | Represents the current prompt level.                                                           |
| `$NULL`              | NULL or empty value.                                                                           |
| `$PID`               | The process identifier (PID) of current PowerShell session.                                    |
| `$PROFILE`           | The full path of the PowerShell profile for the current user and the current host application. |
| `$PSCMDLET`          | An object that represents the cmdlet or advanced function that is being run.                   |
| `$PSCOMMANDPATH`     | The full path and file name of the script that is being run.                                   |
| `$PSCULTURE`         | The name of the culture currently in use in the operating system.                              |
| `$PSDEBUGCONTEXT`    | While debugging, contains information about the debugging environment.                         |
| `$PSHOME`            | The full path of the installation directory for PowerShell.                                    |
| `$PSITEM`            | Same as $_. Contains the current object in the pipeline object.                                |
| `$PSSCRIPTROOT`      | The directory from which a script is being run.                                                |
| `$PSSENDERINFO`      | Information about the user who started the PSSession                                           |
| `$PSUICULTURE`       | The name of the UI culture that is currently in use in the operating system.                   |
| `$PSVERSIONTABLE`    | A read-only hash table about the version of PowerShell in the current session.                 |
| `$SENDER`            | The object that generated this event.                                                          |
| `$SHELLID`           | The identifier of the current shell.                                                           |
| `$STACKTRACE`        | A stack trace for the most recent error.                                                       |
| `$THIS`              | The object that is being extended in a script block.                                           |
| `$TRUE`              | TRUE.                                                                                          |
