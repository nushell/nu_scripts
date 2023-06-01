export def main [] { return {
    separator: "#eeeeee"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#c9d05c" attr: "b" }
    empty: "#b3deef"
    bool: {|| if $in { "#73cef4" } else { "light_gray" } }
    int: "#eeeeee"
    filesize: {|e|
        if $e == 0b {
            "#eeeeee"
        } else if $e < 1mb {
            "#73cef4"
        } else {{ fg: "#b3deef" }}
    }
    duration: "#eeeeee"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f43753" attr: "b" }
        } else if $in < 6hr {
            "#f43753"
        } else if $in < 1day {
            "#ffc24b"
        } else if $in < 3day {
            "#c9d05c"
        } else if $in < 1wk {
            { fg: "#c9d05c" attr: "b" }
        } else if $in < 6wk {
            "#73cef4"
        } else if $in < 52wk {
            "#b3deef"
        } else { "dark_gray" }
    }
    range: "#eeeeee"
    float: "#eeeeee"
    string: "#eeeeee"
    nothing: "#eeeeee"
    binary: "#eeeeee"
    cellpath: "#eeeeee"
    row_index: { fg: "#c9d05c" attr: "b" }
    record: "#eeeeee"
    list: "#eeeeee"
    block: "#eeeeee"
    hints: "dark_gray"
    search_result: { fg: "#f43753" bg: "#eeeeee" }

    shape_and: { fg: "#d3b987" attr: "b" }
    shape_binary: { fg: "#d3b987" attr: "b" }
    shape_block: { fg: "#b3deef" attr: "b" }
    shape_bool: "#73cef4"
    shape_custom: "#c9d05c"
    shape_datetime: { fg: "#73cef4" attr: "b" }
    shape_directory: "#73cef4"
    shape_external: "#73cef4"
    shape_externalarg: { fg: "#c9d05c" attr: "b" }
    shape_filepath: "#73cef4"
    shape_flag: { fg: "#b3deef" attr: "b" }
    shape_float: { fg: "#d3b987" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#73cef4" attr: "b" }
    shape_int: { fg: "#d3b987" attr: "b" }
    shape_internalcall: { fg: "#73cef4" attr: "b" }
    shape_list: { fg: "#73cef4" attr: "b" }
    shape_literal: "#b3deef"
    shape_match_pattern: "#c9d05c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#73cef4"
    shape_operator: "#ffc24b"
    shape_or: { fg: "#d3b987" attr: "b" }
    shape_pipe: { fg: "#d3b987" attr: "b" }
    shape_range: { fg: "#ffc24b" attr: "b" }
    shape_record: { fg: "#73cef4" attr: "b" }
    shape_redirection: { fg: "#d3b987" attr: "b" }
    shape_signature: { fg: "#c9d05c" attr: "b" }
    shape_string: "#c9d05c"
    shape_string_interpolation: { fg: "#73cef4" attr: "b" }
    shape_table: { fg: "#b3deef" attr: "b" }
    shape_variable: "#d3b987"

    background: "#282828"
    foreground: "#eeeeee"
    cursor: "#eeeeee"
}}