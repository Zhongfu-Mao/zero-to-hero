# PowerShell: Basic and new features

## Basics

### Concepts

* `shell`: Historically, the term shell describes the piece of software that sits over an operating system’s core functionality. This core functionality is known as the *operating system kernel*.
* f

### Intro

> cmd + .NET + C# = PowerShell  
> PowerShell syntax is aligned with C#. The major value this brings is PowerShell code can be migrated to C# when necessary for performance improvements, and, more importantly, C# examples can be easily converted to PowerShell  
> PowerShell is an **Object-Oriented** programming or scripting language, and it is based on .NET.  
> Windows is an API-driven operating system, compared to UNIX and its derivatives, which are document (or text) driven  
> PowerShell is an object-based shell. Everything in PowerShell has a type  
> It is best practice to reserve aliases for interactive usage and not use them in scripts.  
> The core PowerShell language is based on the mature IEEE standard POSIX 1003.2 grammar for the Korn shell, which has a long history as a successful basis for modern shells like Bash and Zsh  

## Version history

> PowerShell v2 was a big release bringing modules, remoting, and jobs.  
> Subsequent releases have been as big in terms of their impact—PowerShell v3 brought PowerShell workflows and the CIM cmdlets;  
> PowerShell v4 brought Desired State Configuration;  
> and PowerShell v5 brought the ability to write classes in PowerShell.  
> The ForeachObject cmdlet now has a -Parallel switch that allows you to run script blocks in parallel  
> There are three new operator sets in PowerShell: the Ternary operator ( a ? b : c), the Pipeline chain operators ( | | and &&), and the Null coalescing operators (?? and ??=)

V2: modules, remoting, jobs  
V3: workflow, CIM cmdlets  
V4: Desired State Configuration  
V5: class  
V6: open source; .NET Core; Linux & Macos  
V7: `-Parallel` in `Foreach`; new operators

## WMI && CIM

WMI: Windows Management Instrumentation
CIM: Common Information Model

> PowerShell3.0以降、WMIの使用はもう推薦しない
> [link](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Management/Get-WmiObject)

```powershell
Get-CimInstance -ClassName Win32_BIOS
```
