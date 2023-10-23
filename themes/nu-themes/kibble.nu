export def main [] { return {
    separator: "#e2d1e3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#29cf13" attr: "b" }
    empty: "#3449d1"
    bool: {|| if $in { "#68f2e0" } else { "light_gray" } }
    int: "#e2d1e3"
    filesize: {|e|
        if $e == 0b {
            "#e2d1e3"
        } else if $e < 1mb {
            "#0798ab"
        } else {{ fg: "#3449d1" }}
    }
    duration: "#e2d1e3"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c70031" attr: "b" }
        } else if $in < 6hr {
            "#c70031"
        } else if $in < 1day {
            "#d8e30e"
        } else if $in < 3day {
            "#29cf13"
        } else if $in < 1wk {
            { fg: "#29cf13" attr: "b" }
        } else if $in < 6wk {
            "#0798ab"
        } else if $in < 52wk {
            "#3449d1"
        } else { "dark_gray" }
    }
    range: "#e2d1e3"
    float: "#e2d1e3"
    string: "#e2d1e3"
    nothing: "#e2d1e3"
    binary: "#e2d1e3"
    cellpath: "#e2d1e3"
    row_index: { fg: "#29cf13" attr: "b" }
    record: "#e2d1e3"
    list: "#e2d1e3"
    block: "#e2d1e3"
    hints: "dark_gray"
    search_result: { fg: "#c70031" bg: "#e2d1e3" }

    shape_and: { fg: "#8400ff" attr: "b" }
    shape_binary: { fg: "#8400ff" attr: "b" }
    shape_block: { fg: "#3449d1" attr: "b" }
    shape_bool: "#68f2e0"
    shape_custom: "#29cf13"
    shape_datetime: { fg: "#0798ab" attr: "b" }
    shape_directory: "#0798ab"
    shape_external: "#0798ab"
    shape_externalarg: { fg: "#29cf13" attr: "b" }
    shape_filepath: "#0798ab"
    shape_flag: { fg: "#3449d1" attr: "b" }
    shape_float: { fg: "#8400ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0798ab" attr: "b" }
    shape_int: { fg: "#8400ff" attr: "b" }
    shape_internalcall: { fg: "#0798ab" attr: "b" }
    shape_list: { fg: "#0798ab" attr: "b" }
    shape_literal: "#3449d1"
    shape_match_pattern: "#29cf13"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#68f2e0"
    shape_operator: "#d8e30e"
    shape_or: { fg: "#8400ff" attr: "b" }
    shape_pipe: { fg: "#8400ff" attr: "b" }
    shape_range: { fg: "#d8e30e" attr: "b" }
    shape_record: { fg: "#0798ab" attr: "b" }
    shape_redirection: { fg: "#8400ff" attr: "b" }
    shape_signature: { fg: "#29cf13" attr: "b" }
    shape_string: "#29cf13"
    shape_string_interpolation: { fg: "#0798ab" attr: "b" }
    shape_table: { fg: "#3449d1" attr: "b" }
    shape_variable: "#8400ff"

    background: "#0e100a"
    foreground: "#f7f7f7"
    cursor: "#f7f7f7"
}}