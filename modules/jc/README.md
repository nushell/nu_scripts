# jc (JSON converter)

jc converts the output of many commands, file-types, and strings to JSON or YAML

This module provides a wrapper around the `jc` command line tool and
automatically parses its output into a structured data format.

## Example

```nu
> df | jc --df

┌─#─┬───filesystem───┬─1k_blocks─┬───used────┬─available─┬─────────mounted_on─────────┬─use_percent─┬─capacity_percent─┐
│ 0 │ /dev/disk3s1s1 │ 482797652 │ 368026060 │ 114771592 │ /                          │          77 │               24 │
│ 1 │ /dev/disk3s6   │ 482797652 │ 368026060 │ 114771592 │ /System/Volumes/VM         │          77 │               24 │
│ 2 │ /dev/disk3s2   │ 482797652 │ 368026060 │ 114771592 │ /System/Volumes/Preboot    │          77 │               24 │
│ 3 │ /dev/disk3s4   │ 482797652 │ 368026060 │ 114771592 │ /System/Volumes/Update     │          77 │               24 │
│ 4 │ /dev/disk1s2   │    512000 │     23052 │    488948 │ /System/Volumes/xarts      │           5 │               96 │
│ 5 │ /dev/disk1s1   │    512000 │     23052 │    488948 │ /System/Volumes/iSCPreboot │           5 │               96 │
│ 6 │ /dev/disk1s3   │    512000 │     23052 │    488948 │ /System/Volumes/Hardware   │           5 │               96 │
│ 7 │ /dev/disk3s7   │ 482797652 │ 368026060 │ 114771592 │ /nix                       │          77 │               24 │
│ 8 │ /dev/disk4     │    524288 │     12316 │    511972 │ /private/var/run/agenix.d  │           3 │               98 │
└───┴────────────────┴───────────┴───────────┴───────────┴────────────────────────────┴─────────────┴──────────────────┘
```

## Installation

1. Install the `jc` command line:
   <https://kellyjonbrazil.github.io/jc/#installation>

2. Source this module in your `config.nu`:
   ```nu
   use modules/jc
   ```
