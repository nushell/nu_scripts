export def main [] { return {
    separator: "#e1e1e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#74af68" attr: "b" }
    empty: "#338f86"
    bool: {|| if $in { "#00ede1" } else { "light_gray" } }
    int: "#e1e1e0"
    filesize: {|e|
        if $e == 0b {
            "#e1e1e0"
        } else if $e < 1mb {
            "#23d7d7"
        } else {{ fg: "#338f86" }}
    }
    duration: "#e1e1e0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff4242" attr: "b" }
        } else if $in < 6hr {
            "#ff4242"
        } else if $in < 1day {
            "#ffad29"
        } else if $in < 3day {
            "#74af68"
        } else if $in < 1wk {
            { fg: "#74af68" attr: "b" }
        } else if $in < 6wk {
            "#23d7d7"
        } else if $in < 52wk {
            "#338f86"
        } else { "dark_gray" }
    }
    range: "#e1e1e0"
    float: "#e1e1e0"
    string: "#e1e1e0"
    nothing: "#e1e1e0"
    binary: "#e1e1e0"
    cellpath: "#e1e1e0"
    row_index: { fg: "#74af68" attr: "b" }
    record: "#e1e1e0"
    list: "#e1e1e0"
    block: "#e1e1e0"
    hints: "dark_gray"
    search_result: { fg: "#ff4242" bg: "#e1e1e0" }

    shape_and: { fg: "#9414e6" attr: "b" }
    shape_binary: { fg: "#9414e6" attr: "b" }
    shape_block: { fg: "#338f86" attr: "b" }
    shape_bool: "#00ede1"
    shape_custom: "#74af68"
    shape_datetime: { fg: "#23d7d7" attr: "b" }
    shape_directory: "#23d7d7"
    shape_external: "#23d7d7"
    shape_externalarg: { fg: "#74af68" attr: "b" }
    shape_filepath: "#23d7d7"
    shape_flag: { fg: "#338f86" attr: "b" }
    shape_float: { fg: "#9414e6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#23d7d7" attr: "b" }
    shape_int: { fg: "#9414e6" attr: "b" }
    shape_internalcall: { fg: "#23d7d7" attr: "b" }
    shape_list: { fg: "#23d7d7" attr: "b" }
    shape_literal: "#338f86"
    shape_match_pattern: "#74af68"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00ede1"
    shape_operator: "#ffad29"
    shape_or: { fg: "#9414e6" attr: "b" }
    shape_pipe: { fg: "#9414e6" attr: "b" }
    shape_range: { fg: "#ffad29" attr: "b" }
    shape_record: { fg: "#23d7d7" attr: "b" }
    shape_redirection: { fg: "#9414e6" attr: "b" }
    shape_signature: { fg: "#74af68" attr: "b" }
    shape_string: "#74af68"
    shape_string_interpolation: { fg: "#23d7d7" attr: "b" }
    shape_table: { fg: "#338f86" attr: "b" }
    shape_variable: "#9414e6"

    background: "#2d3743"
    foreground: "#e1e1e0"
    cursor: "#e1e1e0"
}}