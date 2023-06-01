export def main [] { return {
    separator: "#a39a90"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#57826d" attr: "b" }
    empty: "#6d5782"
    bool: {|| if $in { "#576d82" } else { "light_gray" } }
    int: "#a39a90"
    filesize: {|e|
        if $e == 0b {
            "#a39a90"
        } else if $e < 1mb {
            "#576d82"
        } else {{ fg: "#6d5782" }}
    }
    duration: "#a39a90"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#826d57" attr: "b" }
        } else if $in < 6hr {
            "#826d57"
        } else if $in < 1day {
            "#6d8257"
        } else if $in < 3day {
            "#57826d"
        } else if $in < 1wk {
            { fg: "#57826d" attr: "b" }
        } else if $in < 6wk {
            "#576d82"
        } else if $in < 52wk {
            "#6d5782"
        } else { "dark_gray" }
    }
    range: "#a39a90"
    float: "#a39a90"
    string: "#a39a90"
    nothing: "#a39a90"
    binary: "#a39a90"
    cellpath: "#a39a90"
    row_index: { fg: "#57826d" attr: "b" }
    record: "#a39a90"
    list: "#a39a90"
    block: "#a39a90"
    hints: "dark_gray"
    search_result: { fg: "#826d57" bg: "#a39a90" }

    shape_and: { fg: "#82576d" attr: "b" }
    shape_binary: { fg: "#82576d" attr: "b" }
    shape_block: { fg: "#6d5782" attr: "b" }
    shape_bool: "#576d82"
    shape_custom: "#57826d"
    shape_datetime: { fg: "#576d82" attr: "b" }
    shape_directory: "#576d82"
    shape_external: "#576d82"
    shape_externalarg: { fg: "#57826d" attr: "b" }
    shape_filepath: "#576d82"
    shape_flag: { fg: "#6d5782" attr: "b" }
    shape_float: { fg: "#82576d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#576d82" attr: "b" }
    shape_int: { fg: "#82576d" attr: "b" }
    shape_internalcall: { fg: "#576d82" attr: "b" }
    shape_list: { fg: "#576d82" attr: "b" }
    shape_literal: "#6d5782"
    shape_match_pattern: "#57826d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#576d82"
    shape_operator: "#6d8257"
    shape_or: { fg: "#82576d" attr: "b" }
    shape_pipe: { fg: "#82576d" attr: "b" }
    shape_range: { fg: "#6d8257" attr: "b" }
    shape_record: { fg: "#576d82" attr: "b" }
    shape_redirection: { fg: "#82576d" attr: "b" }
    shape_signature: { fg: "#57826d" attr: "b" }
    shape_string: "#57826d"
    shape_string_interpolation: { fg: "#576d82" attr: "b" }
    shape_table: { fg: "#6d5782" attr: "b" }
    shape_variable: "#82576d"

    background: "#16130f"
    foreground: "#a39a90"
    cursor: "#a39a90"
}}