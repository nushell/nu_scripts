export def main [] { return {
    separator: "#b5b4c9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#76a065" attr: "b" }
    empty: "#8296b0"
    bool: {|| if $in { "#7dc2c7" } else { "light_gray" } }
    int: "#b5b4c9"
    filesize: {|e|
        if $e == 0b {
            "#b5b4c9"
        } else if $e < 1mb {
            "#659ea2"
        } else {{ fg: "#8296b0" }}
    }
    duration: "#b5b4c9"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cf8164" attr: "b" }
        } else if $in < 6hr {
            "#cf8164"
        } else if $in < 1day {
            "#ab924c"
        } else if $in < 3day {
            "#76a065"
        } else if $in < 1wk {
            { fg: "#76a065" attr: "b" }
        } else if $in < 6wk {
            "#659ea2"
        } else if $in < 52wk {
            "#8296b0"
        } else { "dark_gray" }
    }
    range: "#b5b4c9"
    float: "#b5b4c9"
    string: "#b5b4c9"
    nothing: "#b5b4c9"
    binary: "#b5b4c9"
    cellpath: "#b5b4c9"
    row_index: { fg: "#76a065" attr: "b" }
    record: "#b5b4c9"
    list: "#b5b4c9"
    block: "#b5b4c9"
    hints: "dark_gray"
    search_result: { fg: "#cf8164" bg: "#b5b4c9" }

    shape_and: { fg: "#a18daf" attr: "b" }
    shape_binary: { fg: "#a18daf" attr: "b" }
    shape_block: { fg: "#8296b0" attr: "b" }
    shape_bool: "#7dc2c7"
    shape_custom: "#76a065"
    shape_datetime: { fg: "#659ea2" attr: "b" }
    shape_directory: "#659ea2"
    shape_external: "#659ea2"
    shape_externalarg: { fg: "#76a065" attr: "b" }
    shape_filepath: "#659ea2"
    shape_flag: { fg: "#8296b0" attr: "b" }
    shape_float: { fg: "#a18daf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#659ea2" attr: "b" }
    shape_int: { fg: "#a18daf" attr: "b" }
    shape_internalcall: { fg: "#659ea2" attr: "b" }
    shape_list: { fg: "#659ea2" attr: "b" }
    shape_literal: "#8296b0"
    shape_match_pattern: "#76a065"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7dc2c7"
    shape_operator: "#ab924c"
    shape_or: { fg: "#a18daf" attr: "b" }
    shape_pipe: { fg: "#a18daf" attr: "b" }
    shape_range: { fg: "#ab924c" attr: "b" }
    shape_record: { fg: "#659ea2" attr: "b" }
    shape_redirection: { fg: "#a18daf" attr: "b" }
    shape_signature: { fg: "#76a065" attr: "b" }
    shape_string: "#76a065"
    shape_string_interpolation: { fg: "#659ea2" attr: "b" }
    shape_table: { fg: "#8296b0" attr: "b" }
    shape_variable: "#a18daf"

    background: "#191c25"
    foreground: "#b5b4c9"
    cursor: "#b5b4c9"
}}