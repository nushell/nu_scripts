# nu-niversal paperclips - a (somewhat) faithful clone of Universal Paperclips
# play the original at: https://www.decisionproblem.com/paperclips/index2.html

# TODO: figure out how to display this visually... maybe just a quick loop?
def make-paperclip [state, amount: int] {
  mut new_state = $state
  $new_state.paperclips.total += $amount
  $new_state.paperclips.stock += $amount
  $new_state.wire.length -= $amount
  return $new_state
}

def sell-paperclips [state] {
  if $state.paperclips.stock == 0 { return $state }
  # numbers picked by the OG, i haven't sussed out exactly why.
  if (random float 0.0..1.0) > ($state.market.demand / 100) { return $state }
  mut amount = 0.7 * ($state.market.demand ** 1.15) | math floor
  if $amount > $state.paperclips.stock { $amount = $state.paperclips.stock }
  mut new_state = $state
  let transaction = $amount * $state.paperclips.price
  $new_state.money += $transaction
  $new_state.paperclips.stock -= $amount
  return $new_state
}

def update-demand [state] {
  let marketing = 1.1 ** ($state.market.level - 1)
  mut new_state = $state
  # this is off by 1000x??? figure out what you're doing wrong
  $new_state.market.demand = ((.8 / $state.paperclips.price) * $marketing) * 1000
  return $new_state
}

def get-user-input [queue] {
  let key = (input listen --types [key])
  # print $"pressed ($key); keycode = ($key.code)"
  if ($key.code == 'c') and ($key.modifiers == ['keymodifiers(control)']) {
    exit
  }
  # stor insert --table-name $queue --data-record {keycode: $key.code}
  $key.code | job send 0
}

def print-line [state] {
  print -n $"Paperclips: ($state.paperclips.total | into string -g)\n\r\n\r"
  print -n "Business:\n\r"
  print -n "---------------\n\r"
  print -n $"Avaulable Funds: $($state.money / 100.0 | into string -g)\n\r"
  print -n $"Unsold Inventory: ($state.paperclips.stock | into string -g)\n\r"
  print -n $"Price Per Clip: $($state.paperclips.price / 100.0 | into string -g)\n\r"
  print -n $"Public Demand: ($state.market.demand | math round | into string -g)%\n\r\n\r"
  print -n $"Marketing Level: ($state.market.level | into string -g)\n\r"
  print -n $"Marketing cost: $($state.market.cost / 100.0 | into string -g)\n\r\n\r"
  print -n "Manufacturing:\n\r"
  print -n "---------------\n\r"
  print -n $"Clips per Second: ($state.paperclips.rate)\n\r\n\r"
  print -n $"Wire: ($state.wire.length | into string -g) inches\n\r"
  print -n $"Wire cost: $($state.wire.cost / 100.0 | into string -g)\n\r\n\r"
  if $state.autoclippers.unlocked {
    print -n $"autoclippers: ($state.autoclippers.count | into string -g)\n\r"
    print -n $"autoclipper cost: $($state.autoclippers.cost / 100.0 | into string -g)\n\r"
  }
  print -n $"($state.control_line)\n\r"
}

def main [] {
  clear
  print "Welcome to nu-niversal paperclips!"
  sleep 2sec
  clear
  let table_name = "clip_message_queue"
  # stor create --table-name $table_name --columns {keycode: str}
  mut state = {
    delta_time: 0sec
    paperclips: {
      total: 0
      stock: 0
      price: 25
      rate: "NOT IMPLEMENTED :("
    }
    market: {
      demand: 32
      level: 1
      cost: 10000
    }
    money: 0
    control_line: "controls: [a]dd paperclip; buy [w]ire; price [u]p; price [d]own; [q]uit"
    wire: {
      length: 1000
      cost: 2000
    }
    autoclippers: {
      count: 0
      unlocked: false
      cost: 1000
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
      $state.delta_time -= $seconds
      let amount = (($seconds | into int | $in / 1000000000) * $state.autoclippers.count) | math round
      mut index = 0
      while $index < $amount {
        $state = make-paperclip $state 1
        $index += 1
        clear
        print-line $state
        # TODO: figure out a better solution here
        sleep 16.666ms
      }
      $state = sell-paperclips $state
      clear
    }
    let prev = date now
    print-line $state
    if (($state.paperclips.total > 9) and ($state.autoclippers.count < 1)) and not $state.autoclippers.unlocked {
      $state.autoclippers.unlocked = true
      $state.control_line += "; [b]uy autoclipper"
    }
    # if (job list | length) == 0 {
    try {
      # let key = stor open | query db $"SELECT keycode FROM ($table_name)" | get keycode.0
      let key = job recv --timeout 0sec
      match $key {
        "a" => {
          # TODO: add some way to grow amount?
          $state = make-paperclip $state 1
        }
        "b" => {
          if $state.money >= $state.autoclippers.cost {
            $state.money -= $state.autoclippers.cost
            $state.autoclippers.count += 1
            $state.autoclippers.cost = ($state.autoclippers.cost * 1.25 | math round)
          }
        }
        "d" => {
          if $state.paperclips.price > 1 {
            $state.paperclips.price -= 1
            $state = update-demand $state
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
        "u" => {
          $state.paperclips.price += 1
          $state = update-demand $state
        }
        "w" => {
          if $state.money >= $state.wire.cost {
            $state.wire.length += 1000
            # TODO: tweak numbers
            if (random bool --bias 0.5) {
              let deviation = (0.75 + (random float 0.0..0.50))
              $state.wire.cost += $deviation | math round
              if $state.wire.cost < 12 {
                $state.wire.cost = 12
              }
            }
            $state.money -= $state.wire.cost
          }
        }
        _ => {
          ""
        }
      }
      # stor delete --table-name $table_name --where-clause $"keycode == '($key)'"
      job spawn { get-user-input $table_name }
    }
    # for 60fps framerate lock
    sleep 16.666ms
    let now = date now
    let delta = $now - $prev
    $state.delta_time += $delta
  }
}
