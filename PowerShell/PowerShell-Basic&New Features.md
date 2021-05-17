# PowerShell: Basic and new features

> cmd + .NET + C# = PowerShell
> PowerShell is an **Object-Oriented** programming or scripting language, and it is based on .NET.

## WMI && CIM

WMI: Windows Management Instrumentation
CIM: Common Information Model

> PowerShell3.0以降、WMIの使用はもう推薦しない
> [link](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Management/Get-WmiObject)

```powershell
Get-CimInstance -ClassName Win32_BIOS
```
