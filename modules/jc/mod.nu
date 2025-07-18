def --env "nu-complete jc" [commandline: string] {
  let stor = stor open

  if $stor.jc_completions? == null {
    stor create --table-name jc_completions --columns { value: str, description: str, is_flag: bool }
  }

  if $stor.jc_completions_ran? == null {
    stor create --table-name jc_completions_ran --columns { _: bool }
  }

  if $stor.jc_completions_ran == [] { try {
    let about = ^jc --about
    | from json

    let magic = $about
    | get parsers
    | each { { value: $in.magic_commands?, description: $in.description } }
    | where value != null
    | flatten

    let options = $about
    | get parsers
    | select argument description
    | rename value description

    let inherent = ^jc --help
    | lines
    | split list "" # Group with empty lines as boundary.
    | where { $in.0? == "Options:" } | get 0 # Get the first section that starts with "Options:"
    | skip 1 # Remove header
    | each { str trim }
    | parse "{short},  {long} {description}"
    | update description { str trim }
    | each {|record|
      [[value, description];
        [$record.short, $record.description],
        [$record.long, $record.description],
      ]
    }
    | flatten

    for entry in $magic {
      stor insert --table-name jc_completions --data-record ($entry | insert is_flag false)
    }

    for entry in ($options ++ $inherent) {
      stor insert --table-name jc_completions --data-record ($entry | insert is_flag true)
    }

    stor insert --table-name jc_completions_ran --data-record { _: true }
  } }

  if ($commandline | str contains "-") {
    $stor.jc_completions
  } else {
    $stor.jc_completions
    | where is_flag == 0
  } | select value description
}

# Run `jc` (JSON Converter).
export def --wrapped main [...arguments: string@"nu-complete jc"]: [any -> table, any -> record, any -> string] {
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
