export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7b9246" attr: "b" }
    empty: "#6c99bb"
    bool: {|| if $in { "#7dd6cf" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
        if $e == 0b {
            "#d0d0d0"
        } else if $e < 1mb {
            "#7dd6cf"
        } else {{ fg: "#6c99bb" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a53c23" attr: "b" }
        } else if $in < 6hr {
            "#a53c23"
        } else if $in < 1day {
            "#d3a04d"
        } else if $in < 3day {
            "#7b9246"
        } else if $in < 1wk {
            { fg: "#7b9246" attr: "b" }
        } else if $in < 6wk {
            "#7dd6cf"
        } else if $in < 52wk {
            "#6c99bb"
        } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#7b9246" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"
    search_result: { fg: "#a53c23" bg: "#d0d0d0" }

    shape_and: { fg: "#9f4e85" attr: "b" }
    shape_binary: { fg: "#9f4e85" attr: "b" }
    shape_block: { fg: "#6c99bb" attr: "b" }
    shape_bool: "#7dd6cf"
    shape_custom: "#7b9246"
    shape_datetime: { fg: "#7dd6cf" attr: "b" }
    shape_directory: "#7dd6cf"
    shape_external: "#7dd6cf"
    shape_externalarg: { fg: "#7b9246" attr: "b" }
    shape_filepath: "#7dd6cf"
    shape_flag: { fg: "#6c99bb" attr: "b" }
    shape_float: { fg: "#9f4e85" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7dd6cf" attr: "b" }
    shape_int: { fg: "#9f4e85" attr: "b" }
    shape_internalcall: { fg: "#7dd6cf" attr: "b" }
    shape_list: { fg: "#7dd6cf" attr: "b" }
    shape_literal: "#6c99bb"
    shape_match_pattern: "#7b9246"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7dd6cf"
    shape_operator: "#d3a04d"
    shape_or: { fg: "#9f4e85" attr: "b" }
    shape_pipe: { fg: "#9f4e85" attr: "b" }
    shape_range: { fg: "#d3a04d" attr: "b" }
    shape_record: { fg: "#7dd6cf" attr: "b" }
    shape_redirection: { fg: "#9f4e85" attr: "b" }
    shape_signature: { fg: "#7b9246" attr: "b" }
    shape_string: "#7b9246"
    shape_string_interpolation: { fg: "#7dd6cf" attr: "b" }
    shape_table: { fg: "#6c99bb" attr: "b" }
    shape_variable: "#9f4e85"

    background: "#222222"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}