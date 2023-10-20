export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a5c261" attr: "b" }
    empty: "#6c99bb"
    bool: {|| if $in { "#bed6ff" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
        if $e == 0b {
            "#cccccc"
        } else if $e < 1mb {
            "#bed6ff"
        } else {{ fg: "#6c99bb" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d25252" attr: "b" }
        } else if $in < 6hr {
            "#d25252"
        } else if $in < 1day {
            "#ffc66d"
        } else if $in < 3day {
            "#a5c261"
        } else if $in < 1wk {
            { fg: "#a5c261" attr: "b" }
        } else if $in < 6wk {
            "#bed6ff"
        } else if $in < 52wk {
            "#6c99bb"
        } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#a5c261" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"
    search_result: { fg: "#d25252" bg: "#cccccc" }

    shape_and: { fg: "#d197d9" attr: "b" }
    shape_binary: { fg: "#d197d9" attr: "b" }
    shape_block: { fg: "#6c99bb" attr: "b" }
    shape_bool: "#bed6ff"
    shape_custom: "#a5c261"
    shape_datetime: { fg: "#bed6ff" attr: "b" }
    shape_directory: "#bed6ff"
    shape_external: "#bed6ff"
    shape_externalarg: { fg: "#a5c261" attr: "b" }
    shape_filepath: "#bed6ff"
    shape_flag: { fg: "#6c99bb" attr: "b" }
    shape_float: { fg: "#d197d9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#bed6ff" attr: "b" }
    shape_int: { fg: "#d197d9" attr: "b" }
    shape_internalcall: { fg: "#bed6ff" attr: "b" }
    shape_list: { fg: "#bed6ff" attr: "b" }
    shape_literal: "#6c99bb"
    shape_match_pattern: "#a5c261"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#bed6ff"
    shape_operator: "#ffc66d"
    shape_or: { fg: "#d197d9" attr: "b" }
    shape_pipe: { fg: "#d197d9" attr: "b" }
    shape_range: { fg: "#ffc66d" attr: "b" }
    shape_record: { fg: "#bed6ff" attr: "b" }
    shape_redirection: { fg: "#d197d9" attr: "b" }
    shape_signature: { fg: "#a5c261" attr: "b" }
    shape_string: "#a5c261"
    shape_string_interpolation: { fg: "#bed6ff" attr: "b" }
    shape_table: { fg: "#6c99bb" attr: "b" }
    shape_variable: "#d197d9"

    background: "#2d2d2d"
    foreground: "#cccccc"
    cursor: "#cccccc"
}}