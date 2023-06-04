export def main [] { return {
    separator: "#cbe3e7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a1efd3" attr: "b" }
    empty: "#91ddff"
    bool: {|| if $in { "#63f2f1" } else { "light_gray" } }
    int: "#cbe3e7"
    filesize: {|e|
        if $e == 0b {
            "#cbe3e7"
        } else if $e < 1mb {
            "#87dfeb"
        } else {{ fg: "#91ddff" }}
    }
    duration: "#cbe3e7"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f48fb1" attr: "b" }
        } else if $in < 6hr {
            "#f48fb1"
        } else if $in < 1day {
            "#ffe6b3"
        } else if $in < 3day {
            "#a1efd3"
        } else if $in < 1wk {
            { fg: "#a1efd3" attr: "b" }
        } else if $in < 6wk {
            "#87dfeb"
        } else if $in < 52wk {
            "#91ddff"
        } else { "dark_gray" }
    }
    range: "#cbe3e7"
    float: "#cbe3e7"
    string: "#cbe3e7"
    nothing: "#cbe3e7"
    binary: "#cbe3e7"
    cellpath: "#cbe3e7"
    row_index: { fg: "#a1efd3" attr: "b" }
    record: "#cbe3e7"
    list: "#cbe3e7"
    block: "#cbe3e7"
    hints: "dark_gray"
    search_result: { fg: "#f48fb1" bg: "#cbe3e7" }

    shape_and: { fg: "#d4bfff" attr: "b" }
    shape_binary: { fg: "#d4bfff" attr: "b" }
    shape_block: { fg: "#91ddff" attr: "b" }
    shape_bool: "#63f2f1"
    shape_custom: "#a1efd3"
    shape_datetime: { fg: "#87dfeb" attr: "b" }
    shape_directory: "#87dfeb"
    shape_external: "#87dfeb"
    shape_externalarg: { fg: "#a1efd3" attr: "b" }
    shape_filepath: "#87dfeb"
    shape_flag: { fg: "#91ddff" attr: "b" }
    shape_float: { fg: "#d4bfff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#87dfeb" attr: "b" }
    shape_int: { fg: "#d4bfff" attr: "b" }
    shape_internalcall: { fg: "#87dfeb" attr: "b" }
    shape_list: { fg: "#87dfeb" attr: "b" }
    shape_literal: "#91ddff"
    shape_match_pattern: "#a1efd3"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#63f2f1"
    shape_operator: "#ffe6b3"
    shape_or: { fg: "#d4bfff" attr: "b" }
    shape_pipe: { fg: "#d4bfff" attr: "b" }
    shape_range: { fg: "#ffe6b3" attr: "b" }
    shape_record: { fg: "#87dfeb" attr: "b" }
    shape_redirection: { fg: "#d4bfff" attr: "b" }
    shape_signature: { fg: "#a1efd3" attr: "b" }
    shape_string: "#a1efd3"
    shape_string_interpolation: { fg: "#87dfeb" attr: "b" }
    shape_table: { fg: "#91ddff" attr: "b" }
    shape_variable: "#d4bfff"

    background: "#1e1c31"
    foreground: "#cbe3e7"
    cursor: "#cbe3e7"
}}