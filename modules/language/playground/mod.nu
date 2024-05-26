export def main [topic, closure] {
  with-env {N: 5 REJECT: slow } {
    print (echo $topic " tests" (char newline) | str join)

    do $closure
  }
}

export def scene [
  topic: any
  --tag: string
  closure: closure
] {
  print $"  ($topic)(char newline)"
  do $closure
}

export def play [
  topic: any
  --tag: string
  closure: closure
] {
  let is_tag_empty = ($tag | is-empty);
  let should_run_all = ($env | get -i RUN_ALL | default false);

  if $is_tag_empty {
      do $closure $topic
  } else {
      if $tag == $env.REJECT and $should_run_all {
          $"    ($topic) ... (ansi yellow)skipped(ansi reset) (char newline)"
      } else {
          do $closure $topic
      }
  }
}

export def expect [
  topic: string
  actual: list<any>
  --to-be: list<any>
] {
  let are_equal = (($actual |  length) == ($to_be | length)) and ($actual | zip $to_be | all {|case|
      $case.0 == $case.1
    }
 )

  let line = (if true == $are_equal {
          $"(ansi green)ok(ansi reset)(char newline)"
      } else {
          $"(ansi red)failed(ansi reset)(char newline)"
      }
  )
  $"    ($topic) ... ($line)"
}
