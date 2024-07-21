# SDK Platform Tools completions

A Nushell extern definition and completers for [SDK Platform Tools `fastboot`](https://developer.android.com/tools/releases/platform-tools).


This module provides extern definitions for almost all of the `fastboot` commands and their flags.

## Usage

simply import the extern definitions with

```nu
use path/to/fastboot-completions.nu * # don't forget the star `*`
```

or

```nu
source path/to/fastboot-completions.nu
```

Once imported completions will be available for commands, flags, options, and some values as well.
Display the commands by entering the `→ tab` key in the command line after `fastboot` or any of it's command options.

