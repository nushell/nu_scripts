# use shells to to show workspaces
def workspaces [] {
    shells | enumerate | each {|it|
      if $it.item.active {
        $"(ansi green)($it.index) "
      } else {
        $"(ansi blue)($it.index) "
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
