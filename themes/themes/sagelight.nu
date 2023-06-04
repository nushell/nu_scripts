export def main [] { return {
    separator: "#383838"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a0d2c8" attr: "b" }
    empty: "#a0a7d2"
    bool: {|| if $in { "#a2d6f5" } else { "light_gray" } }
    int: "#383838"
    filesize: {|e|
        if $e == 0b {
            "#383838"
        } else if $e < 1mb {
            "#a2d6f5"
        } else {{ fg: "#a0a7d2" }}
    }
    duration: "#383838"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fa8480" attr: "b" }
        } else if $in < 6hr {
            "#fa8480"
        } else if $in < 1day {
            "#ffdc61"
        } else if $in < 3day {
            "#a0d2c8"
        } else if $in < 1wk {
            { fg: "#a0d2c8" attr: "b" }
        } else if $in < 6wk {
            "#a2d6f5"
        } else if $in < 52wk {
            "#a0a7d2"
        } else { "dark_gray" }
    }
    range: "#383838"
    float: "#383838"
    string: "#383838"
    nothing: "#383838"
    binary: "#383838"
    cellpath: "#383838"
    row_index: { fg: "#a0d2c8" attr: "b" }
    record: "#383838"
    list: "#383838"
    block: "#383838"
    hints: "dark_gray"
    search_result: { fg: "#fa8480" bg: "#383838" }

    shape_and: { fg: "#c8a0d2" attr: "b" }
    shape_binary: { fg: "#c8a0d2" attr: "b" }
    shape_block: { fg: "#a0a7d2" attr: "b" }
    shape_bool: "#a2d6f5"
    shape_custom: "#a0d2c8"
    shape_datetime: { fg: "#a2d6f5" attr: "b" }
    shape_directory: "#a2d6f5"
    shape_external: "#a2d6f5"
    shape_externalarg: { fg: "#a0d2c8" attr: "b" }
    shape_filepath: "#a2d6f5"
    shape_flag: { fg: "#a0a7d2" attr: "b" }
    shape_float: { fg: "#c8a0d2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#a2d6f5" attr: "b" }
    shape_int: { fg: "#c8a0d2" attr: "b" }
    shape_internalcall: { fg: "#a2d6f5" attr: "b" }
    shape_list: { fg: "#a2d6f5" attr: "b" }
    shape_literal: "#a0a7d2"
    shape_match_pattern: "#a0d2c8"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a2d6f5"
    shape_operator: "#ffdc61"
    shape_or: { fg: "#c8a0d2" attr: "b" }
    shape_pipe: { fg: "#c8a0d2" attr: "b" }
    shape_range: { fg: "#ffdc61" attr: "b" }
    shape_record: { fg: "#a2d6f5" attr: "b" }
    shape_redirection: { fg: "#c8a0d2" attr: "b" }
    shape_signature: { fg: "#a0d2c8" attr: "b" }
    shape_string: "#a0d2c8"
    shape_string_interpolation: { fg: "#a2d6f5" attr: "b" }
    shape_table: { fg: "#a0a7d2" attr: "b" }
    shape_variable: "#c8a0d2"

    background: "#f8f8f8"
    foreground: "#383838"
    cursor: "#383838"
}}