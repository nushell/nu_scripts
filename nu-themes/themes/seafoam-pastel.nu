export def main [] { return {
    separator: "#e0e0e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#728c62" attr: "b" }
    empty: "#4d7b82"
    bool: {|| if $in { "#ade0e0" } else { "light_gray" } }
    int: "#e0e0e0"
    filesize: {|e|
        if $e == 0b {
            "#e0e0e0"
        } else if $e < 1mb {
            "#729494"
        } else {{ fg: "#4d7b82" }}
    }
    duration: "#e0e0e0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#825d4d" attr: "b" }
        } else if $in < 6hr {
            "#825d4d"
        } else if $in < 1day {
            "#ada16d"
        } else if $in < 3day {
            "#728c62"
        } else if $in < 1wk {
            { fg: "#728c62" attr: "b" }
        } else if $in < 6wk {
            "#729494"
        } else if $in < 52wk {
            "#4d7b82"
        } else { "dark_gray" }
    }
    range: "#e0e0e0"
    float: "#e0e0e0"
    string: "#e0e0e0"
    nothing: "#e0e0e0"
    binary: "#e0e0e0"
    cellpath: "#e0e0e0"
    row_index: { fg: "#728c62" attr: "b" }
    record: "#e0e0e0"
    list: "#e0e0e0"
    block: "#e0e0e0"
    hints: "dark_gray"
    search_result: { fg: "#825d4d" bg: "#e0e0e0" }

    shape_and: { fg: "#8a7267" attr: "b" }
    shape_binary: { fg: "#8a7267" attr: "b" }
    shape_block: { fg: "#4d7b82" attr: "b" }
    shape_bool: "#ade0e0"
    shape_custom: "#728c62"
    shape_datetime: { fg: "#729494" attr: "b" }
    shape_directory: "#729494"
    shape_external: "#729494"
    shape_externalarg: { fg: "#728c62" attr: "b" }
    shape_filepath: "#729494"
    shape_flag: { fg: "#4d7b82" attr: "b" }
    shape_float: { fg: "#8a7267" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#729494" attr: "b" }
    shape_int: { fg: "#8a7267" attr: "b" }
    shape_internalcall: { fg: "#729494" attr: "b" }
    shape_list: { fg: "#729494" attr: "b" }
    shape_literal: "#4d7b82"
    shape_match_pattern: "#728c62"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ade0e0"
    shape_operator: "#ada16d"
    shape_or: { fg: "#8a7267" attr: "b" }
    shape_pipe: { fg: "#8a7267" attr: "b" }
    shape_range: { fg: "#ada16d" attr: "b" }
    shape_record: { fg: "#729494" attr: "b" }
    shape_redirection: { fg: "#8a7267" attr: "b" }
    shape_signature: { fg: "#728c62" attr: "b" }
    shape_string: "#728c62"
    shape_string_interpolation: { fg: "#729494" attr: "b" }
    shape_table: { fg: "#4d7b82" attr: "b" }
    shape_variable: "#8a7267"

    background: "#243435"
    foreground: "#d4e7d4"
    cursor: "#d4e7d4"
}}