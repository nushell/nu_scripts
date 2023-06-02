export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#fa0074" attr: "b" }
    empty: "#3282ff"
    bool: {|| if $in { "#8ae9fc" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
        if $e == 0b {
            "#bbbbbb"
        } else if $e < 1mb {
            "#0037fc"
        } else {{ fg: "#3282ff" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff5555" attr: "b" }
        } else if $in < 6hr {
            "#ff5555"
        } else if $in < 1day {
            "#7f0a1f"
        } else if $in < 3day {
            "#fa0074"
        } else if $in < 1wk {
            { fg: "#fa0074" attr: "b" }
        } else if $in < 6wk {
            "#0037fc"
        } else if $in < 52wk {
            "#3282ff"
        } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#fa0074" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"
    search_result: { fg: "#ff5555" bg: "#bbbbbb" }

    shape_and: { fg: "#1b3cff" attr: "b" }
    shape_binary: { fg: "#1b3cff" attr: "b" }
    shape_block: { fg: "#3282ff" attr: "b" }
    shape_bool: "#8ae9fc"
    shape_custom: "#fa0074"
    shape_datetime: { fg: "#0037fc" attr: "b" }
    shape_directory: "#0037fc"
    shape_external: "#0037fc"
    shape_externalarg: { fg: "#fa0074" attr: "b" }
    shape_filepath: "#0037fc"
    shape_flag: { fg: "#3282ff" attr: "b" }
    shape_float: { fg: "#1b3cff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0037fc" attr: "b" }
    shape_int: { fg: "#1b3cff" attr: "b" }
    shape_internalcall: { fg: "#0037fc" attr: "b" }
    shape_list: { fg: "#0037fc" attr: "b" }
    shape_literal: "#3282ff"
    shape_match_pattern: "#fa0074"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8ae9fc"
    shape_operator: "#7f0a1f"
    shape_or: { fg: "#1b3cff" attr: "b" }
    shape_pipe: { fg: "#1b3cff" attr: "b" }
    shape_range: { fg: "#7f0a1f" attr: "b" }
    shape_record: { fg: "#0037fc" attr: "b" }
    shape_redirection: { fg: "#1b3cff" attr: "b" }
    shape_signature: { fg: "#fa0074" attr: "b" }
    shape_string: "#fa0074"
    shape_string_interpolation: { fg: "#0037fc" attr: "b" }
    shape_table: { fg: "#3282ff" attr: "b" }
    shape_variable: "#1b3cff"

    background: "#222330"
    foreground: "#cef3ff"
    cursor: "#ffffff"
}}