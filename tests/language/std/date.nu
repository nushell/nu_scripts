source lib/scripts.nu

def mock-now [] {
  "2021-08-29 03:31:21.290597200 -05:00" | str to-datetime
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

    play "adds times in local timezone" {

      let expected_times = [
        [time];
        ["Sun Aug 29 03:31:21 2021"]
        ["Sun Aug 29 03:31:21 2021"]
      ];

      let actual = (people |
        date local (mock-now) |
        select time
      );
 
      expect $actual --to-be $expected_times
      
    }

  }

}
