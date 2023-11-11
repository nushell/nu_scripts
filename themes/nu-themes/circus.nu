export def main [] { return {
    separator: "#a7a7a7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#84b97c" attr: "b" }
    empty: "#639ee4"
    bool: {|| if $in { "#4bb1a7" } else { "light_gray" } }
    int: "#a7a7a7"
    filesize: {|e|
        if $e == 0b {
            "#a7a7a7"
        } else if $e < 1mb {
            "#4bb1a7"
        } else {{ fg: "#639ee4" }}
    }
    duration: "#a7a7a7"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#dc657d" attr: "b" }
        } else if $in < 6hr {
            "#dc657d"
        } else if $in < 1day {
            "#c3ba63"
        } else if $in < 3day {
            "#84b97c"
        } else if $in < 1wk {
            { fg: "#84b97c" attr: "b" }
        } else if $in < 6wk {
            "#4bb1a7"
        } else if $in < 52wk {
            "#639ee4"
        } else { "dark_gray" }
    }
    range: "#a7a7a7"
    float: "#a7a7a7"
    string: "#a7a7a7"
    nothing: "#a7a7a7"
    binary: "#a7a7a7"
    cellpath: "#a7a7a7"
    row_index: { fg: "#84b97c" attr: "b" }
    record: "#a7a7a7"
    list: "#a7a7a7"
    block: "#a7a7a7"
    hints: "dark_gray"
    search_result: { fg: "#dc657d" bg: "#a7a7a7" }

    shape_and: { fg: "#b888e2" attr: "b" }
    shape_binary: { fg: "#b888e2" attr: "b" }
    shape_block: { fg: "#639ee4" attr: "b" }
    shape_bool: "#4bb1a7"
    shape_custom: "#84b97c"
    shape_datetime: { fg: "#4bb1a7" attr: "b" }
    shape_directory: "#4bb1a7"
    shape_external: "#4bb1a7"
    shape_externalarg: { fg: "#84b97c" attr: "b" }
    shape_filepath: "#4bb1a7"
    shape_flag: { fg: "#639ee4" attr: "b" }
    shape_float: { fg: "#b888e2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4bb1a7" attr: "b" }
    shape_int: { fg: "#b888e2" attr: "b" }
    shape_internalcall: { fg: "#4bb1a7" attr: "b" }
    shape_list: { fg: "#4bb1a7" attr: "b" }
    shape_literal: "#639ee4"
    shape_match_pattern: "#84b97c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4bb1a7"
    shape_operator: "#c3ba63"
    shape_or: { fg: "#b888e2" attr: "b" }
    shape_pipe: { fg: "#b888e2" attr: "b" }
    shape_range: { fg: "#c3ba63" attr: "b" }
    shape_record: { fg: "#4bb1a7" attr: "b" }
    shape_redirection: { fg: "#b888e2" attr: "b" }
    shape_signature: { fg: "#84b97c" attr: "b" }
    shape_string: "#84b97c"
    shape_string_interpolation: { fg: "#4bb1a7" attr: "b" }
    shape_table: { fg: "#639ee4" attr: "b" }
    shape_variable: "#b888e2"

    background: "#191919"
    foreground: "#a7a7a7"
    cursor: "#a7a7a7"
}}