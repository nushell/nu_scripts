export def main [] { return {
    separator: "#dedee7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#99c899" attr: "b" }
    empty: "#537c9c"
    bool: {|| if $in { "#78b4b4" } else { "light_gray" } }
    int: "#dedee7"
    filesize: {|e|
        if $e == 0b {
            "#dedee7"
        } else if $e < 1mb {
            "#78b4b4"
        } else {{ fg: "#537c9c" }}
    }
    duration: "#dedee7"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c88c8c" attr: "b" }
        } else if $in < 6hr {
            "#c88c8c"
        } else if $in < 1day {
            "#d8b56d"
        } else if $in < 3day {
            "#99c899"
        } else if $in < 1wk {
            { fg: "#99c899" attr: "b" }
        } else if $in < 6wk {
            "#78b4b4"
        } else if $in < 52wk {
            "#537c9c"
        } else { "dark_gray" }
    }
    range: "#dedee7"
    float: "#dedee7"
    string: "#dedee7"
    nothing: "#dedee7"
    binary: "#dedee7"
    cellpath: "#dedee7"
    row_index: { fg: "#99c899" attr: "b" }
    record: "#dedee7"
    list: "#dedee7"
    block: "#dedee7"
    hints: "dark_gray"
    search_result: { fg: "#c88c8c" bg: "#dedee7" }

    shape_and: { fg: "#86cacd" attr: "b" }
    shape_binary: { fg: "#86cacd" attr: "b" }
    shape_block: { fg: "#537c9c" attr: "b" }
    shape_bool: "#78b4b4"
    shape_custom: "#99c899"
    shape_datetime: { fg: "#78b4b4" attr: "b" }
    shape_directory: "#78b4b4"
    shape_external: "#78b4b4"
    shape_externalarg: { fg: "#99c899" attr: "b" }
    shape_filepath: "#78b4b4"
    shape_flag: { fg: "#537c9c" attr: "b" }
    shape_float: { fg: "#86cacd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#78b4b4" attr: "b" }
    shape_int: { fg: "#86cacd" attr: "b" }
    shape_internalcall: { fg: "#78b4b4" attr: "b" }
    shape_list: { fg: "#78b4b4" attr: "b" }
    shape_literal: "#537c9c"
    shape_match_pattern: "#99c899"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#78b4b4"
    shape_operator: "#d8b56d"
    shape_or: { fg: "#86cacd" attr: "b" }
    shape_pipe: { fg: "#86cacd" attr: "b" }
    shape_range: { fg: "#d8b56d" attr: "b" }
    shape_record: { fg: "#78b4b4" attr: "b" }
    shape_redirection: { fg: "#86cacd" attr: "b" }
    shape_signature: { fg: "#99c899" attr: "b" }
    shape_string: "#99c899"
    shape_string_interpolation: { fg: "#78b4b4" attr: "b" }
    shape_table: { fg: "#537c9c" attr: "b" }
    shape_variable: "#86cacd"

    background: "#222222"
    foreground: "#dedee7"
    cursor: "#dedee7"
}}