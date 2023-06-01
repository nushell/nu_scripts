export def main [] { return {
    separator: "#9fa2a6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5de561" attr: "b" }
    empty: "#1ae1dc"
    bool: {|| if $in { "#4b8f77" } else { "light_gray" } }
    int: "#9fa2a6"
    filesize: {|e|
        if $e == 0b {
            "#9fa2a6"
        } else if $e < 1mb {
            "#4b8f77"
        } else {{ fg: "#1ae1dc" }}
    }
    duration: "#9fa2a6"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c4676c" attr: "b" }
        } else if $in < 6hr {
            "#c4676c"
        } else if $in < 1day {
            "#cfd05d"
        } else if $in < 3day {
            "#5de561"
        } else if $in < 1wk {
            { fg: "#5de561" attr: "b" }
        } else if $in < 6wk {
            "#4b8f77"
        } else if $in < 52wk {
            "#1ae1dc"
        } else { "dark_gray" }
    }
    range: "#9fa2a6"
    float: "#9fa2a6"
    string: "#9fa2a6"
    nothing: "#9fa2a6"
    binary: "#9fa2a6"
    cellpath: "#9fa2a6"
    row_index: { fg: "#5de561" attr: "b" }
    record: "#9fa2a6"
    list: "#9fa2a6"
    block: "#9fa2a6"
    hints: "dark_gray"
    search_result: { fg: "#c4676c" bg: "#9fa2a6" }

    shape_and: { fg: "#9c6cd3" attr: "b" }
    shape_binary: { fg: "#9c6cd3" attr: "b" }
    shape_block: { fg: "#1ae1dc" attr: "b" }
    shape_bool: "#4b8f77"
    shape_custom: "#5de561"
    shape_datetime: { fg: "#4b8f77" attr: "b" }
    shape_directory: "#4b8f77"
    shape_external: "#4b8f77"
    shape_externalarg: { fg: "#5de561" attr: "b" }
    shape_filepath: "#4b8f77"
    shape_flag: { fg: "#1ae1dc" attr: "b" }
    shape_float: { fg: "#9c6cd3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4b8f77" attr: "b" }
    shape_int: { fg: "#9c6cd3" attr: "b" }
    shape_internalcall: { fg: "#4b8f77" attr: "b" }
    shape_list: { fg: "#4b8f77" attr: "b" }
    shape_literal: "#1ae1dc"
    shape_match_pattern: "#5de561"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4b8f77"
    shape_operator: "#cfd05d"
    shape_or: { fg: "#9c6cd3" attr: "b" }
    shape_pipe: { fg: "#9c6cd3" attr: "b" }
    shape_range: { fg: "#cfd05d" attr: "b" }
    shape_record: { fg: "#4b8f77" attr: "b" }
    shape_redirection: { fg: "#9c6cd3" attr: "b" }
    shape_signature: { fg: "#5de561" attr: "b" }
    shape_string: "#5de561"
    shape_string_interpolation: { fg: "#4b8f77" attr: "b" }
    shape_table: { fg: "#1ae1dc" attr: "b" }
    shape_variable: "#9c6cd3"

    background: "#2a3b4d"
    foreground: "#9fa2a6"
    cursor: "#9fa2a6"
}}