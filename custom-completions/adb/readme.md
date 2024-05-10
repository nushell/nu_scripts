# SDK Platform Tools completions

A Nushell extern definition and completers for [Android Debugger Bridge `adb`](https://developer.android.com/tools/adb).


This module provides extern definitions for almost all of the `adb` commands and their flags.

## Usage

simply import the extern definitions with

```nu
use path/to/adb-completions.nu * # don't forget the star `*`
```

or

```nu
source path/to/adb-completions.nu
```

Once imported completions will be available for commands, flags, options, and some values as well.
Display the commands by entering the `→ tab` key in the command line after `adb`or any of it's command options.

