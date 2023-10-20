export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00bb00" attr: "b" }
    empty: "#3a9bdb"
    bool: {|| if $in { "#55ffff" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
        if $e == 0b {
            "#bbbbbb"
        } else if $e < 1mb {
            "#00bbbb"
        } else {{ fg: "#3a9bdb" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a60001" attr: "b" }
        } else if $in < 6hr {
            "#a60001"
        } else if $in < 1day {
            "#fecd22"
        } else if $in < 3day {
            "#00bb00"
        } else if $in < 1wk {
            { fg: "#00bb00" attr: "b" }
        } else if $in < 6wk {
            "#00bbbb"
        } else if $in < 52wk {
            "#3a9bdb"
        } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#00bb00" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"
    search_result: { fg: "#a60001" bg: "#bbbbbb" }

    shape_and: { fg: "#bb00bb" attr: "b" }
    shape_binary: { fg: "#bb00bb" attr: "b" }
    shape_block: { fg: "#3a9bdb" attr: "b" }
    shape_bool: "#55ffff"
    shape_custom: "#00bb00"
    shape_datetime: { fg: "#00bbbb" attr: "b" }
    shape_directory: "#00bbbb"
    shape_external: "#00bbbb"
    shape_externalarg: { fg: "#00bb00" attr: "b" }
    shape_filepath: "#00bbbb"
    shape_flag: { fg: "#3a9bdb" attr: "b" }
    shape_float: { fg: "#bb00bb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00bbbb" attr: "b" }
    shape_int: { fg: "#bb00bb" attr: "b" }
    shape_internalcall: { fg: "#00bbbb" attr: "b" }
    shape_list: { fg: "#00bbbb" attr: "b" }
    shape_literal: "#3a9bdb"
    shape_match_pattern: "#00bb00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#55ffff"
    shape_operator: "#fecd22"
    shape_or: { fg: "#bb00bb" attr: "b" }
    shape_pipe: { fg: "#bb00bb" attr: "b" }
    shape_range: { fg: "#fecd22" attr: "b" }
    shape_record: { fg: "#00bbbb" attr: "b" }
    shape_redirection: { fg: "#bb00bb" attr: "b" }
    shape_signature: { fg: "#00bb00" attr: "b" }
    shape_string: "#00bb00"
    shape_string_interpolation: { fg: "#00bbbb" attr: "b" }
    shape_table: { fg: "#3a9bdb" attr: "b" }
    shape_variable: "#bb00bb"

    background: "#283033"
    foreground: "#cdcdcd"
    cursor: "#cdcdcd"
}}