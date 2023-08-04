# use shells to to show workspaces
def workspaces [] {
    shells | each {|item index|
      if $item.active {
        $"(ansi green)($index) "
      } else {
        $"(ansi blue)($index) "
      }
    }| str join
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | format date '%r'),
        " ",
        (workspaces)
    ] | str join)
    $time_segment
}

$env.PROMPT_COMMAND_RIGHT = { create_right_prompt }
