export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4e8d53" attr: "b" }
    empty: "#534e8d"
    bool: {|| if $in { "#78b0b5" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#4e888d"
        } else {{ fg: "#534e8d" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#8d534e" attr: "b" }
        } else if $in < 6hr {
            "#8d534e"
        } else if $in < 1day {
            "#888d4e"
        } else if $in < 3day {
            "#4e8d53"
        } else if $in < 1wk {
            { fg: "#4e8d53" attr: "b" }
        } else if $in < 6wk {
            "#4e888d"
        } else if $in < 52wk {
            "#534e8d"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#4e8d53" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#8d534e" bg: "#ffffff" }

    shape_and: { fg: "#8d4e88" attr: "b" }
    shape_binary: { fg: "#8d4e88" attr: "b" }
    shape_block: { fg: "#534e8d" attr: "b" }
    shape_bool: "#78b0b5"
    shape_custom: "#4e8d53"
    shape_datetime: { fg: "#4e888d" attr: "b" }
    shape_directory: "#4e888d"
    shape_external: "#4e888d"
    shape_externalarg: { fg: "#4e8d53" attr: "b" }
    shape_filepath: "#4e888d"
    shape_flag: { fg: "#534e8d" attr: "b" }
    shape_float: { fg: "#8d4e88" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4e888d" attr: "b" }
    shape_int: { fg: "#8d4e88" attr: "b" }
    shape_internalcall: { fg: "#4e888d" attr: "b" }
    shape_list: { fg: "#4e888d" attr: "b" }
    shape_literal: "#534e8d"
    shape_match_pattern: "#4e8d53"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#78b0b5"
    shape_operator: "#888d4e"
    shape_or: { fg: "#8d4e88" attr: "b" }
    shape_pipe: { fg: "#8d4e88" attr: "b" }
    shape_range: { fg: "#888d4e" attr: "b" }
    shape_record: { fg: "#4e888d" attr: "b" }
    shape_redirection: { fg: "#8d4e88" attr: "b" }
    shape_signature: { fg: "#4e8d53" attr: "b" }
    shape_string: "#4e8d53"
    shape_string_interpolation: { fg: "#4e888d" attr: "b" }
    shape_table: { fg: "#534e8d" attr: "b" }
    shape_variable: "#8d4e88"

    background: "#2e2e35"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}