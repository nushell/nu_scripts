export def main [] { return {
    separator: "#808080"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4dca27" attr: "b" }
    empty: "#274dca"
    bool: {|| if $in { "#8de9d4" } else { "light_gray" } }
    int: "#808080"
    filesize: {|e|
        if $e == 0b {
            "#808080"
        } else if $e < 1mb {
            "#27caa4"
        } else {{ fg: "#274dca" }}
    }
    duration: "#808080"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ca274d" attr: "b" }
        } else if $in < 6hr {
            "#ca274d"
        } else if $in < 1day {
            "#caa427"
        } else if $in < 3day {
            "#4dca27"
        } else if $in < 1wk {
            { fg: "#4dca27" attr: "b" }
        } else if $in < 6wk {
            "#27caa4"
        } else if $in < 52wk {
            "#274dca"
        } else { "dark_gray" }
    }
    range: "#808080"
    float: "#808080"
    string: "#808080"
    nothing: "#808080"
    binary: "#808080"
    cellpath: "#808080"
    row_index: { fg: "#4dca27" attr: "b" }
    record: "#808080"
    list: "#808080"
    block: "#808080"
    hints: "dark_gray"
    search_result: { fg: "#ca274d" bg: "#808080" }

    shape_and: { fg: "#a427ca" attr: "b" }
    shape_binary: { fg: "#a427ca" attr: "b" }
    shape_block: { fg: "#274dca" attr: "b" }
    shape_bool: "#8de9d4"
    shape_custom: "#4dca27"
    shape_datetime: { fg: "#27caa4" attr: "b" }
    shape_directory: "#27caa4"
    shape_external: "#27caa4"
    shape_externalarg: { fg: "#4dca27" attr: "b" }
    shape_filepath: "#27caa4"
    shape_flag: { fg: "#274dca" attr: "b" }
    shape_float: { fg: "#a427ca" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#27caa4" attr: "b" }
    shape_int: { fg: "#a427ca" attr: "b" }
    shape_internalcall: { fg: "#27caa4" attr: "b" }
    shape_list: { fg: "#27caa4" attr: "b" }
    shape_literal: "#274dca"
    shape_match_pattern: "#4dca27"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8de9d4"
    shape_operator: "#caa427"
    shape_or: { fg: "#a427ca" attr: "b" }
    shape_pipe: { fg: "#a427ca" attr: "b" }
    shape_range: { fg: "#caa427" attr: "b" }
    shape_record: { fg: "#27caa4" attr: "b" }
    shape_redirection: { fg: "#a427ca" attr: "b" }
    shape_signature: { fg: "#4dca27" attr: "b" }
    shape_string: "#4dca27"
    shape_string_interpolation: { fg: "#27caa4" attr: "b" }
    shape_table: { fg: "#274dca" attr: "b" }
    shape_variable: "#a427ca"

    background: "#09111a"
    foreground: "#d9e6f2"
    cursor: "#d9e6f2"
}}