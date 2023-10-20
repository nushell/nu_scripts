export def main [] { return {
    separator: "#b3b3b3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#328a5d" attr: "b" }
    empty: "#135cd0"
    bool: {|| if $in { "#3ad5ce" } else { "light_gray" } }
    int: "#b3b3b3"
    filesize: {|e|
        if $e == 0b {
            "#b3b3b3"
        } else if $e < 1mb {
            "#33c3c1"
        } else {{ fg: "#135cd0" }}
    }
    duration: "#b3b3b3"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f8282a" attr: "b" }
        } else if $in < 6hr {
            "#f8282a"
        } else if $in < 1day {
            "#fa701d"
        } else if $in < 3day {
            "#328a5d"
        } else if $in < 1wk {
            { fg: "#328a5d" attr: "b" }
        } else if $in < 6wk {
            "#33c3c1"
        } else if $in < 52wk {
            "#135cd0"
        } else { "dark_gray" }
    }
    range: "#b3b3b3"
    float: "#b3b3b3"
    string: "#b3b3b3"
    nothing: "#b3b3b3"
    binary: "#b3b3b3"
    cellpath: "#b3b3b3"
    row_index: { fg: "#328a5d" attr: "b" }
    record: "#b3b3b3"
    list: "#b3b3b3"
    block: "#b3b3b3"
    hints: "dark_gray"
    search_result: { fg: "#f8282a" bg: "#b3b3b3" }

    shape_and: { fg: "#9f00bd" attr: "b" }
    shape_binary: { fg: "#9f00bd" attr: "b" }
    shape_block: { fg: "#135cd0" attr: "b" }
    shape_bool: "#3ad5ce"
    shape_custom: "#328a5d"
    shape_datetime: { fg: "#33c3c1" attr: "b" }
    shape_directory: "#33c3c1"
    shape_external: "#33c3c1"
    shape_externalarg: { fg: "#328a5d" attr: "b" }
    shape_filepath: "#33c3c1"
    shape_flag: { fg: "#135cd0" attr: "b" }
    shape_float: { fg: "#9f00bd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#33c3c1" attr: "b" }
    shape_int: { fg: "#9f00bd" attr: "b" }
    shape_internalcall: { fg: "#33c3c1" attr: "b" }
    shape_list: { fg: "#33c3c1" attr: "b" }
    shape_literal: "#135cd0"
    shape_match_pattern: "#328a5d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3ad5ce"
    shape_operator: "#fa701d"
    shape_or: { fg: "#9f00bd" attr: "b" }
    shape_pipe: { fg: "#9f00bd" attr: "b" }
    shape_range: { fg: "#fa701d" attr: "b" }
    shape_record: { fg: "#33c3c1" attr: "b" }
    shape_redirection: { fg: "#9f00bd" attr: "b" }
    shape_signature: { fg: "#328a5d" attr: "b" }
    shape_string: "#328a5d"
    shape_string_interpolation: { fg: "#33c3c1" attr: "b" }
    shape_table: { fg: "#135cd0" attr: "b" }
    shape_variable: "#9f00bd"

    background: "#ffffff"
    foreground: "#262626"
    cursor: "#262626"
}}