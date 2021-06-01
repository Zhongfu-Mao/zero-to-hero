# PowerShell: As a Scripting Language

## Comment

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

## Region

```powershell
#region 

#endregion
```

## Type

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

> PowerShell is a type-promiscuous language, somewhat like JavaScript

```powershell
$str = [string]"hello"
$today = Get-Date
$today.ToSingle()

123456.789 -as [int]
123456.789 -is [int]
123456.789 -isnot [int]

[string] | Get-Member -Static

$s = 'one', 'two', 'three'
[string]::Join(' + ', $s)

"0x{0:x}" -f [int][char] 'a'
```

## String

> There are four kinds of string literals in PowerShell:  
> single-quoted strings, double-quoted strings,  
> single-quoted here-strings, and double-quoted here-strings  

```powershell
$str1 = 'Single Quoted'
$str2 = "Double Quoted"

$strh1 = @'
Single
Quoted
'@

$strh2 = @"
Double
Quoted
"@
```

> It’s recommended to use single-quoted strings and here-strings, unless you’re explicitly using variable expansion in the strings  
> In PowerShell, a string is a sequence of **16-bit Unicode** characters and is directly implemented using the .NET System.String type.  
> In almost all modern languages, strings are immutable. The biggest exception to this we’re aware of is Apple’s new language **Swift**. Probably due to the need for backward compatibility with Objective-C, Swift’s strings are **mutable**.  
> Double-quoted strings (sometimes called expandable strings) support variable substitution.  
> Arguments to commands without explicit quotes are treated as though they were in double quotes, so variables will be expanded in that situation as well.  
> A here-string is used to embed large chunks of text inline in a script  
> Here-strings start with `@<quote><newline>` and end with `<newline><quote>@`  

## Array

> There’s no array literal notation in PowerShell.  
> The simplest way to build array is to use the comma operator `(,)`.  
> Attempts to assign outside the bounds of an array will result in a range error. This is because PowerShell arrays are based on .NET arrays and their size is fixed.  
> You can add elements through array concatenation using the plus `(+)` or plus-equals `(+=)` operators.  

## Hashtable

> The hashtable starts with the token `@{` and ends with `}`.  
> Each member of the key-value pair of the hashtable has its own line. There’s no need to use a semicolon `(;)` between key-value pairs.  
> PowerShell treats hashtables like scalar objects  
> In PowerShell, the foreach loop will run only once because the hashtable isn’t considered an enumerable, at least not by default.  
> Ordered hashtable is created by adding `[ordered]` cast before `@{}`

## Operator

* Arithmetic operators: `+`, `-`, `*`, `/`, `%`

* Assignment operators: `=`, `+=`, `-=`, `*=`, `/*`, `%=`
```powershell
$a, $b = $b, $a # Like Python & JavaScript
$data = Get-Content -Path data.txt | Foreach-Object {
    $e=@{}, $e.level, [int] $e.lower, [int] $e.upper = -split $PSItem
    $e
}
```

* Comparison operators:
  * default(case-insensitive): `-eq`, `-ne`, `-gt`, `-ge`, `-lt`, `-le`
  * case-sensitive: `-ceq`, `-cne`, `-cgt`, `-cge`, `-clt`, `-cle`
  * case-insensitive: `-ieq`, `-ine`, `-igt`, `-ige`, `-ilt`, `-ile`

* Containment operators:
  * default(case-insensitive): `-contains`, `-notcontains`, `-in`, `-notin`
  * case-sensitive: `-ccontains`, `-cnotcontains`, `-cin`, `-cnotin`
  * case-insensitive: `-icontains`, `-inotcontains`, `-iin`, `-inotin`

* Pattern-matching and text-manipulation operators:
  * default(case-insensitive): `-like`, `-notlike`, `-match`, `-notmatch`, `-replace`, `-split`
  * case-sensitive: `-clike`, `-cnotlike`, `-cmatch`, `-cnotmatch`, `-creplace`, `-csplit`
  * case-insensitive: `-ilike`, `-inotlike`, `-imatch`, `-inotmatch`, `-ireplace`, `-isplit`
  * wildcard: `*`, `?`, `[<char> - <char>]`, `[<char><char>]`

| Character sequence | Description                                                                       |
| :----------------- | :-------------------------------------------------------------------------------- |
| `$number`          | Substitutes the last submatch matched by group number.                            |
| `${name}`          | Substitutes the last submatch matched by a named capture of the form (`?<name>`). |
| `$$`               | Substitutes a single "$" literal.                                                 |
| `$&`               | Substitutes a copy of the entire match itself.                                    |
| <code> $` </code>  | Substitutes all the text from the argument string before the matching portion.    |
| <code> $' </code>  | Substitutes all the text of the argument string after the matching portion.       |
| `$+`               | Substitutes the last submatch captured.                                           |
| `$_`               | Substitutes the entire argument string.                                           |

* Logical and bitwise operators:
  * logical: `-and`, `-or`, `-not`, `-xor`, `-shl`, `-shr`
  * bitwise: `-band`, `-bor`, `-bnot`, `-bxor`

* `Where()` and `ForEach()` methods

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
