# Preview the current nushell theme
def preview_theme [] {
    let ansi_names = (ansi --list | get name)
    let all_ansi_names = $ansi_names ++ (ansi --list | get 'short name' | range 133..388)
    let color_config = ($env.config.color_config | transpose key value)
    let color_table = ($color_config | each {|row|
      if ($row.value | describe | str contains 'closure') {
        # get the closure as a string
        let source_code = (view source ($env.config.color_config | get $row.key) | str replace -a "'" '')
        # replace named colors with ansi codes, this will not work for hex colors
        let source_code_replaced = ($all_ansi_names | reduce -f $source_code {|it, acc| $acc | str replace $"\\b($it)\\b" $"(ansi $it)($it)(ansi reset)"})
        if $row.key == 'date' {
          let date_show = ([[dates];[((date now) - 30min)] [((date now) - 3hr)] [((date now) - 23hr)] [((date now) - 2day)] [((date now) - 5day)] [((date now) - 4wk)] [((date now) - 10wk)] [((date now) - 100wk)]])
          [[key value]; [$row.key $date_show]]
        } else if $row.key == 'bool' {
          let bool_show = ([[bools]; [true] [false]])
          [[key value]; [$row.key $bool_show]]
        } else if $row.key == 'filesize' {
          let filesize_show = ([[filesizes]; [0b] [500kb] [1mb]])
          [[key value]; [$row.key $filesize_show]]
        } else if $row.key == 'string' {
          let string_show = ([[strings]; ['#FF0000'] ['#00FF00'] ['#0000FF'] ['some text']])
          [[key value]; [$row.key $string_show]]
        } else {
          [[key value]; [$row.key $source_code_replaced]]
        }
      } else if ($row.value | describe | str contains 'record') {
        [[key value]; [$row.key $"(ansi ($row.value))($row.value)(ansi reset)"]]
      } else if ($row.value | str starts-with '#') {
        [[key value]; [$row.key $"(ansi ($row.value))($row.value)(ansi reset)"]]
      } else {
        [[key value]; [$row.key $"(ansi ($row.value))($row.value)(ansi reset)"]]
      }
    } | flatten)

    # This draws the table with two tables merged
    # let row_count = ($color_table | length)
    # let row_count_half = (($color_table | length) / 2 | math floor)
    # let table1 = ($color_table | range 0..$row_count_half | rename datatypes dtvals)
    # let table2 = ($color_table | range $row_count_half..$row_count | rename shapes shpvals)
    # echo $table1 | merge $table2

    # This draws the table with three tables merged
    let row_count = ($color_table | length)
    let row_count_third = (($color_table | length) / 3 | math floor)
    let table1 = ($color_table | range 0..$row_count_third | rename key1 val1)
    let table2 = ($color_table | range $row_count_third..($row_count_third * 2) | rename key2 val2)
    let table3 = ($color_table | range ($row_count_third * 2)..$row_count | rename key3 val3)
    echo $table1 | merge $table2 | merge $table3
}

def "nu-complete list themes" [] {
    ls themes/themes/ | get name | path parse | get stem
}

# preview completion. For this to work, it should be ran from the nu_scripts folder
def preview [theme: string@"nu-complete list themes"] {
    commandline edit --insert $"use themes/themes/($theme).nu; $env.config.color_config = (char lparen)($theme)(char rparen); preview_theme | table -e"
}

# preview completion. For this to work, it should be ran from the nu_scripts folder
def preview_small [theme: string@"nu-complete list themes"] {
    commandline edit --insert $"use themes/themes/($theme).nu; $env.config.color_config = (char lparen)($theme)(char rparen); preview_theme_small | table -e"
}

# Preview the current nushell theme, small mode
def preview_theme_small [] {
    let ansi_names = (ansi --list | get name)
    let all_ansi_names = $ansi_names ++ (ansi --list | get 'short name' | range 133..388)
    let color_config = ($env.config.color_config | transpose key value)
    let color_table = ($color_config | each {|row|
      if ($row.value | describe | str contains 'closure') {
        # get the closure as a string
        let source_code = (view source ($env.config.color_config | get $row.key) | str replace -a "'" '')
        # replace named colors with ansi codes, this will not work for hex colors
        let source_code_replaced = ($all_ansi_names | reduce -f $source_code {|it, acc| $acc | str replace $"\\b($it)\\b" $"(ansi $it)($it)(ansi reset)"})
        if $row.key == 'date' {
          let date_show = ([[date];[((date now) - 30min)] [((date now) - 3hr)] [((date now) - 23hr)] [((date now) - 2day)] [((date now) - 5day)] [((date now) - 4wk)] [((date now) - 10wk)] [((date now) - 100wk)]])
          [[key]; [$date_show]]
        } else if $row.key == 'bool' {
          let bool_show = ([[bool]; [true] [false]])
          [[key]; [$bool_show]]
        } else if $row.key == 'filesize' {
          let filesize_show = ([[filesizes]; [0b] [500kb] [1mb]])
          [[key]; [$filesize_show]]
        } else {
          [[key]; [$source_code_replaced]]
        }
      } else if ($row.value | describe | str contains 'record') {
        [[key]; [$"(ansi ($row.value))($row.key) - ($row.value)(ansi reset)"]]
      } else if ($row.value | str starts-with '#') {
        [[key]; [$"(ansi ($row.value))($row.key) - ($row.value)(ansi reset)"]]
      } else {
        [[key]; [$"(ansi ($row.value))($row.key) - ($row.value)(ansi reset)"]]
      }
    } | flatten)

    # This draws the table with two tables merged
    # let row_count = ($color_table | length)
    # let row_count_half = (($color_table | length) / 2 | math floor)
    # let table1 = ($color_table | range 0..$row_count_half | rename datatypes dtvals)
    # let table2 = ($color_table | range $row_count_half..$row_count | rename shapes shpvals)
    # echo $table1 | merge $table2

    # This draws the table with three tables merged
    let row_count = ($color_table | length)
    let row_count_third = (($color_table | length) / 3 | math floor)
    let table1 = ($color_table | range 0..$row_count_third | rename key1 val1)
    let table2 = ($color_table | range $row_count_third..($row_count_third * 2) | rename key2 val2)
    let table3 = ($color_table | range ($row_count_third * 2)..$row_count | rename key3 val3)
    echo $table1 | merge $table2 | merge $table3
}
