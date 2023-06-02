export def main [] { return {
    separator: "#e0e0e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#87c38a" attr: "b" }
    empty: "#85befd"
    bool: {|| if $in { "#85befd" } else { "light_gray" } }
    int: "#e0e0e0"
    filesize: {|e|
        if $e == 0b {
            "#e0e0e0"
        } else if $e < 1mb {
            "#85befd"
        } else {{ fg: "#85befd" }}
    }
    duration: "#e0e0e0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fd5ff1" attr: "b" }
        } else if $in < 6hr {
            "#fd5ff1"
        } else if $in < 1day {
            "#ffd7b1"
        } else if $in < 3day {
            "#87c38a"
        } else if $in < 1wk {
            { fg: "#87c38a" attr: "b" }
        } else if $in < 6wk {
            "#85befd"
        } else if $in < 52wk {
            "#85befd"
        } else { "dark_gray" }
    }
    range: "#e0e0e0"
    float: "#e0e0e0"
    string: "#e0e0e0"
    nothing: "#e0e0e0"
    binary: "#e0e0e0"
    cellpath: "#e0e0e0"
    row_index: { fg: "#87c38a" attr: "b" }
    record: "#e0e0e0"
    list: "#e0e0e0"
    block: "#e0e0e0"
    hints: "dark_gray"
    search_result: { fg: "#fd5ff1" bg: "#e0e0e0" }

    shape_and: { fg: "#b9b6fc" attr: "b" }
    shape_binary: { fg: "#b9b6fc" attr: "b" }
    shape_block: { fg: "#85befd" attr: "b" }
    shape_bool: "#85befd"
    shape_custom: "#87c38a"
    shape_datetime: { fg: "#85befd" attr: "b" }
    shape_directory: "#85befd"
    shape_external: "#85befd"
    shape_externalarg: { fg: "#87c38a" attr: "b" }
    shape_filepath: "#85befd"
    shape_flag: { fg: "#85befd" attr: "b" }
    shape_float: { fg: "#b9b6fc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#85befd" attr: "b" }
    shape_int: { fg: "#b9b6fc" attr: "b" }
    shape_internalcall: { fg: "#85befd" attr: "b" }
    shape_list: { fg: "#85befd" attr: "b" }
    shape_literal: "#85befd"
    shape_match_pattern: "#87c38a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#85befd"
    shape_operator: "#ffd7b1"
    shape_or: { fg: "#b9b6fc" attr: "b" }
    shape_pipe: { fg: "#b9b6fc" attr: "b" }
    shape_range: { fg: "#ffd7b1" attr: "b" }
    shape_record: { fg: "#85befd" attr: "b" }
    shape_redirection: { fg: "#b9b6fc" attr: "b" }
    shape_signature: { fg: "#87c38a" attr: "b" }
    shape_string: "#87c38a"
    shape_string_interpolation: { fg: "#85befd" attr: "b" }
    shape_table: { fg: "#85befd" attr: "b" }
    shape_variable: "#b9b6fc"

    background: "#161719"
    foreground: "#c5c8c6"
    cursor: "#c5c8c6"
}}