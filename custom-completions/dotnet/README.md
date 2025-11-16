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

From the .NET SDK version 10 onwards, the `dotnet` CLI offers `dotnet completions script nushell` that generaltes a Nushell external completer configuration.
Unfortunately, it is not directly pluggable, but more of a mix of generated forwarding completer and manual configuration integration guide:

```nushell
# Add the following content to your config.nu file:

let external_completer = { |spans|
    {
        dotnet: { ||
            dotnet complete (
                $spans | skip 1 | str join " "
            ) | lines
        }
    } | get $spans.0 | each { || do $in }
}

# And then in the config record, find the completions section and add the
# external_completer that was defined earlier to external:

let-env config = {
    # your options here
    completions: {
        # your options here
        external: {
            # your options here
            completer: $external_completer # add it here
        }
    }
}
```
