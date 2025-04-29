# job spawn { loop { $state.paperclips += $state.autoclippers.count; sleep 1sec } }

def get-user-input [queue] {
  # TODO: figure out how to get redrawing without waiting on the key
  # maybe use a bg job, wait until job is done, then get result?
  # and/or use the key stor, and/or use a local file?
  let key = (input listen --types [key])
  # print $"pressed ($key); keycode = ($key.code)"
  if ($key.code == 'c' or $key.code == 'q') and ($key.modifiers == ['keymodifiers(control)']) {
    break
  }
  stor insert --table-name $queue --data-record {keycode: $key.code}
}

def print-line [state] {
  print $"paperclips: ($state.paperclips)"
  if $state.autoclippers.unlocked {
    print $"autoclipper cost: ($state.autoclippers.cost)"
  }
  print $state.control_line
}

def main [] {
  let table_name = "clip_message_queue"
  stor create --table-name $table_name --columns {keycode: str}
  # TODO: figure out persistence - saving and loading
  mut state = {
    delta_time: 0sec
    paperclips: 0
    control_line: "controls: [a]dd paperclip; [q]uit"
    autoclippers: {
      count: 0
      unlocked: false
      cost: 10
      multiplier: 1.25
    }
  }
  print-line $state
  get-user-input $table_name
  loop {
    clear
    let seconds = $state.delta_time
    if ($seconds) > (1sec) {
      $state.paperclips += (($seconds | into int | $in / 1000000000) * $state.autoclippers.count) | math round
      $state.delta_time -= $seconds
    }
    let prev = date now
    print-line $state
    if (($state.paperclips > 8) and ($state.autoclippers.count < 1)) and not $state.autoclippers.unlocked {
      $state.autoclippers.unlocked = true
      $state.control_line += "; [b]uy autoclipper"
    }
    if (job list | length) == 0 {
      let key = stor open | query db $"SELECT keycode FROM ($table_name)" | get keycode.0
      match $key {
        "a" => {
          $state.paperclips += 1
        }
        "b" => {
          if $state.paperclips >= $state.autoclippers.cost {
            $state.paperclips -= $state.autoclippers.cost
            $state.autoclippers.count += 1
            $state.autoclippers.cost = ($state.autoclippers.cost * 1.25 | math round)
          }
        }
        "q" => {
          break
        }
        _ => {
          ""
        }
      }
      stor delete --table-name $table_name --where-clause $"keycode == '($key)'"
      job spawn { get-user-input $table_name }
    }
    # for 60fps framerate lock
    sleep 0.01666666667sec
    let now = date now
    let delta = $now - $prev
    $state.delta_time += $delta
  }
}
