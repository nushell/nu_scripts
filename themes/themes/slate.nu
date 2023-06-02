export def main [] { return {
    separator: "#02c5e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#81d778" attr: "b" }
    empty: "#264b49"
    bool: {|| if $in { "#8cdfe0" } else { "light_gray" } }
    int: "#02c5e0"
    filesize: {|e|
        if $e == 0b {
            "#02c5e0"
        } else if $e < 1mb {
            "#15ab9c"
        } else {{ fg: "#264b49" }}
    }
    duration: "#02c5e0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e2a8bf" attr: "b" }
        } else if $in < 6hr {
            "#e2a8bf"
        } else if $in < 1day {
            "#c4c9c0"
        } else if $in < 3day {
            "#81d778"
        } else if $in < 1wk {
            { fg: "#81d778" attr: "b" }
        } else if $in < 6wk {
            "#15ab9c"
        } else if $in < 52wk {
            "#264b49"
        } else { "dark_gray" }
    }
    range: "#02c5e0"
    float: "#02c5e0"
    string: "#02c5e0"
    nothing: "#02c5e0"
    binary: "#02c5e0"
    cellpath: "#02c5e0"
    row_index: { fg: "#81d778" attr: "b" }
    record: "#02c5e0"
    list: "#02c5e0"
    block: "#02c5e0"
    hints: "dark_gray"
    search_result: { fg: "#e2a8bf" bg: "#02c5e0" }

    shape_and: { fg: "#a481d3" attr: "b" }
    shape_binary: { fg: "#a481d3" attr: "b" }
    shape_block: { fg: "#264b49" attr: "b" }
    shape_bool: "#8cdfe0"
    shape_custom: "#81d778"
    shape_datetime: { fg: "#15ab9c" attr: "b" }
    shape_directory: "#15ab9c"
    shape_external: "#15ab9c"
    shape_externalarg: { fg: "#81d778" attr: "b" }
    shape_filepath: "#15ab9c"
    shape_flag: { fg: "#264b49" attr: "b" }
    shape_float: { fg: "#a481d3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#15ab9c" attr: "b" }
    shape_int: { fg: "#a481d3" attr: "b" }
    shape_internalcall: { fg: "#15ab9c" attr: "b" }
    shape_list: { fg: "#15ab9c" attr: "b" }
    shape_literal: "#264b49"
    shape_match_pattern: "#81d778"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8cdfe0"
    shape_operator: "#c4c9c0"
    shape_or: { fg: "#a481d3" attr: "b" }
    shape_pipe: { fg: "#a481d3" attr: "b" }
    shape_range: { fg: "#c4c9c0" attr: "b" }
    shape_record: { fg: "#15ab9c" attr: "b" }
    shape_redirection: { fg: "#a481d3" attr: "b" }
    shape_signature: { fg: "#81d778" attr: "b" }
    shape_string: "#81d778"
    shape_string_interpolation: { fg: "#15ab9c" attr: "b" }
    shape_table: { fg: "#264b49" attr: "b" }
    shape_variable: "#a481d3"

    background: "#222222"
    foreground: "#35b1d2"
    cursor: "#35b1d2"
}}