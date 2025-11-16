# .NET CLI completions

Completions for the .NET CLI (`dotnet`), which comes with .NET SDK.

.NET is, to quote the official documentation, an "open-source developer platform for building many different types of applications".

For more information, see

- [Installation instructions](https://learn.microsoft.com/en-us/dotnet/core/install/),
- [CLI documentation](https://learn.microsoft.com/en-us/dotnet/core/tools/),
- [General dotnet documentation](https://learn.microsoft.com/en-us/dotnet/fundamentals/).

## SDK dependency and Limitations

This plugin uses built-in `dotnet complete` command. Unfortunately, it does not cover all capabilities of Nushell, like completion comments.
(See [capabilities](https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#completion-capabilities).)

Despite being the official, native, integrated completion mechanism, `dotnet complete` may not cover all commands.
For example, version 10.0.100 does not cover the new `dotnet completions` commands.

For hand-crafted completions, see other completions like the ones generated from Fish located in (../auto-generate/completions/dotnet.nu).

## .NET SDK 10 and `dotnet completions`

From the .NET SDK version 10 onwards, the `dotnet` CLI offers `dotnet completions script nushell` which generaltes a Nushell external completer configuration,
but in an outdated format.
As such, it can not be used with current Nushell versions.
