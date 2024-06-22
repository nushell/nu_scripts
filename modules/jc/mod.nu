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
