# PowerShell: As a Scripting Language

## comment

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

## region

```powershell
#region 

#endregion
```

## type

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

```powershell
$x = 'hello'
$y = 'world'
$a = "$x + $y"
$b = '`$x + `$y'
$a
$b
Write-Host "hello" -ForegroundColor Red -BackgroundColor Yellow
$foo = Read-Host "Enter a interger"
$foo

$str = [string]"hello"
$today = Get-Date
$today.ToSingle()

123456.789 -as [int]
123456.789 -is [int]
123456.789 -isnot [int]
```

## string

## Array

## Hashtable

## Function

```powershell
function Get-OSInfo {
    param (
        $computer_name = "localhost"
    )
    Get-WmiObject -class win32_bios -ComputerName $computer_name
}
```

### If

### Switch

```powershell
$computer_name = Read-Host "Please give me a computer name"
switch ($computer_name) {
    'localhost' {
        Write-Host "Local Machine Selected"
     }
    Default {
        Write-Host "Unknown Computer"
    }
}
```

### While, Do..While

### foreach

```powershell
$services = Get-Service
foreach ($service in $services) {
    Write-Host $service
}
Get-Service | Write-Host
```

### Try Catch

## モジュール

拡張子は`.psm1`

```powershell
Import-Module <ModuleName.psm1> -Force -Verbose
$env:PSModulePath -split ";"
``