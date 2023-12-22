export def main [] { return {
    separator: "#828bb8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#c3e88d" attr: "b" }
    empty: "#82aaff"
    bool: {|| if $in { "#86e1fc" } else { "light_gray" } }
    int: "#828bb8"
    filesize: {|e|
        if $e == 0b {
            "#828bb8"
        } else if $e < 1mb {
            "#86e1fc"
        } else {{ fg: "#82aaff" }}
    }
    duration: "#828bb8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff757f" attr: "b" }
        } else if $in < 6hr {
            "#ff757f"
        } else if $in < 1day {
            "#ffc777"
        } else if $in < 3day {
            "#c3e88d"
        } else if $in < 1wk {
            { fg: "#c3e88d" attr: "b" }
        } else if $in < 6wk {
            "#86e1fc"
        } else if $in < 52wk {
            "#82aaff"
        } else { "dark_gray" }
    }
    range: "#828bb8"
    float: "#828bb8"
    string: "#828bb8"
    nothing: "#828bb8"
    binary: "#828bb8"
    cellpath: "#828bb8"
    row_index: { fg: "#c3e88d" attr: "b" }
    record: "#828bb8"
    list: "#828bb8"
    block: "#828bb8"
    hints: "dark_gray"
    search_result: { fg: "#ff757f" bg: "#828bb8" }

    shape_and: { fg: "#c099ff" attr: "b" }
    shape_binary: { fg: "#c099ff" attr: "b" }
    shape_block: { fg: "#82aaff" attr: "b" }
    shape_bool: "#86e1fc"
    shape_custom: "#c3e88d"
    shape_datetime: { fg: "#86e1fc" attr: "b" }
    shape_directory: "#86e1fc"
    shape_external: "#86e1fc"
    shape_externalarg: { fg: "#c3e88d" attr: "b" }
    shape_filepath: "#86e1fc"
    shape_flag: { fg: "#82aaff" attr: "b" }
    shape_float: { fg: "#c099ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#86e1fc" attr: "b" }
    shape_int: { fg: "#c099ff" attr: "b" }
    shape_internalcall: { fg: "#86e1fc" attr: "b" }
    shape_list: { fg: "#86e1fc" attr: "b" }
    shape_literal: "#82aaff"
    shape_match_pattern: "#c3e88d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#86e1fc"
    shape_operator: "#ffc777"
    shape_or: { fg: "#c099ff" attr: "b" }
    shape_pipe: { fg: "#c099ff" attr: "b" }
    shape_range: { fg: "#ffc777" attr: "b" }
    shape_record: { fg: "#86e1fc" attr: "b" }
    shape_redirection: { fg: "#c099ff" attr: "b" }
    shape_signature: { fg: "#c3e88d" attr: "b" }
    shape_string: "#c3e88d"
    shape_string_interpolation: { fg: "#86e1fc" attr: "b" }
    shape_table: { fg: "#82aaff" attr: "b" }
    shape_variable: "#c099ff"

    background: "#222436"
    foreground: "#c8d3f5"
    cursor: "#c8d3f5"
}}
