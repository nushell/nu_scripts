# Pacman completions

Native Nushell completions for [pacman](https://archlinux.org/pacman/),
the package manager used by Arch Linux and related distributions.

## Requirements

- Nushell 0.117.0 or later (tested with 0.117.0).
- `pacman` available on `PATH`.

Pacman is included with Arch Linux. For documentation and source downloads,
see the [official pacman website](https://archlinux.org/pacman/).
On other distributions, consult your distribution's package repositories
for availability.

## Usage

Add this import to your Nushell `config.nu`, adjusting the repository path:

```nu
use <yourpath>/nu_scripts/custom-completions/pacman/pacman-completions.nu *
```

Open a new Nushell session, or run the import in your current session.
Then press Tab after any of these examples:

```text
pacman -
pacman -Q
pacman -Q -
pacman -S --
pacman --query --
```

The module suggests operation names and operation-specific flags with
descriptions. For example, `pacman -Q<Tab>` offers combined short flags
such as `-Qi`, `-Ql`, and `-Qs`.

## How it works

A single `extern` passes arguments through without declaring flags.
The native completer identifies the operation and reads its options from
`pacman -<operation> --help`, using the installed version's help output.
Neither Fish nor Carapace is required.

## Limitations

- Package names and operation-specific argument values are not completed.
- Parsing expects pacman's current option-line format; wrapped description
  continuations are not included.
- Combined short-flag suggestions do not check for duplicates or
  incompatible flags.
