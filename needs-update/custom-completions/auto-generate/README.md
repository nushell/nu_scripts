# auto-generate completions

- basic helpers to parse --help information from cli commands and export nu completions source
- basic helpers tp parse .fish complete files and export nu completions source

# parse-fish

## current
- only parses out simple complete's with no complete's boolean arguments like -f
- does not map fish autocomplete helpers to nu-complete helps (a nu library of autocomplete utils would be neat)

## usage

be in a directory with one or more .fish completion scripts

A good one is 

`git clone https://github.com/fish-shell/fish-shell`
`cd fish-shell/share/completions`

To build all .fish files in the current directory `build-completions-from-pwd`

```nu
build-completions-from-pwd
ls *.nu
```

To build a single .fish file and choose the output file
```nu
build-completion cargo.fish cargo.nu
```
# parse-help

## current limitations

- Only flags are parsed, arguments are not parsed and ...args is injected at the end to catch all
- Some examples of `--flags` in descriptions can throw off the regex and get included in the parsed flags
- `<format>` (types) to flags are parsed, but not added to the nu shell completion type hints

## usage

generate and save source to a file

```nu
source parse-help.nu
cargo --help | parse-help | make-completion cargo | save cargo.nu
``` 

## example

This can be saved to a file and sourced. Example of output

```nu
extern "cargo" [
	--version(-V)		#Print version info and exit
	--list		#List installed commands
	--explain		#Run `rustc --explain CODE`
	--verbose(-v)		#Use verbose output (-vv very verbose/build.rs output)
	--quiet(-q)		#Do not print cargo log messages
	--color		#Coloring: auto, always, never
	--frozen		#Require Cargo.lock and cache are up to date
	--locked		#Require Cargo.lock is up to date
	--offline		#Run without accessing the network
	--config		#Override a configuration value (unstable)
	--help(-h)		#Print help information
	...args
]

extern "nu" [
	--help(-h)		#Display this help message
	--stdin		#redirect the stdin
	--login(-l)		#start as a login shell
	--interactive(-i)		#start as an interactive shell
	--version(-v)		#print the version
	--perf(-p)		#start and print performance metrics during startup
	--testbin		#run internal test binary
	--commands(-c)		#run the given commands and then exit
	--config		#start with an alternate config file
	--env-config		#start with an alternate environment config file
	--log-level		#log level for performance logs
	--threads(-t)		#threads to use for parallel commands
	...args
]
```

Which outputs like so on tab completion for `cargo --`
```
❯ | cargo --
--color    Coloring: auto, always, never
--config   Override a configuration value (unstable)
--explain  Run `rustc --explain CODE`
--frozen   Require Cargo.lock and cache are up to date
--help     Display this help message
--help     Print help information
--list     List installed commands
--locked   Require Cargo.lock is up to date
--offline  Run without accessing the network
--quiet    Do not print cargo log messages
--verbose  Use verbose output (-vv very verbose/build.rs output)
--version  Print version info and exit
```