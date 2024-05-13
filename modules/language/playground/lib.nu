def playground [topic, block] {
  with-env [N 5 REJECT slow] {
    echo $topic " tests" (char newline) | str collect

    do $block
  }
}

def scene [
  topic: any
  --tag: string
  block: block
] {
  $"  ($topic)(char newline)"
  do $block
}

def play [
  topic: any
  --tag: string
  block: block
] {
  let title = $topic;

  let is_tag_empty = ($tag | empty?);
  let should_run_all = ($nu.env | default RUN_ALL $false | get RUN_ALL);

  if $is_tag_empty {
    do $block
  } {
    if $tag == $nu.env.REJECT and $should_run_all {
      $"    ($topic) ... (ansi yellow)skipped(ansi reset) (char newline)"
    } { do $block }
  }
}

def expect [
  actual: any
  --to-be: any
] {
  let are_equal = ($actual | zip { $to-be } | pivot header_names values | each {|case|
      let values = $case.values;

      $values.0 == $values.1
    }
  | all? $it) and (($actual | get | length) == ($to-be | get | length));

  let line = (if $true == $are_equal {
    $"(ansi green)ok(ansi reset)(char newline)"
  } {
    $"(ansi red)failed(ansi reset)(char newline)"
  });
  
  $"    ($title) ... ($line)"
}