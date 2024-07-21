
def "nu core-team" [] {
  [
    [        'name',                'tz'];
    [      'andres', 'America/Guayaquil']
    [     'fdncred',        'US/Central']
    [       'gedge',        'US/Eastern']
    [          'jt',                'NZ']
    [      'wycats',        'US/Pacific']
    [     'kubouch',   'Europe/Helsinki']
    ['elferherrera',     'Europe/London']
  ]
}

def "date local" [now] {
  insert time {|value|
    let converted = ($now | date to-timezone $value.tz);

    $converted | format date '%c'
  }
}

let next_call = ("2021-08-31 15:00:21.290597200 -05:00" | into datetime);
let people = (nu core-team | date local $next_call);

def say [closure] {
  $in | each {|person|
    do $closure (
      $person | update name {|row| $row.name | str capitalize}
    )
  } | str join (char newline)
}

print ($people | say {|person| $"($person.name)'s timezone is ($person.tz)"})

print ($" 

for the next call happening on ($next_call | format date '%c').. in their timezones they would be:

")

print ($people | say {|person| $"($person.name)'s: ($person.time)"})
