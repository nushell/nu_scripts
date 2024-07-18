export module "gruvbox-light-hard-theme" {
    export def "update terminal" [] {
        let theme = (get color_config)
        
        # Set terminal colors
        let osc_screen_foreground_color = '10;'
        let osc_screen_background_color = '11;'
        let osc_cursor_color = '12;'
                    
        $"
            (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
            (ansi -o $osc_screen_background_color)($theme.background)(char bel)
            (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
        "
        | str replace --all "\n" ''
        | print $in
    }
    export def "get color_config" [] {
        return {
            separator: "#504945"
            leading_trailing_space_bg: { attr: "n" }
            header: { fg: "#79740e" attr: "b" }
            empty: "#076678"
            bool: {|| if $in { "#427b58" } else { "light_gray" } }
            int: "#504945"
            filesize: {|e|
                if $e == 0b {
                    "#504945"
                } else if $e < 1mb {
                    "#427b58"
                } else {{ fg: "#076678" }}
            }
            duration: "#504945"
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: "#9d0006" attr: "b" }
                } else if $in < 6hr {
                    "#9d0006"
                } else if $in < 1day {
                    "#b57614"
                } else if $in < 3day {
                    "#79740e"
                } else if $in < 1wk {
                    { fg: "#79740e" attr: "b" }
                } else if $in < 6wk {
                    "#427b58"
                } else if $in < 52wk {
                    "#076678"
                } else { "dark_gray" }
            }
            range: "#504945"
            float: "#504945"
            string: "#504945"
            nothing: "#504945"
            binary: "#504945"
            cellpath: "#504945"
            row_index: { fg: "#79740e" attr: "b" }
            record: "#504945"
            list: "#504945"
            block: "#504945"
            hints: "dark_gray"
            search_result: { fg: "#9d0006" bg: "#504945" }
        
            shape_and: { fg: "#8f3f71" attr: "b" }
            shape_binary: { fg: "#8f3f71" attr: "b" }
            shape_block: { fg: "#076678" attr: "b" }
            shape_bool: "#427b58"
            shape_custom: "#79740e"
            shape_datetime: { fg: "#427b58" attr: "b" }
            shape_directory: "#427b58"
            shape_external: "#427b58"
            shape_externalarg: { fg: "#79740e" attr: "b" }
            shape_filepath: "#427b58"
            shape_flag: { fg: "#076678" attr: "b" }
            shape_float: { fg: "#8f3f71" attr: "b" }
            shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
            shape_globpattern: { fg: "#427b58" attr: "b" }
            shape_int: { fg: "#8f3f71" attr: "b" }
            shape_internalcall: { fg: "#427b58" attr: "b" }
            shape_list: { fg: "#427b58" attr: "b" }
            shape_literal: "#076678"
            shape_match_pattern: "#79740e"
            shape_matching_brackets: { attr: "u" }
            shape_nothing: "#427b58"
            shape_operator: "#b57614"
            shape_or: { fg: "#8f3f71" attr: "b" }
            shape_pipe: { fg: "#8f3f71" attr: "b" }
            shape_range: { fg: "#b57614" attr: "b" }
            shape_record: { fg: "#427b58" attr: "b" }
            shape_redirection: { fg: "#8f3f71" attr: "b" }
            shape_signature: { fg: "#79740e" attr: "b" }
            shape_string: "#79740e"
            shape_string_interpolation: { fg: "#427b58" attr: "b" }
            shape_table: { fg: "#076678" attr: "b" }
            shape_variable: "#8f3f71"
        
            background: "#f9f5d7"
            foreground: "#504945"
            cursor: "#504945"
        }
    }
    export def --env "set color_config" [] {
        $env.config.color_config = (get color_config)
    }
}