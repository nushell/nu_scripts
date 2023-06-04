export def main [] { return {
    separator: "#0bff00"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#0bff00" attr: "b" }
    empty: "#0bff00"
    bool: {|| if $in { "#0bff00" } else { "light_gray" } }
    int: "#0bff00"
    filesize: {|e|
        if $e == 0b {
            "#0bff00"
        } else if $e < 1mb {
            "#0bff00"
        } else {{ fg: "#0bff00" }}
    }
    duration: "#0bff00"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#0bff00" attr: "b" }
        } else if $in < 6hr {
            "#0bff00"
        } else if $in < 1day {
            "#0bff00"
        } else if $in < 3day {
            "#0bff00"
        } else if $in < 1wk {
            { fg: "#0bff00" attr: "b" }
        } else if $in < 6wk {
            "#0bff00"
        } else if $in < 52wk {
            "#0bff00"
        } else { "dark_gray" }
    }
    range: "#0bff00"
    float: "#0bff00"
    string: "#0bff00"
    nothing: "#0bff00"
    binary: "#0bff00"
    cellpath: "#0bff00"
    row_index: { fg: "#0bff00" attr: "b" }
    record: "#0bff00"
    list: "#0bff00"
    block: "#0bff00"
    hints: "dark_gray"
    search_result: { fg: "#0bff00" bg: "#0bff00" }

    shape_and: { fg: "#0bff00" attr: "b" }
    shape_binary: { fg: "#0bff00" attr: "b" }
    shape_block: { fg: "#0bff00" attr: "b" }
    shape_bool: "#0bff00"
    shape_custom: "#0bff00"
    shape_datetime: { fg: "#0bff00" attr: "b" }
    shape_directory: "#0bff00"
    shape_external: "#0bff00"
    shape_externalarg: { fg: "#0bff00" attr: "b" }
    shape_filepath: "#0bff00"
    shape_flag: { fg: "#0bff00" attr: "b" }
    shape_float: { fg: "#0bff00" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0bff00" attr: "b" }
    shape_int: { fg: "#0bff00" attr: "b" }
    shape_internalcall: { fg: "#0bff00" attr: "b" }
    shape_list: { fg: "#0bff00" attr: "b" }
    shape_literal: "#0bff00"
    shape_match_pattern: "#0bff00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#0bff00"
    shape_operator: "#0bff00"
    shape_or: { fg: "#0bff00" attr: "b" }
    shape_pipe: { fg: "#0bff00" attr: "b" }
    shape_range: { fg: "#0bff00" attr: "b" }
    shape_record: { fg: "#0bff00" attr: "b" }
    shape_redirection: { fg: "#0bff00" attr: "b" }
    shape_signature: { fg: "#0bff00" attr: "b" }
    shape_string: "#0bff00"
    shape_string_interpolation: { fg: "#0bff00" attr: "b" }
    shape_table: { fg: "#0bff00" attr: "b" }
    shape_variable: "#0bff00"

    background: "#022b00"
    foreground: "#0bff00"
    cursor: "#0bff00"
}}