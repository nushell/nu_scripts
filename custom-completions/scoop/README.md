# Scoop Custom Completions

This script provides custom completions for [scoop](https://github.com/ScoopInstaller/Scoop).
It can be used by importing its exported commands via:

```
use path/to/scoop/scoop-completions.nu *
```

With `path/to` being either the relative path of the file to your current working directory or its absolute path. 


## Command Status

- `x` means completed
- `-` means not completed

| ? | Command    | Summary                                                                                        |
|---|------------|------------------------------------------------------------------------------------------------|
| - | alias      | Manage scoop aliases                                                                           |
| x | bucket     | Manage Scoop buckets                                                                           |
| x | cache      | Show or clear the download cache                                                               |
| x | cat        | Show content of specified manifest. If available, `bat` will be used to pretty-print the JSON. |
| x | checkup    | Check for potential problems                                                                   |
| x | cleanup    | Cleanup apps by removing old versions                                                          |
| x | config     | Get or set configuration values                                                                |
| x | create     | Create a custom app manifest                                                                   |
| x | depends    | List dependencies for an app, in the order they'll be installed                                |
| x | download   | Download apps in the cache folder and verify hashes                                            |
| x | export     | Exports installed apps, buckets (and optionally configs) in JSON format                        |
| - | help       | Show help for a command                                                                        |
| x | hold       | Hold an app to disable updates                                                                 |
| x | home       | Opens the app homepage                                                                         |
| x | import     | Imports apps, buckets and configs from a Scoopfile in JSON format                              |
| x | info       | Display information about an app                                                               |
| x | install    | Install apps                                                                                   |
| x | list       | List installed apps                                                                            |
| x | prefix     | Returns the path to the specified app                                                          |
| x | reset      | Reset an app to resolve conflicts                                                              |
| x | search     | Search available apps                                                                          |
| - | shim       | Manipulate Scoop shims                                                                         |
| x | status     | Show status and check for new app versions                                                     |
| x | unhold     | Unhold an app to enable updates                                                                |
| x | uninstall  | Uninstall an app                                                                               |
| x | update     | Update apps, or Scoop itself                                                                   |
| x | virustotal | Look for app's hash or url on virustotal.com                                                   |
| x | which      | Locate a shim/executable (similar to 'which' on Linux)                                         |