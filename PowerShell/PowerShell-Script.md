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

* Operator for working with types: `<value> is <type>`, `<expr> -isnot <type>`, `<expr> -as <type>`

* Unary operators: 
  * `-not <value>`, `+ <value>`, `- <value>`, `|cast| <value>`
  * `-- <assignableExpr>`, `<assignableExpr> --`
  * `++ <assignableExpr>`, `<assignableExpr> ++`

* Grouping expression and subexpression operators: 
  * simple parenthetical expression: `(<pipeline>)`
  * subexpression: `$(<statementList>)`, `@(<statementList>)`
```powershell
$($c=$p=1; while($c -lt 100) {$c; $c, $p =($c+$p), $c}).count
```
> By enclosing the statements in `$(<statement>)`, you can retrieve the result of the enclosed collection of statements as an array.  
> Array expression `@(...)` is shorthand for `[object[]] $(...)`  

* Array Operator:
  * Comma operator: `<value1>, <value2>, <value3>`
  * Range operator: `<lowerBound>..<upperBound>`
  * indexing and slicing: `<valueExpression>[<valueExpression>]`

* Property and method operators:
  * Property operators: `<value>.<memberNameExpr>`, `<typeValue>::<memberNameExpr>`
  * Method operators: `<value>.<memberNameExpr>(<arguments>)`, `<typeValue>::<memberNameExpr>(<arguments>)`

```powershell
$t = [string]
$t::join('+', (1, 2, 3))

using namespace System.Windows.Forms
$form = [Form] @{
    Text = 'My First Form'
}
$button = [Button] @{
    Text = 'Push Me!'
    Dock = 'Fill'
}
$button.add_Click{
    $form.Close()
}
$form.Controls.Add($button)
$form.ShowDialog()

[math]::sin.Invoke(3.14)
```

* Format operator: `<formatSpecificationString> -f <argumentList>`

```powershell
'{2} {1} {0}' -f 1, 2, 3

'|{0, 10}|0x{1:x}|{2, -10}|' -f 10, 20, 30
```

* Redirection operators: `<pipeline> > <outputFile>`, `<pipeline> >> <outputFile>`, `<pipeline> 2> <errorFile>`, `<pipeline> 2>> <errorFile>`, `<pipeline> 2>&1`
  * `*`: All output
  * `1`: Success output
  * `2`: Error
  * `3`: Warning messages
  * `4`: Verbose output
  * `5`: Debug messages
  * `6`: Information messages

> The `>` operator will overwrite any previous contents of the file.  
> Use `>>` (or `n>>`) to append to the chosen output file.  
> Under the covers, redirection is done using the `Out-File` cmdlet  
> Sometimes you want to discard output or errors. In PowerShell, you do this by redirecting to $null.

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
