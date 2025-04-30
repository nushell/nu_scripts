# nu-niversal paperclips - a (somewhat) faithful clone of Universal Paperclips
# play the original at: https://www.decisionproblem.com/paperclips/index2.html

def buy-paperclip [state, amount: int] {
  mut new_state = $state
  $new_state.paperclips += $amount
  $new_state.wire.length -= $amount
  return $new_state
}

def get-user-input [queue] {
  let key = (input listen --types [key])
  # print $"pressed ($key); keycode = ($key.code)"
  if ($key.code == 'c' or $key.code == 'q') and ($key.modifiers == ['keymodifiers(control)']) {
    break
  }
  stor insert --table-name $queue --data-record {keycode: $key.code}
}

def print-line [state] {
  print -n $"paperclips: ($state.paperclips)\n\r"
  print -n $"wire: ($state.wire.length) inches\n\r"
  print -n $"wire cost: ($state.wire.cost)\n\r"
  if $state.autoclippers.unlocked {
    print -n $"autoclippers: ($state.autoclippers.count)\n\r"
    print -n $"autoclipper cost: ($state.autoclippers.cost)\n\r"
  }
  print -n $"($state.control_line)\n\r"
}

def main [] {
  clear
  print "Welcome to nu-niversal paperclips!"
  sleep 2sec
  clear
  let table_name = "clip_message_queue"
  stor create --table-name $table_name --columns {keycode: str}
  mut state = {
    delta_time: 0sec
    paperclips: 0
    # TODO: set to 0 when you have basic economy set up
    money: 100
    control_line: "controls: [a]dd paperclip; buy [w]ire; [q]uit"
    wire: {
      length: 1000
      cost: 20
    }
    autoclippers: {
      count: 0
      unlocked: false
      cost: 10
      multiplier: 1.25
    }
  }
  let save_exists = ('./gamestate.nuon' | path exists)
  if $save_exists {
    $state = open './gamestate.nuon'
  }
  print-line $state
  get-user-input $table_name
  loop {
    clear
    let seconds = $state.delta_time
    if ($seconds) > (1sec) {
      let amount = (($seconds | into int | $in / 1000000000) * $state.autoclippers.count) | math round
      $state = buy-paperclip $state $amount
      $state.delta_time -= $seconds
    }
    let prev = date now
    print-line $state
    if (($state.paperclips > 9) and ($state.autoclippers.count < 1)) and not $state.autoclippers.unlocked {
      $state.autoclippers.unlocked = true
      $state.control_line += "; [b]uy autoclipper"
    }
    if (job list | length) == 0 {
      let key = stor open | query db $"SELECT keycode FROM ($table_name)" | get keycode.0
      match $key {
        "a" => {
          # TODO: add some way to grow amount?
          $state = buy-paperclip $state 1
        }
        "b" => {
          if $state.paperclips >= $state.autoclippers.cost {
            $state.paperclips -= $state.autoclippers.cost
            $state.autoclippers.count += 1
            $state.autoclippers.cost = ($state.autoclippers.cost * 1.25 | math round)
          }
        }
        "q" => {
          # if not $save_exists {
          #   $state | save gamestate.nuon
          # } else {
          #   $state | save gamestate.nuon --force
          # }
          break
        }
        "w" => {
          $state.wire.length += 1000
          # TODO: tweak numbers
          if (random bool --bias 0.5) {
            let deviation = (0.75 + (random float 0.0..0.50))
            $state.wire.cost += $deviation | math round
            if $state.wire.cost < 12 {
              $state.wire.cost = 12
            }
          }
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
