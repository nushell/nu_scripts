export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#16c60c" attr: "b" }
    empty: "#3b78ff"
    bool: {|| if $in { "#61d6d6" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
        if $e == 0b {
            "#cccccc"
        } else if $e < 1mb {
            "#61d6d6"
        } else {{ fg: "#3b78ff" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e74856" attr: "b" }
        } else if $in < 6hr {
            "#e74856"
        } else if $in < 1day {
            "#f9f1a5"
        } else if $in < 3day {
            "#16c60c"
        } else if $in < 1wk {
            { fg: "#16c60c" attr: "b" }
        } else if $in < 6wk {
            "#61d6d6"
        } else if $in < 52wk {
            "#3b78ff"
        } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#16c60c" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"
    search_result: { fg: "#e74856" bg: "#cccccc" }

    shape_and: { fg: "#b4009e" attr: "b" }
    shape_binary: { fg: "#b4009e" attr: "b" }
    shape_block: { fg: "#3b78ff" attr: "b" }
    shape_bool: "#61d6d6"
    shape_custom: "#16c60c"
    shape_datetime: { fg: "#61d6d6" attr: "b" }
    shape_directory: "#61d6d6"
    shape_external: "#61d6d6"
    shape_externalarg: { fg: "#16c60c" attr: "b" }
    shape_filepath: "#61d6d6"
    shape_flag: { fg: "#3b78ff" attr: "b" }
    shape_float: { fg: "#b4009e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#61d6d6" attr: "b" }
    shape_int: { fg: "#b4009e" attr: "b" }
    shape_internalcall: { fg: "#61d6d6" attr: "b" }
    shape_list: { fg: "#61d6d6" attr: "b" }
    shape_literal: "#3b78ff"
    shape_match_pattern: "#16c60c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#61d6d6"
    shape_operator: "#f9f1a5"
    shape_or: { fg: "#b4009e" attr: "b" }
    shape_pipe: { fg: "#b4009e" attr: "b" }
    shape_range: { fg: "#f9f1a5" attr: "b" }
    shape_record: { fg: "#61d6d6" attr: "b" }
    shape_redirection: { fg: "#b4009e" attr: "b" }
    shape_signature: { fg: "#16c60c" attr: "b" }
    shape_string: "#16c60c"
    shape_string_interpolation: { fg: "#61d6d6" attr: "b" }
    shape_table: { fg: "#3b78ff" attr: "b" }
    shape_variable: "#b4009e"

    background: "#0c0c0c"
    foreground: "#cccccc"
    cursor: "#cccccc"
}}