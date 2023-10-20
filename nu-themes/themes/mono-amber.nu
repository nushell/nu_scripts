export def main [] { return {
    separator: "#ff9400"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ff9400" attr: "b" }
    empty: "#ff9400"
    bool: {|| if $in { "#ff9400" } else { "light_gray" } }
    int: "#ff9400"
    filesize: {|e|
        if $e == 0b {
            "#ff9400"
        } else if $e < 1mb {
            "#ff9400"
        } else {{ fg: "#ff9400" }}
    }
    duration: "#ff9400"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff9400" attr: "b" }
        } else if $in < 6hr {
            "#ff9400"
        } else if $in < 1day {
            "#ff9400"
        } else if $in < 3day {
            "#ff9400"
        } else if $in < 1wk {
            { fg: "#ff9400" attr: "b" }
        } else if $in < 6wk {
            "#ff9400"
        } else if $in < 52wk {
            "#ff9400"
        } else { "dark_gray" }
    }
    range: "#ff9400"
    float: "#ff9400"
    string: "#ff9400"
    nothing: "#ff9400"
    binary: "#ff9400"
    cellpath: "#ff9400"
    row_index: { fg: "#ff9400" attr: "b" }
    record: "#ff9400"
    list: "#ff9400"
    block: "#ff9400"
    hints: "dark_gray"
    search_result: { fg: "#ff9400" bg: "#ff9400" }

    shape_and: { fg: "#ff9400" attr: "b" }
    shape_binary: { fg: "#ff9400" attr: "b" }
    shape_block: { fg: "#ff9400" attr: "b" }
    shape_bool: "#ff9400"
    shape_custom: "#ff9400"
    shape_datetime: { fg: "#ff9400" attr: "b" }
    shape_directory: "#ff9400"
    shape_external: "#ff9400"
    shape_externalarg: { fg: "#ff9400" attr: "b" }
    shape_filepath: "#ff9400"
    shape_flag: { fg: "#ff9400" attr: "b" }
    shape_float: { fg: "#ff9400" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ff9400" attr: "b" }
    shape_int: { fg: "#ff9400" attr: "b" }
    shape_internalcall: { fg: "#ff9400" attr: "b" }
    shape_list: { fg: "#ff9400" attr: "b" }
    shape_literal: "#ff9400"
    shape_match_pattern: "#ff9400"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ff9400"
    shape_operator: "#ff9400"
    shape_or: { fg: "#ff9400" attr: "b" }
    shape_pipe: { fg: "#ff9400" attr: "b" }
    shape_range: { fg: "#ff9400" attr: "b" }
    shape_record: { fg: "#ff9400" attr: "b" }
    shape_redirection: { fg: "#ff9400" attr: "b" }
    shape_signature: { fg: "#ff9400" attr: "b" }
    shape_string: "#ff9400"
    shape_string_interpolation: { fg: "#ff9400" attr: "b" }
    shape_table: { fg: "#ff9400" attr: "b" }
    shape_variable: "#ff9400"

    background: "#2b1900"
    foreground: "#ff9400"
    cursor: "#ff9400"
}}