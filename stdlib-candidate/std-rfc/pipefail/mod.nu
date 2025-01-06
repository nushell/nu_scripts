export alias default-run-external = run-external

export def --wrapped run-external [...rest: string] {
  let results = default-run-external ($rest | first) ...($rest | skip 1) | complete
  if $results.exit_code != 0 {
    error make {
      msg: "External command failed"
      label: {
        text: "command had a non-zero exit code",
        span: (metadata $rest).span
      }
    }
  } else {
    $results.stdout
  }
}
