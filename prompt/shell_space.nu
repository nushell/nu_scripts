# use shells to to show workspaces
def workspaces [] {
    shells | each {|item index|
      if $item.active {
        $"(ansi green)($index) "
      } else {
        $"(ansi blue)($index) " 
      }
    }| str collect
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%r'),
        " ",
        (workspaces)
    ] | str collect)
    $time_segment
}

let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }
