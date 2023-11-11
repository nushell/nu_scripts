export def main [] { return {
    separator: "#e0e0e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a1c659" attr: "b" }
    empty: "#6fb3d2"
    bool: {|| if $in { "#76c7b7" } else { "light_gray" } }
    int: "#e0e0e0"
    filesize: {|e|
        if $e == 0b {
            "#e0e0e0"
        } else if $e < 1mb {
            "#76c7b7"
        } else {{ fg: "#6fb3d2" }}
    }
    duration: "#e0e0e0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fb0120" attr: "b" }
        } else if $in < 6hr {
            "#fb0120"
        } else if $in < 1day {
            "#fda331"
        } else if $in < 3day {
            "#a1c659"
        } else if $in < 1wk {
            { fg: "#a1c659" attr: "b" }
        } else if $in < 6wk {
            "#76c7b7"
        } else if $in < 52wk {
            "#6fb3d2"
        } else { "dark_gray" }
    }
    range: "#e0e0e0"
    float: "#e0e0e0"
    string: "#e0e0e0"
    nothing: "#e0e0e0"
    binary: "#e0e0e0"
    cellpath: "#e0e0e0"
    row_index: { fg: "#a1c659" attr: "b" }
    record: "#e0e0e0"
    list: "#e0e0e0"
    block: "#e0e0e0"
    hints: "dark_gray"
    search_result: { fg: "#fb0120" bg: "#e0e0e0" }

    shape_and: { fg: "#d381c3" attr: "b" }
    shape_binary: { fg: "#d381c3" attr: "b" }
    shape_block: { fg: "#6fb3d2" attr: "b" }
    shape_bool: "#76c7b7"
    shape_custom: "#a1c659"
    shape_datetime: { fg: "#76c7b7" attr: "b" }
    shape_directory: "#76c7b7"
    shape_external: "#76c7b7"
    shape_externalarg: { fg: "#a1c659" attr: "b" }
    shape_filepath: "#76c7b7"
    shape_flag: { fg: "#6fb3d2" attr: "b" }
    shape_float: { fg: "#d381c3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#76c7b7" attr: "b" }
    shape_int: { fg: "#d381c3" attr: "b" }
    shape_internalcall: { fg: "#76c7b7" attr: "b" }
    shape_list: { fg: "#76c7b7" attr: "b" }
    shape_literal: "#6fb3d2"
    shape_match_pattern: "#a1c659"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#76c7b7"
    shape_operator: "#fda331"
    shape_or: { fg: "#d381c3" attr: "b" }
    shape_pipe: { fg: "#d381c3" attr: "b" }
    shape_range: { fg: "#fda331" attr: "b" }
    shape_record: { fg: "#76c7b7" attr: "b" }
    shape_redirection: { fg: "#d381c3" attr: "b" }
    shape_signature: { fg: "#a1c659" attr: "b" }
    shape_string: "#a1c659"
    shape_string_interpolation: { fg: "#76c7b7" attr: "b" }
    shape_table: { fg: "#6fb3d2" attr: "b" }
    shape_variable: "#d381c3"

    background: "#000000"
    foreground: "#e0e0e0"
    cursor: "#e0e0e0"
}}