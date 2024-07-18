export module "monokai-theme" {
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
            separator: "#f8f8f2"
            leading_trailing_space_bg: { attr: "n" }
            header: { fg: "#a6e22e" attr: "b" }
            empty: "#66d9ef"
            bool: {|| if $in { "#a1efe4" } else { "light_gray" } }
            int: "#f8f8f2"
            filesize: {|e|
                if $e == 0b {
                    "#f8f8f2"
                } else if $e < 1mb {
                    "#a1efe4"
                } else {{ fg: "#66d9ef" }}
            }
            duration: "#f8f8f2"
            date: {|| (date now) - $in |
                if $in < 1hr {
                    { fg: "#f92672" attr: "b" }
                } else if $in < 6hr {
                    "#f92672"
                } else if $in < 1day {
                    "#f4bf75"
                } else if $in < 3day {
                    "#a6e22e"
                } else if $in < 1wk {
                    { fg: "#a6e22e" attr: "b" }
                } else if $in < 6wk {
                    "#a1efe4"
                } else if $in < 52wk {
                    "#66d9ef"
                } else { "dark_gray" }
            }
            range: "#f8f8f2"
            float: "#f8f8f2"
            string: "#f8f8f2"
            nothing: "#f8f8f2"
            binary: "#f8f8f2"
            cellpath: "#f8f8f2"
            row_index: { fg: "#a6e22e" attr: "b" }
            record: "#f8f8f2"
            list: "#f8f8f2"
            block: "#f8f8f2"
            hints: "dark_gray"
            search_result: { fg: "#f92672" bg: "#f8f8f2" }
        
            shape_and: { fg: "#ae81ff" attr: "b" }
            shape_binary: { fg: "#ae81ff" attr: "b" }
            shape_block: { fg: "#66d9ef" attr: "b" }
            shape_bool: "#a1efe4"
            shape_custom: "#a6e22e"
            shape_datetime: { fg: "#a1efe4" attr: "b" }
            shape_directory: "#a1efe4"
            shape_external: "#a1efe4"
            shape_externalarg: { fg: "#a6e22e" attr: "b" }
            shape_filepath: "#a1efe4"
            shape_flag: { fg: "#66d9ef" attr: "b" }
            shape_float: { fg: "#ae81ff" attr: "b" }
            shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
            shape_globpattern: { fg: "#a1efe4" attr: "b" }
            shape_int: { fg: "#ae81ff" attr: "b" }
            shape_internalcall: { fg: "#a1efe4" attr: "b" }
            shape_list: { fg: "#a1efe4" attr: "b" }
            shape_literal: "#66d9ef"
            shape_match_pattern: "#a6e22e"
            shape_matching_brackets: { attr: "u" }
            shape_nothing: "#a1efe4"
            shape_operator: "#f4bf75"
            shape_or: { fg: "#ae81ff" attr: "b" }
            shape_pipe: { fg: "#ae81ff" attr: "b" }
            shape_range: { fg: "#f4bf75" attr: "b" }
            shape_record: { fg: "#a1efe4" attr: "b" }
            shape_redirection: { fg: "#ae81ff" attr: "b" }
            shape_signature: { fg: "#a6e22e" attr: "b" }
            shape_string: "#a6e22e"
            shape_string_interpolation: { fg: "#a1efe4" attr: "b" }
            shape_table: { fg: "#66d9ef" attr: "b" }
            shape_variable: "#ae81ff"
        
            background: "#272822"
            foreground: "#f8f8f2"
            cursor: "#f8f8f2"
        }
    }
    export def --env "set color_config" [] {
        $env.config.color_config = (get color_config)
    }
}