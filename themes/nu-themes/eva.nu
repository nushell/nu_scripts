export def main [] { return {
    separator: "#9fa2a6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#66ff66" attr: "b" }
    empty: "#15f4ee"
    bool: {|| if $in { "#4b8f77" } else { "light_gray" } }
    int: "#9fa2a6"
    filesize: {|e|
        if $e == 0b {
            "#9fa2a6"
        } else if $e < 1mb {
            "#4b8f77"
        } else {{ fg: "#15f4ee" }}
    }
    duration: "#9fa2a6"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c4676c" attr: "b" }
        } else if $in < 6hr {
            "#c4676c"
        } else if $in < 1day {
            "#ffff66"
        } else if $in < 3day {
            "#66ff66"
        } else if $in < 1wk {
            { fg: "#66ff66" attr: "b" }
        } else if $in < 6wk {
            "#4b8f77"
        } else if $in < 52wk {
            "#15f4ee"
        } else { "dark_gray" }
    }
    range: "#9fa2a6"
    float: "#9fa2a6"
    string: "#9fa2a6"
    nothing: "#9fa2a6"
    binary: "#9fa2a6"
    cellpath: "#9fa2a6"
    row_index: { fg: "#66ff66" attr: "b" }
    record: "#9fa2a6"
    list: "#9fa2a6"
    block: "#9fa2a6"
    hints: "dark_gray"
    search_result: { fg: "#c4676c" bg: "#9fa2a6" }

    shape_and: { fg: "#9c6cd3" attr: "b" }
    shape_binary: { fg: "#9c6cd3" attr: "b" }
    shape_block: { fg: "#15f4ee" attr: "b" }
    shape_bool: "#4b8f77"
    shape_custom: "#66ff66"
    shape_datetime: { fg: "#4b8f77" attr: "b" }
    shape_directory: "#4b8f77"
    shape_external: "#4b8f77"
    shape_externalarg: { fg: "#66ff66" attr: "b" }
    shape_filepath: "#4b8f77"
    shape_flag: { fg: "#15f4ee" attr: "b" }
    shape_float: { fg: "#9c6cd3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4b8f77" attr: "b" }
    shape_int: { fg: "#9c6cd3" attr: "b" }
    shape_internalcall: { fg: "#4b8f77" attr: "b" }
    shape_list: { fg: "#4b8f77" attr: "b" }
    shape_literal: "#15f4ee"
    shape_match_pattern: "#66ff66"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4b8f77"
    shape_operator: "#ffff66"
    shape_or: { fg: "#9c6cd3" attr: "b" }
    shape_pipe: { fg: "#9c6cd3" attr: "b" }
    shape_range: { fg: "#ffff66" attr: "b" }
    shape_record: { fg: "#4b8f77" attr: "b" }
    shape_redirection: { fg: "#9c6cd3" attr: "b" }
    shape_signature: { fg: "#66ff66" attr: "b" }
    shape_string: "#66ff66"
    shape_string_interpolation: { fg: "#4b8f77" attr: "b" }
    shape_table: { fg: "#15f4ee" attr: "b" }
    shape_variable: "#9c6cd3"

    background: "#2a3b4d"
    foreground: "#9fa2a6"
    cursor: "#9fa2a6"
}}