export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#509f50" attr: "b" }
    empty: "#46657d"
    bool: {|| if $in { "#a4d4f8" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#87c1f1"
        } else {{ fg: "#46657d" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#da4839" attr: "b" }
        } else if $in < 6hr {
            "#da4839"
        } else if $in < 1day {
            "#ffd249"
        } else if $in < 3day {
            "#509f50"
        } else if $in < 1wk {
            { fg: "#509f50" attr: "b" }
        } else if $in < 6wk {
            "#87c1f1"
        } else if $in < 52wk {
            "#46657d"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#509f50" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#da4839" bg: "#ffffff" }

    shape_and: { fg: "#cfcfff" attr: "b" }
    shape_binary: { fg: "#cfcfff" attr: "b" }
    shape_block: { fg: "#46657d" attr: "b" }
    shape_bool: "#a4d4f8"
    shape_custom: "#509f50"
    shape_datetime: { fg: "#87c1f1" attr: "b" }
    shape_directory: "#87c1f1"
    shape_external: "#87c1f1"
    shape_externalarg: { fg: "#509f50" attr: "b" }
    shape_filepath: "#87c1f1"
    shape_flag: { fg: "#46657d" attr: "b" }
    shape_float: { fg: "#cfcfff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#87c1f1" attr: "b" }
    shape_int: { fg: "#cfcfff" attr: "b" }
    shape_internalcall: { fg: "#87c1f1" attr: "b" }
    shape_list: { fg: "#87c1f1" attr: "b" }
    shape_literal: "#46657d"
    shape_match_pattern: "#509f50"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a4d4f8"
    shape_operator: "#ffd249"
    shape_or: { fg: "#cfcfff" attr: "b" }
    shape_pipe: { fg: "#cfcfff" attr: "b" }
    shape_range: { fg: "#ffd249" attr: "b" }
    shape_record: { fg: "#87c1f1" attr: "b" }
    shape_redirection: { fg: "#cfcfff" attr: "b" }
    shape_signature: { fg: "#509f50" attr: "b" }
    shape_string: "#509f50"
    shape_string_interpolation: { fg: "#87c1f1" attr: "b" }
    shape_table: { fg: "#46657d" attr: "b" }
    shape_variable: "#cfcfff"

    background: "#3a3a3a"
    foreground: "#e9cb7b"
    cursor: "#7f7f7f"
}}