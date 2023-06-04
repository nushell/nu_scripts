export def main [] { return {
    separator: "#f0f1ce"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5cab96" attr: "b" }
    empty: "#0f548b"
    bool: {|| if $in { "#83a7b4" } else { "light_gray" } }
    int: "#f0f1ce"
    filesize: {|e|
        if $e == 0b {
            "#f0f1ce"
        } else if $e < 1mb {
            "#06afc7"
        } else {{ fg: "#0f548b" }}
    }
    duration: "#f0f1ce"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e35b00" attr: "b" }
        } else if $in < 6hr {
            "#e35b00"
        } else if $in < 1day {
            "#e3cd7b"
        } else if $in < 3day {
            "#5cab96"
        } else if $in < 1wk {
            { fg: "#5cab96" attr: "b" }
        } else if $in < 6wk {
            "#06afc7"
        } else if $in < 52wk {
            "#0f548b"
        } else { "dark_gray" }
    }
    range: "#f0f1ce"
    float: "#f0f1ce"
    string: "#f0f1ce"
    nothing: "#f0f1ce"
    binary: "#f0f1ce"
    cellpath: "#f0f1ce"
    row_index: { fg: "#5cab96" attr: "b" }
    record: "#f0f1ce"
    list: "#f0f1ce"
    block: "#f0f1ce"
    hints: "dark_gray"
    search_result: { fg: "#e35b00" bg: "#f0f1ce" }

    shape_and: { fg: "#e35b00" attr: "b" }
    shape_binary: { fg: "#e35b00" attr: "b" }
    shape_block: { fg: "#0f548b" attr: "b" }
    shape_bool: "#83a7b4"
    shape_custom: "#5cab96"
    shape_datetime: { fg: "#06afc7" attr: "b" }
    shape_directory: "#06afc7"
    shape_external: "#06afc7"
    shape_externalarg: { fg: "#5cab96" attr: "b" }
    shape_filepath: "#06afc7"
    shape_flag: { fg: "#0f548b" attr: "b" }
    shape_float: { fg: "#e35b00" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#06afc7" attr: "b" }
    shape_int: { fg: "#e35b00" attr: "b" }
    shape_internalcall: { fg: "#06afc7" attr: "b" }
    shape_list: { fg: "#06afc7" attr: "b" }
    shape_literal: "#0f548b"
    shape_match_pattern: "#5cab96"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#83a7b4"
    shape_operator: "#e3cd7b"
    shape_or: { fg: "#e35b00" attr: "b" }
    shape_pipe: { fg: "#e35b00" attr: "b" }
    shape_range: { fg: "#e3cd7b" attr: "b" }
    shape_record: { fg: "#06afc7" attr: "b" }
    shape_redirection: { fg: "#e35b00" attr: "b" }
    shape_signature: { fg: "#5cab96" attr: "b" }
    shape_string: "#5cab96"
    shape_string_interpolation: { fg: "#06afc7" attr: "b" }
    shape_table: { fg: "#0f548b" attr: "b" }
    shape_variable: "#e35b00"

    background: "#0a1e24"
    foreground: "#ecf0c1"
    cursor: "#ecf0c1"
}}