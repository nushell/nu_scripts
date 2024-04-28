source lib/scripts.nu
source assets/core_team.nu

let next_call = ("2021-08-31 15:00:21.290597200 -05:00" | str to-datetime);
let people = (nu core-team | date local $next_call);

def say [block] {
  each {|person|
    do $block (
      $person | merge {
        [[name]; [($person.name | str capitalize)]]
      }
    )
  } | str collect (char newline)
}

$people | say {|person| $"($person.name)'s timezone is ($person.tz)"}

$" 

for the next call happening on ($next_call | date format '%c').. in their timezones they would be:

"

$people | say {|person| $"($person.name)'s: ($person.time)"}
