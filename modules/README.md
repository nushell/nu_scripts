# Modules

- [Modules](#modules)
  - [after](#after)
  - [api\_wrappers](#api_wrappers)
  - [background\_task](#background_task)
  - [base16](#base16)
  - [coloring](#coloring)
  - [data\_extraction](#data_extraction)
  - [docker](#docker)
  - [filesystem](#filesystem)
  - [formats](#formats)
  - [fun](#fun)
  - [github](#github)
  - [gitlab](#gitlab)
  - [jc](#jc)
  - [kubernetes](#kubernetes)
  - [make\_release](#make_release)
  - [maths](#maths)
  - [network](#network)
  - [nvim](#nvim)
  - [progress\_bar](#progress_bar)
  - [rbenv](#rbenv)
  - [record](#record)
  - [system](#system)
  - [virtual\_environments](#virtual_environments)
  - [weather](#weather)
  - [webscraping](#webscraping)


## [after](./after)

Run a function after the given program (by PID)

## api_wrappers

Demo of various API wrappers:
- [Wolfram Alpha](../sourced/api_wrappers/wolframalpha.nu)
- [AWS]()

## background_task

make nushell "support" background task feature.
see [README](./background_task/)


## base16

Base16 theme generator (for Linux, might work for other OS)
see [README](./base16/)

## coloring

These scripts are used to demonstrate the `ansi` command using `ansi` coloring. This is mainly a demo area where we have taken typical `bash` scripts and ported them to nushell scripts. It would be nice if all scripts here showed the "other" version of script and the ported nushell version. We can show "other" flavors of scripts by including them as comments in the nushell scripts or by naming the nushell script and the other script the same basename.


## data_extraction

- [Ultimate Extractor](./data_extraction/ultimate_extractor.nu) - Extract any compressed archive, UE will call the proper program under the hood 😎

## [docker](./docker/)

An extensive example of a wrapper for docker operations, with nushell completions.

## filesystem

- [bm](./filesystem/bm.nu) - A Simple bookmarking module. It uses `XGD_DATA_HOME` to save bookmarks.
- [expand](./filesystem/expand.nu) - expansion module that implements bashes brace expansion. 
The expansion uses a list inside of braces separated by `,` to expand into a list of multiple string variations like:
```
 expand a/{b,c}/d{e,f,g}.nu{,on}
```
parses into:

```
╭────┬─────────────╮
│  0 │ a/b/de.nu   │
│  1 │ a/c/de.nu   │
│  2 │ a/b/df.nu   │
│  3 │ a/c/df.nu   │
│  4 │ a/b/dg.nu   │
│  5 │ a/c/dg.nu   │
│  6 │ a/b/de.nuon │
│  7 │ a/c/de.nuon │
│  8 │ a/b/df.nuon │
│  9 │ a/c/df.nuon │
│ 10 │ a/b/dg.nuon │
│ 11 │ a/c/dg.nuon │
╰────┴─────────────╯
```

## formats
Examples of input/output formatters:
- [from-cpuinfo](./formats/from-cpuinfo.nu)
- [from-dmidecode](./formats/from-dmidecode.nu)
- [to-ini](./formats/to-ini.nu)
- [remove-diacritics](./formats/remove-diacritics.nu) - Turns `Zażółć gęślą jaźń` into `Zazolc gesla jazn`


## fun

- [spark](../sourced/fun/spark.nu) - send an array into spark and get a sparkline out:
    ```console
    > let v = [2, 250, 670, 890, 2, 430, 11, 908, 123, 57]
    > spark $v
    ▁▂▆▇▁▄▁█▁▁
    ```
- [website-builder](../sourced/fun/website_builder.nu) - converts markdown into their equivalent html pages
- [wordle](./fun/wordle.nu) - A Terminal Wordle game. The code is based on this [gist](https://gist.github.com/huytd/6a1a6a7b34a0d0abcac00b47e3d01513), but slightly personalized.


## github

- [branch-protections](../sourced/github/branch-protections/) - Do you have hundreds or thousands of GitHub repositories in your organization? Are you tired of manually managing their branch protection rules? Don't! Let nushell do it for you! see [README](../sourced/github/branch-protections/README.md)
- [merged-branches](../sourced/github/merged-branches/) - Do your developers often forget to delete their branches after merging PRs? Are you tired of manually going into every repository and deleting them? Don't! Let nushell do it for you! see [README](../sourced/github/merged-branches/README.md)

## [gitlab](../sourced/gitlab/)
Search files on your GitLab server

## [jc](./jc/)

Converts the output of many common external commands into nushell data structures.

Example:
```nushell
: jc ping -4 -c 2 google.com
╭──────────────────────┬──────────────────────────────────────────────────────────────────────────────────────────╮
│ destination_ip       │ 216.58.209.46                                                                            │
│ data_bytes           │ 56                                                                                       │
│ pattern              │                                                                                          │
│ destination          │ google.com                                                                               │
│ duplicates           │ 0                                                                                        │
│ packets_transmitted  │ 2                                                                                        │
│ packets_received     │ 2                                                                                        │
│ packet_loss_percent  │ 0.00                                                                                     │
│ time_ms              │ 1001.00                                                                                  │
│ round_trip_ms_min    │ 3.87                                                                                     │
│ round_trip_ms_avg    │ 4.04                                                                                     │
│ round_trip_ms_max    │ 4.21                                                                                     │
│ round_trip_ms_stddev │ 0.17                                                                                     │
│                      │ ╭───┬───────┬───────────┬───────┬───────────────┬──────────┬─────┬─────────┬───────────╮ │
│ responses            │ │ # │ type  │ timestamp │ bytes │  response_ip  │ icmp_seq │ ttl │ time_ms │ duplicate │ │
│                      │ ├───┼───────┼───────────┼───────┼───────────────┼──────────┼─────┼─────────┼───────────┤ │
│                      │ │ 0 │ reply │           │    64 │ 216.58.209.46 │        1 │ 120 │    4.21 │ false     │ │
│                      │ │ 1 │ reply │           │    64 │ 216.58.209.46 │        2 │ 120 │    3.87 │ false     │ │
│                      │ ╰───┴───────┴───────────┴───────┴───────────────┴──────────┴─────┴─────────┴───────────╯ │
╰──────────────────────┴──────────────────────────────────────────────────────────────────────────────────────────╯
```
```nushell
: (jc ping -4 -c 2 google.com).round_trip_ms_avg
6.054
```
For supported commands see [JC parsers documentation](https://kellyjonbrazil.github.io/jc/#parsers)

Installation:

  1. Install the `jc` command line: https://kellyjonbrazil.github.io/jc/#installation
  2. Import this module in your `config.nu`: `import ~/.local/share/nu_scripts/modules/jc/`

## [kubernetes](./kubernetes/)
???
 
## [make_release](../make_release/)
???

## [maths](./maths/)

- [math_functions] - module with the following commands:
  - `root` - root with a custom denominator
  - `croot` - cube root
  - `aroot` - root with a custom scaler and denominator
  - `delta` - calculate the delta of the quadratic function
  - `fact` - factorial of the given number
  - `q_roots` - calculare roots of the quadratic function: ax^2+bx+x
  - `isprime` - check if integer is prime
  - `primelist` - list primes until given number
  - `mtable` - multiplication table of n till max
  - `isleap` - check if year is leap
  - `gcd` - greatest common divisor between 2 integers
  - `lcm` - least commoin multiple between 2 integers
  - `dec2base` - decimal number to custom base representation
  - `scale-minmax` - scale list to `[a,b]` interval
  - `scale-minmax-table` - Scale every column of a table (separately) to `[a,b]` interval
  - `math exp` - exp function

## network
- [remoting](./network/remoting/) - This module provide convenient way to manage multiple remote clients. see [README](./network/remoting)

- [sockets](./network/sockets/) - The `sockets` command returns a table containing information on network sockets and the processes they belong to.
It is basically a join of the tables produced by the `lsof` command, and the nushell `ps` command.
    
    <img width="1486" alt="image" src="https://user-images.githubusercontent.com/52205/196287615-00e46f8e-06ed-45ce-8fe7-a5c5f38afaaa.png">


- [ssh](./network/ssh.nu) wrapper that provides the following commands:
  - `ssh`
  - `scp`
  - `ssh-list`
  - `parse-ssh-file`
  - `str max-length`
  - `ensure-index`


## [nvim](./nvim/)
??? (not sure how universal this is) Mix of hooks, defs and alias wrapper around neovim.

## [progress_bar](../sourced/progress_bar/)
??? (make a module out of these scripts?) - Collection of progress bars
  
## [rbenv](./rbenv/)
??? (not sure how universal this is) This script provides minimal working rbenv setup.

## [record](../stdlib-candidate/record/)
A module to manipulate nu's record

## [system](./system/)
Currently holds the `clip` command which was previously incorrectly in the standard library of Nushell.
```nushell
use modules/system *  # will bring `clip` into scope
```

## [virtual_environments](./virtual_environments/)
The scripts in this directory activate virtual environments for Conda environments.

## [weather](./weather/)
These scripts should be used to demonstrate how get your local weather and/or weather forecasts.


## [webscraping](../sourced/webscraping/)
Simple scripts to demonstrate how to scrape websites in nushell. Requires `query web` plugin
