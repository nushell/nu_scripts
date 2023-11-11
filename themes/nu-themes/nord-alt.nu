export def main [] { return {
    separator: "#8fbcbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#434c5e" attr: "b" }
    empty: "#d8dee9"
    bool: {|| if $in { "#b48ead" } else { "light_gray" } }
    int: "#8fbcbb"
    filesize: {|e|
        if $e == 0b {
            "#8fbcbb"
        } else if $e < 1mb {
            "#eceff4"
        } else {{ fg: "#d8dee9" }}
    }
    duration: "#8fbcbb"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#3b4252" attr: "b" }
        } else if $in < 6hr {
            "#3b4252"
        } else if $in < 1day {
            "#4c566a"
        } else if $in < 3day {
            "#434c5e"
        } else if $in < 1wk {
            { fg: "#434c5e" attr: "b" }
        } else if $in < 6wk {
            "#eceff4"
        } else if $in < 52wk {
            "#d8dee9"
        } else { "dark_gray" }
    }
    range: "#8fbcbb"
    float: "#8fbcbb"
    string: "#8fbcbb"
    nothing: "#8fbcbb"
    binary: "#8fbcbb"
    cellpath: "#8fbcbb"
    row_index: { fg: "#434c5e" attr: "b" }
    record: "#8fbcbb"
    list: "#8fbcbb"
    block: "#8fbcbb"
    hints: "dark_gray"
    search_result: { fg: "#3b4252" bg: "#8fbcbb" }

    shape_and: { fg: "#e5e9f0" attr: "b" }
    shape_binary: { fg: "#e5e9f0" attr: "b" }
    shape_block: { fg: "#d8dee9" attr: "b" }
    shape_bool: "#b48ead"
    shape_custom: "#434c5e"
    shape_datetime: { fg: "#eceff4" attr: "b" }
    shape_directory: "#eceff4"
    shape_external: "#eceff4"
    shape_externalarg: { fg: "#434c5e" attr: "b" }
    shape_filepath: "#eceff4"
    shape_flag: { fg: "#d8dee9" attr: "b" }
    shape_float: { fg: "#e5e9f0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#eceff4" attr: "b" }
    shape_int: { fg: "#e5e9f0" attr: "b" }
    shape_internalcall: { fg: "#eceff4" attr: "b" }
    shape_list: { fg: "#eceff4" attr: "b" }
    shape_literal: "#d8dee9"
    shape_match_pattern: "#434c5e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b48ead"
    shape_operator: "#4c566a"
    shape_or: { fg: "#e5e9f0" attr: "b" }
    shape_pipe: { fg: "#e5e9f0" attr: "b" }
    shape_range: { fg: "#4c566a" attr: "b" }
    shape_record: { fg: "#eceff4" attr: "b" }
    shape_redirection: { fg: "#e5e9f0" attr: "b" }
    shape_signature: { fg: "#434c5e" attr: "b" }
    shape_string: "#434c5e"
    shape_string_interpolation: { fg: "#eceff4" attr: "b" }
    shape_table: { fg: "#d8dee9" attr: "b" }
    shape_variable: "#e5e9f0"

    background: "#2e3440"
    foreground: "#8fbcbb"
    cursor: "#8fbcbb"
}}