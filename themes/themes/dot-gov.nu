export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#3d9751" attr: "b" }
    empty: "#16b1df"
    bool: {|| if $in { "#8bd1ed" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#8bd1ed"
        } else {{ fg: "#16b1df" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#bf081d" attr: "b" }
        } else if $in < 6hr {
            "#bf081d"
        } else if $in < 1day {
            "#f6bb33"
        } else if $in < 3day {
            "#3d9751"
        } else if $in < 1wk {
            { fg: "#3d9751" attr: "b" }
        } else if $in < 6wk {
            "#8bd1ed"
        } else if $in < 52wk {
            "#16b1df"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#3d9751" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#bf081d" bg: "#ffffff" }

    shape_and: { fg: "#772fb0" attr: "b" }
    shape_binary: { fg: "#772fb0" attr: "b" }
    shape_block: { fg: "#16b1df" attr: "b" }
    shape_bool: "#8bd1ed"
    shape_custom: "#3d9751"
    shape_datetime: { fg: "#8bd1ed" attr: "b" }
    shape_directory: "#8bd1ed"
    shape_external: "#8bd1ed"
    shape_externalarg: { fg: "#3d9751" attr: "b" }
    shape_filepath: "#8bd1ed"
    shape_flag: { fg: "#16b1df" attr: "b" }
    shape_float: { fg: "#772fb0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8bd1ed" attr: "b" }
    shape_int: { fg: "#772fb0" attr: "b" }
    shape_internalcall: { fg: "#8bd1ed" attr: "b" }
    shape_list: { fg: "#8bd1ed" attr: "b" }
    shape_literal: "#16b1df"
    shape_match_pattern: "#3d9751"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8bd1ed"
    shape_operator: "#f6bb33"
    shape_or: { fg: "#772fb0" attr: "b" }
    shape_pipe: { fg: "#772fb0" attr: "b" }
    shape_range: { fg: "#f6bb33" attr: "b" }
    shape_record: { fg: "#8bd1ed" attr: "b" }
    shape_redirection: { fg: "#772fb0" attr: "b" }
    shape_signature: { fg: "#3d9751" attr: "b" }
    shape_string: "#3d9751"
    shape_string_interpolation: { fg: "#8bd1ed" attr: "b" }
    shape_table: { fg: "#16b1df" attr: "b" }
    shape_variable: "#772fb0"

    background: "#252b35"
    foreground: "#eaeaea"
    cursor: "#d9002f"
}}