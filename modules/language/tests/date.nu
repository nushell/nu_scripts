use ../playground *
use ../std/date.nu *

def mock-now [] {
  "2021-08-29 03:31:21" | into datetime
}

def people [] {
  [
    [        'name',                'tz'];
    [      'andres', 'America/Guayaquil']
    [     'fdncred',        'US/Central']
  ]
}

playground "std/date" {
  
  scene 'command: "date local"' {

    play "adds times in local timezone" {|topic|

      let expected_times = [
        "Sun Aug 29 03:31:21 2021"
        "Sun Aug 29 03:31:21 2021"
      ] | into datetime;
      let actual = (people | date local (mock-now) | get time | into datetime)

      expect $topic $actual --to-be $expected_times

    }

  }

}
