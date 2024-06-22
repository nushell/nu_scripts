# Run `jc` (Json Converter)
#
# This module provides a wrapper around the `jc` command line tool and automatically
# parses its output into a structured data format.
#
# Dependencies:
#     * `jc`
#
# Installation:
#     1. Install the `jc` command line: https://kellyjonbrazil.github.io/jc/#installation
#     2. Import this module in your `config.nu`: `import ~/.local/share/nu_scripts/modules/jc/`
export def --wrapped main [...args]: [any -> table, any -> record, any -> string] {
  let run = (^jc ...$args | complete)

  if $run.exit_code != 0 {
    error make {
      msg: $run.stderr,
      label: {
        text: "jc execution failed",
        span: (metadata $args).span
      }
    }
  }

  if '--help' in $args or '-h' in $args {
    $run.stdout
  } else {
    $run.stdout | from json
  }
}
