# 基础知识

## .NET Framework

* .NET Framework is a development platform that includes a **Common Language Runtime (CLR)**, which manages the execution of code, and a **Base Class Library (BCL)**, which provides a rich library of classes to build applications from
* Since .NET Framework 4.5.2 it has been an official component of the Windows operating system

## .NET Core & .NET 5

* a crossplatform implementation of the CLR known as CoreCLR and a streamlined library of classes known as CoreFX -> .NET Core
* .NET Core has been renamed .NET since .NET 5
* 跳过版本4是为了避免与`.NET Framework`混淆

## .NET Runtime & .NET SKD

```bash
dotnet --list-sdks
dotnet --list-runtimes

dotnet-core-uninstall --all-previews-but-latest --sdk
```

* .NET Runtime versioning follows semantic versioning
  * major increment indicates breaking changes
  * minor increments indicate new features
  * patch increments indicate bug fixes
* .NET SDK versioning does not follow semantic versioning
  * The major and minor version numbers are tied to the runtime version it is matched with. 
  * The patch number follows a convention that indicates the major and minor version of the SDK.

## ASP.NET Core

ASP.NET MVC and ASP.NET Web API. 

These two technologies have been refactored and combined into a platform that runs on .NET 5, named **ASP.NET Core**

## .NET Standard

2021年十一月以前, .NET有三大平台

* .NET Core: for cross-platform and new apps
* .NET Framework: for legacy apps
* Xamarin: for mobile apps

> .NET Standard: a specification for a set of APIs that all .NET platforms could implement to indicate what level of compatibility they have.
>
> .NET Standard is just a standard like HTML 5

2021年11月`.NET 6`发布后,三大平台将被统一为.NET平台

# CLI

```bash
dotnet --version

dotnet new console
dotnet run
```

