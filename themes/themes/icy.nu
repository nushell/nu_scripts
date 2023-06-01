export def main [] { return {
    separator: "#095b67"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4dd0e1" attr: "b" }
    empty: "#00bcd4"
    bool: {|| if $in { "#26c6da" } else { "light_gray" } }
    int: "#095b67"
    filesize: {|e|
        if $e == 0b {
            "#095b67"
        } else if $e < 1mb {
            "#26c6da"
        } else {{ fg: "#00bcd4" }}
    }
    duration: "#095b67"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#16c1d9" attr: "b" }
        } else if $in < 6hr {
            "#16c1d9"
        } else if $in < 1day {
            "#80deea"
        } else if $in < 3day {
            "#4dd0e1"
        } else if $in < 1wk {
            { fg: "#4dd0e1" attr: "b" }
        } else if $in < 6wk {
            "#26c6da"
        } else if $in < 52wk {
            "#00bcd4"
        } else { "dark_gray" }
    }
    range: "#095b67"
    float: "#095b67"
    string: "#095b67"
    nothing: "#095b67"
    binary: "#095b67"
    cellpath: "#095b67"
    row_index: { fg: "#4dd0e1" attr: "b" }
    record: "#095b67"
    list: "#095b67"
    block: "#095b67"
    hints: "dark_gray"
    search_result: { fg: "#16c1d9" bg: "#095b67" }

    shape_and: { fg: "#00acc1" attr: "b" }
    shape_binary: { fg: "#00acc1" attr: "b" }
    shape_block: { fg: "#00bcd4" attr: "b" }
    shape_bool: "#26c6da"
    shape_custom: "#4dd0e1"
    shape_datetime: { fg: "#26c6da" attr: "b" }
    shape_directory: "#26c6da"
    shape_external: "#26c6da"
    shape_externalarg: { fg: "#4dd0e1" attr: "b" }
    shape_filepath: "#26c6da"
    shape_flag: { fg: "#00bcd4" attr: "b" }
    shape_float: { fg: "#00acc1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#26c6da" attr: "b" }
    shape_int: { fg: "#00acc1" attr: "b" }
    shape_internalcall: { fg: "#26c6da" attr: "b" }
    shape_list: { fg: "#26c6da" attr: "b" }
    shape_literal: "#00bcd4"
    shape_match_pattern: "#4dd0e1"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#26c6da"
    shape_operator: "#80deea"
    shape_or: { fg: "#00acc1" attr: "b" }
    shape_pipe: { fg: "#00acc1" attr: "b" }
    shape_range: { fg: "#80deea" attr: "b" }
    shape_record: { fg: "#26c6da" attr: "b" }
    shape_redirection: { fg: "#00acc1" attr: "b" }
    shape_signature: { fg: "#4dd0e1" attr: "b" }
    shape_string: "#4dd0e1"
    shape_string_interpolation: { fg: "#26c6da" attr: "b" }
    shape_table: { fg: "#00bcd4" attr: "b" }
    shape_variable: "#00acc1"

    background: "#021012"
    foreground: "#095b67"
    cursor: "#095b67"
}}