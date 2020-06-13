# PowerShell 7の世界へようこそ

## 参考になるかも知れない資料

### ビデオ

[Youtube](https://www.youtube.com/watch?v=6CRTahGYnws&list=PL6D474E721138865A&index=1)
[PowerShell 3.0 Basic](https://channel9.msdn.com/series/GetStartedPowerShell3/01)
[PowerShell 3.0 Advanced](https://channel9.msdn.com/Series/advpowershell3/01)

### 文書

[日本語](https://docs.microsoft.com/ja-jp/powershell/)
[変遷](https://ja.wikipedia.org/wiki/PowerShell#%E5%A4%89%E9%81%B7)

### [フォーラム](https://powershell.org)

### 管理者権限で開く

```powershell
start-process powershell -verb runas
```

### ISE(Integrated Script Environment)

> 新しい機能もう追加しないので`VSCode+Powershell Extension`を利用するのをおすすめ
> 公式ExtensionにはVSCodeの`Color Theme`も付いている、実際の効果はISE以上

### CMDやBASHとの１番の違いー**オブジェクト指向**

## Command

### Help

```powershell
help Get-WmiObject -Full

```

### 実用的

```powershell
Get-PSDrive
Get-PSSnapin
Set-ExecutionPolicy RemoteSigned
Get-Module -ListAvailable
Import-Module
Get-EventLog -LogName Security -Newest 50
$env:COMPUTERNAME
Expand-Archive <filename> -DestinationPath
Start-Sleep
$PSVersionTable
Get-Process | Out-GridView -PassThru
Invoke-Item
```

### Pipeline

```powershell
Get-Service | Get-Member
Get-Service | Stop-Service
Get-Service | Stop-Process -WhatIf
Get-ChildItem | Out-GridView
Get-Service | Export-Csv service.csv
Get-Service | Export-Clixml service.xml
Get-Service | ConvertTo-Html | Out-File test.html
Get-Process | Sort-Object -Property VM -Descending

```

### 別のプログラムを起動させる

```powershell
calc
notepad.exe
mspaint.exe
Start-Process chrome.exe
Get-Process | Format-Wide
Get-Process | Format-Wide -Property Id -Column 3
Get-Process | Select-Object -Property Name, Id | Format-Table -AutoSize
Get-Process | Format-Table -Property Id, VM, @{
    n="PM(MB)"
    e={$_.PM / 1MB -as [int]}
} -AutoSize
Get-Process | Format-Table -GroupBy Name
Get-Process | Format-Table Name, @{
    name='VM(MB)'; expression={$_.VM}; formatstring='F2'; align='right'
} -autosize
Get-Service | Where-Object -FilterScript { $_.Status -eq 'running'}
Get-Service | Where-Object -FilterScript { $_.Status -eq 'running' -and $_.Name -like '*code*'}
Invoke-Command -ScriptBlock { Get-ChildItem }
Enable-PSRemoting
Enter-PSSession -ComputerName localhost
Get-Job
Start-Job -ScriptBlock {
    Get-Location
}
Get-Job
Receive-Job -id 1
Invoke-Command {Get-WmiObject win32_Process -ASJob}
Get-ChildItem Variable:
'hello world' | Get-Member
$x = 'hello'
$y = 'world'
$a = "$x + $y"
$b = '`$x + `$y'
$a
$b
Write-Host "hello" -ForegroundColor Red -BackgroundColor Yellow
$foo = Read-Host "Enter a interger"
$foo

Get-Command -Verb Write
Write-Verbose "This is simply a test, nothing more"
$VerbosePreference = "continue"
Write-Verbose "So far so good?"
$VerbosePreference = "silentlycontinue"
Write-Verbose "What happens this time"

New-PSSession -ComputerName localhost
Get-PSSession
Exit-PSSession
Remove-PSSession

function Get-OSInfo {
    param (
        $computer_name = "localhost"
    )
    Get-WmiObject -class win32_bios -ComputerName $computer_name
}

$computer_name = Read-Host "Please give me a computer name"
switch ($computer_name) {
    'localhost' {
        Write-Host "Local Machine Selected"
     }
    Default {
        Write-Host "Unknown Computer"
    }
}

$services = Get-Service
foreach ($service in $services) {
    Write-Host $service
}
Get-Service | Write-Host

$str = [string]"hello"
$today = Get-Date
$today.ToSingle()

123456.789 -as [int]
123456.789 -is [int]
123456.789 -isnot [int]

cmd + .NET + C# = windows PowerShell

Get-Alias -Definition Get-Process

Update-Help -Force
Get-Help Get-Help -Detailed
Get-Help Get-Service -ShowWindow
help about*

Import-Csv .\cgs_20200202.txt | Format-Table -AutoSize -Wrap
Get-Process | Export-Clixml a.xml
Get-Service | ConvertTo-Json
Get-Service | Stop-Service -WhatIf
Stop-Computer -WhatIf
Get-Service | Stop-Service -Confirm
Get-Service -DisplayName *bi* | Stop-Service -WhatIf
Get-Service -DisplayName *bi* | Stop-Service -Confirm

Get-Module -ListAvailable

cmdlet -> command-lets
```

### WMI && CIM

WMI: Windows Management Instrumentation
CIM: Common Information Model
WMI is MicroSoft's implemenattion of CIM
> PowerShell3.0以降、WMIの使用はもう推薦しない
> [link](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Management/Get-WmiObject)

```powershell
Get-CimInstance -ClassName Win32_BIOS
```

## Script

### コメント

VSCodeに`comment-help`を入力したら、以下のようなコメントブロックが出てくる

```powershell
<#
.SYNOPSIS
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
```

### 変数

#### [type](https://renenyffenegger.ch/notes/Windows/PowerShell/language/type/index)

##### よく使われているタイプ

[string]    Fixed-length string of Unicode characters
[char]      A Unicode 16-bit character
[byte]      An 8-bit unsigned character
[int]       32-bit signed integer
[long]      64-bit signed integer
[bool]      Boolean True/False value
[decimal]   A 128-bit decimal value
[single]    Single-precision 32-bit floating point number
[double]    Double-precision 64-bit floating point number
[DateTime]  Date and Time
[xml]       Xml object
[array]     An array of values
[hashtable] Hashtable object

### Array

### Hashtable

### Function

```powershell
get-help about_Functions_Advanced_Parameters -showWindow
```

### 判断

### ループ

### Try Catch

### モジュール

拡張子は`.psm1`

```powershell
Import-Module <ModuleName.psm1> -Force -Verbose
$env:PSModulePath -split ";"
```

### PowerShell 7

```powershell
1..100 | ForEach-Object -Parallel {
    Start-Sleep 1
    Write-Host -NoNewline "$_ "
} -ThrottleLimit 100
```

## 面白そう
