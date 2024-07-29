def "ansi_names" [] {
    [
        ...(ansi --list | get name)
        ...(ansi --list | get 'short name' | range 133..338)
    ]
}

def "color_config" [] {
    if ($env.config?.color_config? == null) {
        error make -u {
            msg: "$env.config.color_config is not defined"
        }
    }

    $env.config?.color_config?
    | transpose key value
}

# Preview the current nushell theme
export def "preview theme" [] {
    let all_ansi_names = (ansi_names)
    let color_config = (color_config)

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

def get_type_keys [] {
    where {|i| $i.key in [
        binary
        block
        bool
        cell-path
        closure
        custom
        date
        duration
        filesize
        float
        glob
        int
        list
        nothing
        range
        record
        string
    ]}
}

def get_structure_keys [] {
    where {|i| $i.key in [
        foreground
        cursor
        empty
        header
        hints
        leading_trailing_space_bg
        row_index
        search_result
        separator
    ]}
}

def get_shape_keys [] {
    where {|i| $i.key | str starts-with "shape_" }
}

def get_conditional_keys [] {
    where {|i| ($i.value | describe) == "closure" }
}

# Preview the current nushell theme, small mode
export def "preview theme small" [] {
    let color_config = (color_config)

    let conditionals = ($color_config | get_conditional_keys)
    let shapes = ($color_config | get_shape_keys)
    let types = ($color_config | get_type_keys)
    let structure = ($color_config | get_structure_keys)

    let conditionals_content = (
        $conditionals
        | each {|row| format closure --short $row})
        | str join "\n"

    let types_content = (
        $types
        | where $it.key not-in $conditionals.key
        | each {|row| format basic --short $row }
        | str join "\n"
    )

    let structure_content = (
        $structure
        | where $it.key not-in $conditionals.key
        | each {|row|
            match $row.key {
                "foreground" => (format foreground_background --short $color_config)
                _ => (format basic --short $row)
            }
          }
        | str join "\n"
    )

    let shapes_content = (
        $shapes
        | where $it.key not-in $conditionals.key
        | each {|row| format basic --short $row }
        | str join "\n"
    )

    let structure_and_types_content = (
        [
            $types_content
            $structure_content
        ]
        | str join "\n\n\n\n\n"
    )

    [
        {
            "Shapes": $shapes_content
            "Other Types and Structure": $structure_and_types_content
            "Conditionally Defined": $conditionals_content
        }
    ]
    | table -i false
      # Remove header
    | str replace -r '^([^\n]+)(\n[^\n]+){2}' '$1'
}

# Preview what your terminal theme looks like
export def 'preview terminal' [] {
    def preview [attr: string] {
        let color = $in
        $"(ansi -e {fg: $color attr: $attr})($color)(ansi reset)"
    }

    let colors = [
        [normal   rgb];

        [black   '#000000']
        [red     '#FF0000']
        [green   '#00FF00']
        [yellow  '#FFFF00']
        [blue    '#0000FF']
        [magenta '#FF00FF']
        [purple  '#FF00FF']
        [cyan    '#00FFFF']
        [white   '#FFFFFF']
    ]

    $colors | each {|color| {
        dimmed: ($color.normal | preview d)
        normal: ($color.normal | preview n)
        bold: ($color.normal | preview b)

        rgb_dimmed: ($color.rgb | preview d)
        rgb_normal: ($color.rgb | preview n)
        rgb_bold: ($color.rgb | preview b)
    }}
}

# Updates the terminal colors based on the current color_config
export def "update terminal" [] {
    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'

    let foreground = ($env.config?.color_config?.foreground? | default "#0000FF")
    print $foreground
    let background = ($env.config?.color_config?.background? | default "#000000")
    print $background
    let cursor = ($env.config?.color_config?.cursor? | default "#FFFFFF")
    print $cursor
        
    $"
    (ansi -o $osc_screen_foreground_color)($foreground)(char bel)
    (ansi -o $osc_screen_background_color)($background)(char bel)
    (ansi -o $osc_cursor_color)($cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line
    | str replace --all "\n" ''
    | print $in

}

def no-newline [] string->string {
    $in | str replace -r '\n$' ''
}

def "format foreground_background" [
    color_table
    --short (-s)
] {
    let color_record = ($color_table | transpose -dr)
    let fg_bg = {
        fg: $color_record.foreground?
        bg: $color_record.background?
    }
    match $short {
        false => {
            key: "Foreground/Background"
            value: $"($color_record.foreground?) on ($color_record.background?)"
        }

        true => $"(ansi $fg_bg)foreground/background - ($color_record.foreground?) on ($color_record.background?)(ansi reset)"
    }
}

def "format basic" [
    color_item: record
    --short (-s)
] {
    match $short {
        false => {
            key: $color_item.key
            value: $"(ansi $color_item.value)($color_item.value)(ansi reset)"
        }

        true => $"(ansi $color_item.value)($color_item.key) - ($color_item.value)(ansi reset)"
    }
}

def "format closure" [
    color_item: record
    --short (-s)
] {
    let demo_value = (
        match $color_item.key {
            "bool" => [
                {"bools": true}
                {"bools": false}
            ]

            "date" => [
                {"dates": ((date now) - 30min)}
                {"dates": ((date now) - 3hr)}
                {"dates": ((date now) - 23hr)}
                {"dates": ((date now) - 2day)}
                {"dates": ((date now) - 5day)}
                {"dates": ((date now) - 4wk)}
                {"dates": ((date now) - 10wk)}
                {"dates": ((date now) - 100wk)}
            ]

            "filesize" => [
                {"filesizes": 0b}
                {"filesizes": 500kb}
                {"filesizes": 1mb}
            ]

            "string" => [
                {"strings": "#FF0000"}
                {"strings": "#00FF00"}
                {"strings": "#0000FF"}
                {"strings": "other text"}
            ]

            _ => {
                $"($color_item.key) - \(Depends on closure)"
            }
        }
    )

    match $short {
        true => ($demo_value | table | no-newline)
        false => {
            key: $color_item.key
            value: ($demo_value | table | no-newline)
        }
    }
}

# Not used
def "format record" [
    color_rec: record
    --short (-s)
] {
    match $short {
        true => {
            $color_rec
            | to nuon
            | str replace -a '"' ''
            | $"(ansi ($color_rec))($in)(ansi reset)"
        }
    }
}
