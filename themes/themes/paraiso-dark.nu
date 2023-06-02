export def main [] { return {
    separator: "#a39e9b"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#48b685" attr: "b" }
    empty: "#06b6ef"
    bool: {|| if $in { "#5bc4bf" } else { "light_gray" } }
    int: "#a39e9b"
    filesize: {|e|
        if $e == 0b {
            "#a39e9b"
        } else if $e < 1mb {
            "#5bc4bf"
        } else {{ fg: "#06b6ef" }}
    }
    duration: "#a39e9b"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ef6155" attr: "b" }
        } else if $in < 6hr {
            "#ef6155"
        } else if $in < 1day {
            "#fec418"
        } else if $in < 3day {
            "#48b685"
        } else if $in < 1wk {
            { fg: "#48b685" attr: "b" }
        } else if $in < 6wk {
            "#5bc4bf"
        } else if $in < 52wk {
            "#06b6ef"
        } else { "dark_gray" }
    }
    range: "#a39e9b"
    float: "#a39e9b"
    string: "#a39e9b"
    nothing: "#a39e9b"
    binary: "#a39e9b"
    cellpath: "#a39e9b"
    row_index: { fg: "#48b685" attr: "b" }
    record: "#a39e9b"
    list: "#a39e9b"
    block: "#a39e9b"
    hints: "dark_gray"
    search_result: { fg: "#ef6155" bg: "#a39e9b" }

    shape_and: { fg: "#815ba4" attr: "b" }
    shape_binary: { fg: "#815ba4" attr: "b" }
    shape_block: { fg: "#06b6ef" attr: "b" }
    shape_bool: "#5bc4bf"
    shape_custom: "#48b685"
    shape_datetime: { fg: "#5bc4bf" attr: "b" }
    shape_directory: "#5bc4bf"
    shape_external: "#5bc4bf"
    shape_externalarg: { fg: "#48b685" attr: "b" }
    shape_filepath: "#5bc4bf"
    shape_flag: { fg: "#06b6ef" attr: "b" }
    shape_float: { fg: "#815ba4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5bc4bf" attr: "b" }
    shape_int: { fg: "#815ba4" attr: "b" }
    shape_internalcall: { fg: "#5bc4bf" attr: "b" }
    shape_list: { fg: "#5bc4bf" attr: "b" }
    shape_literal: "#06b6ef"
    shape_match_pattern: "#48b685"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5bc4bf"
    shape_operator: "#fec418"
    shape_or: { fg: "#815ba4" attr: "b" }
    shape_pipe: { fg: "#815ba4" attr: "b" }
    shape_range: { fg: "#fec418" attr: "b" }
    shape_record: { fg: "#5bc4bf" attr: "b" }
    shape_redirection: { fg: "#815ba4" attr: "b" }
    shape_signature: { fg: "#48b685" attr: "b" }
    shape_string: "#48b685"
    shape_string_interpolation: { fg: "#5bc4bf" attr: "b" }
    shape_table: { fg: "#06b6ef" attr: "b" }
    shape_variable: "#815ba4"

    background: "#2f1e2e"
    foreground: "#a39e9b"
    cursor: "#a39e9b"
}}