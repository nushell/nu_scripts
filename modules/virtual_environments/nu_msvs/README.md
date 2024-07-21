# MSVS Module for Nushell
A module for Using Microsoft Visual Studio (MSVS) command line tools from Nushell.


## Prerequisites
- [nushell](https://github.com/nushell/nushell) >= 0.94.0
- [vswhere](https://github.com/microsoft/vswhere) standalone or comes with VS


## Installation
Put `nu_msvs.nu` into the module folder of your nushell configuration workspace.


## Usage
```nu
use nu_msvs.nu
nu_msvs activate  # Use 'nu_msvs activate --help' to see all available options
nu_msvs deactivate
```


## How It Works
MSVS provides scripts (such as `vsdevcmd.bat` and `vsvarsall.bat`) for
developers to use its command line tools (such as `cl.exe`) in Command Prompt
and Powershell, but these scripts are not available for nushell. One method to
use MSVS command line tools in nushell was described in nushell/nushell#5803,
which requires launching nushell within an Command Prompt/Powershell instance.
However, running `vsdevcmd.bat` or launching Powershell is quite slow.
Therefore, `nu_msvs.nu` is introduced and works similar to a virtual
environment.

When activating the MSVS environment (take MSVC tools for example):
1. Necessary path are added to `PATH`/`Path` to allow command line tools (e.g.
`cl.exe`) to be run in nushell.
2. An environment variable `INCLUDE` is defined and consists of Win32 header
directories, which will be used by `cl.exe`.
3. An environment variable `LIB` is defined and consists of Win32 library
directories, which will be used by `link.exe`.


## Supported Tools
- [x] MSVC
- [ ] ...
