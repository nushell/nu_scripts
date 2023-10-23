export def main [] { return {
    separator: "#d0c8c6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#beb55b" attr: "b" }
    empty: "#8ab3b5"
    bool: {|| if $in { "#7bbda4" } else { "light_gray" } }
    int: "#d0c8c6"
    filesize: {|e|
        if $e == 0b {
            "#d0c8c6"
        } else if $e < 1mb {
            "#7bbda4"
        } else {{ fg: "#8ab3b5" }}
    }
    duration: "#d0c8c6"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cb6077" attr: "b" }
        } else if $in < 6hr {
            "#cb6077"
        } else if $in < 1day {
            "#f4bc87"
        } else if $in < 3day {
            "#beb55b"
        } else if $in < 1wk {
            { fg: "#beb55b" attr: "b" }
        } else if $in < 6wk {
            "#7bbda4"
        } else if $in < 52wk {
            "#8ab3b5"
        } else { "dark_gray" }
    }
    range: "#d0c8c6"
    float: "#d0c8c6"
    string: "#d0c8c6"
    nothing: "#d0c8c6"
    binary: "#d0c8c6"
    cellpath: "#d0c8c6"
    row_index: { fg: "#beb55b" attr: "b" }
    record: "#d0c8c6"
    list: "#d0c8c6"
    block: "#d0c8c6"
    hints: "dark_gray"
    search_result: { fg: "#cb6077" bg: "#d0c8c6" }

    shape_and: { fg: "#a89bb9" attr: "b" }
    shape_binary: { fg: "#a89bb9" attr: "b" }
    shape_block: { fg: "#8ab3b5" attr: "b" }
    shape_bool: "#7bbda4"
    shape_custom: "#beb55b"
    shape_datetime: { fg: "#7bbda4" attr: "b" }
    shape_directory: "#7bbda4"
    shape_external: "#7bbda4"
    shape_externalarg: { fg: "#beb55b" attr: "b" }
    shape_filepath: "#7bbda4"
    shape_flag: { fg: "#8ab3b5" attr: "b" }
    shape_float: { fg: "#a89bb9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7bbda4" attr: "b" }
    shape_int: { fg: "#a89bb9" attr: "b" }
    shape_internalcall: { fg: "#7bbda4" attr: "b" }
    shape_list: { fg: "#7bbda4" attr: "b" }
    shape_literal: "#8ab3b5"
    shape_match_pattern: "#beb55b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7bbda4"
    shape_operator: "#f4bc87"
    shape_or: { fg: "#a89bb9" attr: "b" }
    shape_pipe: { fg: "#a89bb9" attr: "b" }
    shape_range: { fg: "#f4bc87" attr: "b" }
    shape_record: { fg: "#7bbda4" attr: "b" }
    shape_redirection: { fg: "#a89bb9" attr: "b" }
    shape_signature: { fg: "#beb55b" attr: "b" }
    shape_string: "#beb55b"
    shape_string_interpolation: { fg: "#7bbda4" attr: "b" }
    shape_table: { fg: "#8ab3b5" attr: "b" }
    shape_variable: "#a89bb9"

    background: "#3b3228"
    foreground: "#d0c8c6"
    cursor: "#d0c8c6"
}}