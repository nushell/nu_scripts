export def main [] { return {
    separator: "#e9e7e1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#f2e6a9" attr: "b" }
    empty: "#40bfff"
    bool: {|| if $in { "#fb6acb" } else { "light_gray" } }
    int: "#e9e7e1"
    filesize: {|e|
        if $e == 0b {
            "#e9e7e1"
        } else if $e < 1mb {
            "#fb6acb"
        } else {{ fg: "#40bfff" }}
    }
    duration: "#e9e7e1"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff661a" attr: "b" }
        } else if $in < 6hr {
            "#ff661a"
        } else if $in < 1day {
            "#ffdc2d"
        } else if $in < 3day {
            "#f2e6a9"
        } else if $in < 1wk {
            { fg: "#f2e6a9" attr: "b" }
        } else if $in < 6wk {
            "#fb6acb"
        } else if $in < 52wk {
            "#40bfff"
        } else { "dark_gray" }
    }
    range: "#e9e7e1"
    float: "#e9e7e1"
    string: "#e9e7e1"
    nothing: "#e9e7e1"
    binary: "#e9e7e1"
    cellpath: "#e9e7e1"
    row_index: { fg: "#f2e6a9" attr: "b" }
    record: "#e9e7e1"
    list: "#e9e7e1"
    block: "#e9e7e1"
    hints: "dark_gray"
    search_result: { fg: "#ff661a" bg: "#e9e7e1" }

    shape_and: { fg: "#ae94f9" attr: "b" }
    shape_binary: { fg: "#ae94f9" attr: "b" }
    shape_block: { fg: "#40bfff" attr: "b" }
    shape_bool: "#fb6acb"
    shape_custom: "#f2e6a9"
    shape_datetime: { fg: "#fb6acb" attr: "b" }
    shape_directory: "#fb6acb"
    shape_external: "#fb6acb"
    shape_externalarg: { fg: "#f2e6a9" attr: "b" }
    shape_filepath: "#fb6acb"
    shape_flag: { fg: "#40bfff" attr: "b" }
    shape_float: { fg: "#ae94f9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#fb6acb" attr: "b" }
    shape_int: { fg: "#ae94f9" attr: "b" }
    shape_internalcall: { fg: "#fb6acb" attr: "b" }
    shape_list: { fg: "#fb6acb" attr: "b" }
    shape_literal: "#40bfff"
    shape_match_pattern: "#f2e6a9"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#fb6acb"
    shape_operator: "#ffdc2d"
    shape_or: { fg: "#ae94f9" attr: "b" }
    shape_pipe: { fg: "#ae94f9" attr: "b" }
    shape_range: { fg: "#ffdc2d" attr: "b" }
    shape_record: { fg: "#fb6acb" attr: "b" }
    shape_redirection: { fg: "#ae94f9" attr: "b" }
    shape_signature: { fg: "#f2e6a9" attr: "b" }
    shape_string: "#f2e6a9"
    shape_string_interpolation: { fg: "#fb6acb" attr: "b" }
    shape_table: { fg: "#40bfff" attr: "b" }
    shape_variable: "#ae94f9"

    background: "#202126"
    foreground: "#e9e7e1"
    cursor: "#e9e7e1"
}}