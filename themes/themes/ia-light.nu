export def main [] { return {
    separator: "#181818"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#38781c" attr: "b" }
    empty: "#48bac2"
    bool: {|| if $in { "#2d6bb1" } else { "light_gray" } }
    int: "#181818"
    filesize: {|e|
        if $e == 0b {
            "#181818"
        } else if $e < 1mb {
            "#2d6bb1"
        } else {{ fg: "#48bac2" }}
    }
    duration: "#181818"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#9c5a02" attr: "b" }
        } else if $in < 6hr {
            "#9c5a02"
        } else if $in < 1day {
            "#c48218"
        } else if $in < 3day {
            "#38781c"
        } else if $in < 1wk {
            { fg: "#38781c" attr: "b" }
        } else if $in < 6wk {
            "#2d6bb1"
        } else if $in < 52wk {
            "#48bac2"
        } else { "dark_gray" }
    }
    range: "#181818"
    float: "#181818"
    string: "#181818"
    nothing: "#181818"
    binary: "#181818"
    cellpath: "#181818"
    row_index: { fg: "#38781c" attr: "b" }
    record: "#181818"
    list: "#181818"
    block: "#181818"
    hints: "dark_gray"
    search_result: { fg: "#9c5a02" bg: "#181818" }

    shape_and: { fg: "#a94598" attr: "b" }
    shape_binary: { fg: "#a94598" attr: "b" }
    shape_block: { fg: "#48bac2" attr: "b" }
    shape_bool: "#2d6bb1"
    shape_custom: "#38781c"
    shape_datetime: { fg: "#2d6bb1" attr: "b" }
    shape_directory: "#2d6bb1"
    shape_external: "#2d6bb1"
    shape_externalarg: { fg: "#38781c" attr: "b" }
    shape_filepath: "#2d6bb1"
    shape_flag: { fg: "#48bac2" attr: "b" }
    shape_float: { fg: "#a94598" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2d6bb1" attr: "b" }
    shape_int: { fg: "#a94598" attr: "b" }
    shape_internalcall: { fg: "#2d6bb1" attr: "b" }
    shape_list: { fg: "#2d6bb1" attr: "b" }
    shape_literal: "#48bac2"
    shape_match_pattern: "#38781c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2d6bb1"
    shape_operator: "#c48218"
    shape_or: { fg: "#a94598" attr: "b" }
    shape_pipe: { fg: "#a94598" attr: "b" }
    shape_range: { fg: "#c48218" attr: "b" }
    shape_record: { fg: "#2d6bb1" attr: "b" }
    shape_redirection: { fg: "#a94598" attr: "b" }
    shape_signature: { fg: "#38781c" attr: "b" }
    shape_string: "#38781c"
    shape_string_interpolation: { fg: "#2d6bb1" attr: "b" }
    shape_table: { fg: "#48bac2" attr: "b" }
    shape_variable: "#a94598"

    background: "#f6f6f6"
    foreground: "#181818"
    cursor: "#181818"
}}