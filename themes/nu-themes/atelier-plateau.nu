export def main [] { return {
    separator: "#8a8585"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4b8b8b" attr: "b" }
    empty: "#7272ca"
    bool: {|| if $in { "#5485b6" } else { "light_gray" } }
    int: "#8a8585"
    filesize: {|e|
        if $e == 0b {
            "#8a8585"
        } else if $e < 1mb {
            "#5485b6"
        } else {{ fg: "#7272ca" }}
    }
    duration: "#8a8585"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ca4949" attr: "b" }
        } else if $in < 6hr {
            "#ca4949"
        } else if $in < 1day {
            "#a06e3b"
        } else if $in < 3day {
            "#4b8b8b"
        } else if $in < 1wk {
            { fg: "#4b8b8b" attr: "b" }
        } else if $in < 6wk {
            "#5485b6"
        } else if $in < 52wk {
            "#7272ca"
        } else { "dark_gray" }
    }
    range: "#8a8585"
    float: "#8a8585"
    string: "#8a8585"
    nothing: "#8a8585"
    binary: "#8a8585"
    cellpath: "#8a8585"
    row_index: { fg: "#4b8b8b" attr: "b" }
    record: "#8a8585"
    list: "#8a8585"
    block: "#8a8585"
    hints: "dark_gray"
    search_result: { fg: "#ca4949" bg: "#8a8585" }

    shape_and: { fg: "#8464c4" attr: "b" }
    shape_binary: { fg: "#8464c4" attr: "b" }
    shape_block: { fg: "#7272ca" attr: "b" }
    shape_bool: "#5485b6"
    shape_custom: "#4b8b8b"
    shape_datetime: { fg: "#5485b6" attr: "b" }
    shape_directory: "#5485b6"
    shape_external: "#5485b6"
    shape_externalarg: { fg: "#4b8b8b" attr: "b" }
    shape_filepath: "#5485b6"
    shape_flag: { fg: "#7272ca" attr: "b" }
    shape_float: { fg: "#8464c4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5485b6" attr: "b" }
    shape_int: { fg: "#8464c4" attr: "b" }
    shape_internalcall: { fg: "#5485b6" attr: "b" }
    shape_list: { fg: "#5485b6" attr: "b" }
    shape_literal: "#7272ca"
    shape_match_pattern: "#4b8b8b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5485b6"
    shape_operator: "#a06e3b"
    shape_or: { fg: "#8464c4" attr: "b" }
    shape_pipe: { fg: "#8464c4" attr: "b" }
    shape_range: { fg: "#a06e3b" attr: "b" }
    shape_record: { fg: "#5485b6" attr: "b" }
    shape_redirection: { fg: "#8464c4" attr: "b" }
    shape_signature: { fg: "#4b8b8b" attr: "b" }
    shape_string: "#4b8b8b"
    shape_string_interpolation: { fg: "#5485b6" attr: "b" }
    shape_table: { fg: "#7272ca" attr: "b" }
    shape_variable: "#8464c4"

    background: "#1b1818"
    foreground: "#8a8585"
    cursor: "#8a8585"
}}