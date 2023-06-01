export def main [] { return {
    separator: "#a5a5a5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#24d830" attr: "b" }
    empty: "#7890f0"
    bool: {|| if $in { "#9ce2e2" } else { "light_gray" } }
    int: "#a5a5a5"
    filesize: {|e|
        if $e == 0b {
            "#a5a5a5"
        } else if $e < 1mb {
            "#54e4e4"
        } else {{ fg: "#7890f0" }}
    }
    duration: "#a5a5a5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f01818" attr: "b" }
        } else if $in < 6hr {
            "#f01818"
        } else if $in < 1day {
            "#f0d824"
        } else if $in < 3day {
            "#24d830"
        } else if $in < 1wk {
            { fg: "#24d830" attr: "b" }
        } else if $in < 6wk {
            "#54e4e4"
        } else if $in < 52wk {
            "#7890f0"
        } else { "dark_gray" }
    }
    range: "#a5a5a5"
    float: "#a5a5a5"
    string: "#a5a5a5"
    nothing: "#a5a5a5"
    binary: "#a5a5a5"
    cellpath: "#a5a5a5"
    row_index: { fg: "#24d830" attr: "b" }
    record: "#a5a5a5"
    list: "#a5a5a5"
    block: "#a5a5a5"
    hints: "dark_gray"
    search_result: { fg: "#f01818" bg: "#a5a5a5" }

    shape_and: { fg: "#f078d8" attr: "b" }
    shape_binary: { fg: "#f078d8" attr: "b" }
    shape_block: { fg: "#7890f0" attr: "b" }
    shape_bool: "#9ce2e2"
    shape_custom: "#24d830"
    shape_datetime: { fg: "#54e4e4" attr: "b" }
    shape_directory: "#54e4e4"
    shape_external: "#54e4e4"
    shape_externalarg: { fg: "#24d830" attr: "b" }
    shape_filepath: "#54e4e4"
    shape_flag: { fg: "#7890f0" attr: "b" }
    shape_float: { fg: "#f078d8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#54e4e4" attr: "b" }
    shape_int: { fg: "#f078d8" attr: "b" }
    shape_internalcall: { fg: "#54e4e4" attr: "b" }
    shape_list: { fg: "#54e4e4" attr: "b" }
    shape_literal: "#7890f0"
    shape_match_pattern: "#24d830"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#9ce2e2"
    shape_operator: "#f0d824"
    shape_or: { fg: "#f078d8" attr: "b" }
    shape_pipe: { fg: "#f078d8" attr: "b" }
    shape_range: { fg: "#f0d824" attr: "b" }
    shape_record: { fg: "#54e4e4" attr: "b" }
    shape_redirection: { fg: "#f078d8" attr: "b" }
    shape_signature: { fg: "#24d830" attr: "b" }
    shape_string: "#24d830"
    shape_string_interpolation: { fg: "#54e4e4" attr: "b" }
    shape_table: { fg: "#7890f0" attr: "b" }
    shape_variable: "#f078d8"

    background: "#000000"
    foreground: "#fdfdfd"
    cursor: "#fdfdfd"
}}