def --env "nu-complete jc" [] {
  if $env.__NU_COMPLETE_JC? != null {
    return $env.__NU_COMPLETE_JC
  }

  let options = try {
    let options = ^jc --help
    | collect
    | parse "{_}Parsers:\n{_}\n\nOptions:\n{inherent}\n\nSlice:{_}"
    | get 0

    let parsers = ^jc --about
    | from json
    | get parsers
    | select argument description
    | rename value description

    let inherent = $options.inherent
    | lines
    | parse "    {short},  {long} {description}"
    | update description { str trim }
    | each {|record|
      [[value, description];
        [$record.short, $record.description],
        [$record.long, $record.description]]
    }
    | flatten

    $parsers ++ $inherent
  } catch {
    []
  }

  $env.__NU_COMPLETE_JC = $options

  $options
}

# Run `jc` (JSON Converter).
export def --wrapped jc [...arguments: string@"nu-complete jc"]: [any -> table, any -> record, any -> string] {
  let run = ^jc ...$arguments | complete

  if $run.exit_code != 0 {
    error make {
      msg: "jc exection failed"
      label: {
        text: ($run.stderr | str replace "jc:" "" | str replace "Error -" "" | str trim)
        span: (metadata $arguments).span
      }
    }
  }

  if "--help" in $arguments or "-h" in $arguments {
    $run.stdout
  } else {
    $run.stdout | from json
  }
}
