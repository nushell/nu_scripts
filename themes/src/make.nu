#!/usr/bin/env nu
use .../stdlib-candidate/std-rfc str

let current_dir = ($env.CURRENT_FILE | path dirname)

let LEMNOS_SOURCE = {
    dir: ($current_dir | path join "lemnos" "themes")
    local_repo: ($current_dir | path join "lemnos")
    remote_repo: "https://github.com/lemnos/theme.sh"
}

let CUSTOM_SOURCE = {
    dir: ($current_dir | path join "custom-nu-themes")
}

let themes_dir = ($current_dir | path join "../nu-themes")

def info [msg: string, --no-newline (-n)] {
    print --no-newline=$no_newline $"(ansi green)[INFO](ansi reset) ($msg)"
}

def err [msg: string, --no-newline (-n)] {
    print --no-newline=$no_newline $"(ansi red_bold)[ERR](ansi reset) ($msg)"
}

def warn [msg: string, --no-newline (-n)] {
    print --no-newline=$no_newline $"(ansi yellow)[WARNING](ansi reset) ($msg)"
}

# For lemnos themes, create the color_config from the lemnos theme
# definition.
# Custom Nushell themes should be defined in themes/src/custom-nu-themes
# and should return a color_config record in the main function.
def make_color_config [ name: string, source: string = "lemnos" ] {
    match $source {
        "lemnos" => {
            let colors = (
                open ($LEMNOS_SOURCE.dir | path join $name)
                | lines --skip-empty
                | find --invert --regex '^#'
                | split column " "
                | rename name rgb
                | transpose -r
                | into record
            )

            return $"
            # Retrieve the theme settings
            export def main [] {
                return {
                    separator: '($colors.color7)'
                    leading_trailing_space_bg: { attr: 'n' }
                    header: { fg: '($colors.color2)' attr: 'b' }
                    empty: '($colors.color4)'
                    bool: {|| if $in { '($colors.color14)' } else { 'light_gray' } }
                    int: '($colors.color7)'
                    filesize: {|e|
                        if $e == 0b {
                            '($colors.color7)'
                        } else if $e < 1mb {
                            '($colors.color6)'
                        } else {{ fg: '($colors.color4)' }}
                    }
                    duration: '($colors.color7)'
                    date: {|| (char lparen)date now(char rparen) - $in |
                        if $in < 1hr {
                            { fg: '($colors.color1)' attr: 'b' }
                        } else if $in < 6hr {
                            '($colors.color1)'
                        } else if $in < 1day {
                            '($colors.color3)'
                        } else if $in < 3day {
                            '($colors.color2)'
                        } else if $in < 1wk {
                            { fg: '($colors.color2)' attr: 'b' }
                        } else if $in < 6wk {
                            '($colors.color6)'
                        } else if $in < 52wk {
                            '($colors.color4)'
                        } else { 'dark_gray' }
                    }
                    range: '($colors.color7)'
                    float: '($colors.color7)'
                    string: '($colors.color7)'
                    nothing: '($colors.color7)'
                    binary: '($colors.color7)'
                    cell-path: '($colors.color7)'
                    row_index: { fg: '($colors.color2)' attr: 'b' }
                    record: '($colors.color7)'
                    list: '($colors.color7)'
                    block: '($colors.color7)'
                    hints: 'dark_gray'
                    search_result: { fg: '($colors.color1)' bg: '($colors.color7)' }

                    shape_and: { fg: '($colors.color5)' attr: 'b' }
                    shape_binary: { fg: '($colors.color5)' attr: 'b' }
                    shape_block: { fg: '($colors.color4)' attr: 'b' }
                    shape_bool: '($colors.color14)'
                    shape_custom: '($colors.color2)'
                    shape_datetime: { fg: '($colors.color6)' attr: 'b' }
                    shape_directory: '($colors.color6)'
                    shape_external: '($colors.color6)'
                    shape_externalarg: { fg: '($colors.color2)' attr: 'b' }
                    shape_filepath: '($colors.color6)'
                    shape_flag: { fg: '($colors.color4)' attr: 'b' }
                    shape_float: { fg: '($colors.color5)' attr: 'b' }
                    shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
                    shape_globpattern: { fg: '($colors.color6)' attr: 'b' }
                    shape_int: { fg: '($colors.color5)' attr: 'b' }
                    shape_internalcall: { fg: '($colors.color6)' attr: 'b' }
                    shape_list: { fg: '($colors.color6)' attr: 'b' }
                    shape_literal: '($colors.color4)'
                    shape_match_pattern: '($colors.color2)'
                    shape_matching_brackets: { attr: 'u' }
                    shape_nothing: '($colors.color14)'
                    shape_operator: '($colors.color3)'
                    shape_or: { fg: '($colors.color5)' attr: 'b' }
                    shape_pipe: { fg: '($colors.color5)' attr: 'b' }
                    shape_range: { fg: '($colors.color3)' attr: 'b' }
                    shape_record: { fg: '($colors.color6)' attr: 'b' }
                    shape_redirection: { fg: '($colors.color5)' attr: 'b' }
                    shape_signature: { fg: '($colors.color2)' attr: 'b' }
                    shape_string: '($colors.color2)'
                    shape_string_interpolation: { fg: '($colors.color6)' attr: 'b' }
                    shape_table: { fg: '($colors.color4)' attr: 'b' }
                    shape_variable: '($colors.color5)'

                    background: '($colors.background)'
                    foreground: '($colors.foreground)'
                    cursor: '($colors.cursor)'
                }
            }
            "
        }
        "custom" => {
            let original_file = (
                {
                    parent: $CUSTOM_SOURCE.dir
                    stem: $name
                    extension: 'nu'
                }
                | path join
            )
            # Add starting and ending linebreaks for str-dedent
            return $"\n# Retrieve the theme settings\n(open $original_file)\n"
        }
    }
}

def make_theme [ name: string, origin: string = "lemnos" ] {

    # Generate the theme depending on what type/origin it is
    let main_command = ((make_color_config $name $origin) | str dedent)

    let update_terminal_command = $"
    # Update terminal colors
    export def \"update terminal\" [] {
        let theme = \(main)

        # Set terminal colors
        let osc_screen_foreground_color = '10;'
        let osc_screen_background_color = '11;'
        let osc_cursor_color = '12;'
        
        $\"
        \(ansi -o $osc_screen_foreground_color)\($theme.foreground)\(char bel)
        \(ansi -o $osc_screen_background_color)\($theme.background)\(char bel)
        \(ansi -o $osc_cursor_color)\($theme.cursor)\(char bel)
        \"
        # Line breaks above are just for source readability
        # but create extra whitespace when activating. Collapse
        # to one line
        | str replace --all \"\\n\" ''
        | print $in
    }
    "
    | str dedent

    let set_color_config_command = $"
    # Update the Nushell configuration
    export def --env \"set color_config\" [] {
        $env.config.color_config = \(main)
    }
    "
    | str dedent

    let activate_command = $"
    export module activate {
        export-env {
            set color_config
            update terminal
        }
    }

    # Activate the theme when sourced
    use activate
    "
    | str dedent
    
    # Combine into the final theme file
    [
        $main_command
        $set_color_config_command
        $update_terminal_command
        $activate_command
    ]
    | str join "\n\n"
    #| str dedent
    | save --force ({
        parent: $themes_dir
        stem: $"($name)"
        extension: "nu"
    } | path join)

}

def main [] {
    mkdir $themes_dir

    if ($LEMNOS_SOURCE.local_repo | path exists) {
        warn "local copy of Lemnos' themes already exists"
        info "updating local copy"
        try {
            git -C $LEMNOS_SOURCE.local_repo pull origin master
        } catch {
            err "failed updating local copy"
        }
    } else {
        info "cloning Lemnos' themes"
        try {
            git clone $LEMNOS_SOURCE.remote_repo $LEMNOS_SOURCE.local_repo
        } catch {
            error make --unspanned { msg: "failed cloning local copy" }
        }
    }

    let themes: table<name: string, source: string> = (
        ls $LEMNOS_SOURCE.dir
            | insert source "lemnos"
            | append (ls $CUSTOM_SOURCE.dir | insert source "custom")
            | update name { path parse | get stem }
            | select name source
    )

    let failed = $themes | each { |t|
        info -n $"Converting ($t.name)                                       \r"
        try {
            make_theme $t.name $t.source
        } catch { |e|
            err $"Converting ($t.name) failed: ($e.msg)"
            $t
        }
    }
    info -n $"Completed converting (($themes | length) - ($failed | length)) themes         \r"

    print ''
    if not ($failed | is-empty) {
        warn $"The following ($failed | length) themes have failed:"
        print $failed
    } else {
        print "all done"
    }
}
