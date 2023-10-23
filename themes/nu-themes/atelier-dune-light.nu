export def main [] { return {
    separator: "#6e6b5e"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#60ac39" attr: "b" }
    empty: "#6684e1"
    bool: {|| if $in { "#1fad83" } else { "light_gray" } }
    int: "#6e6b5e"
    filesize: {|e|
        if $e == 0b {
            "#6e6b5e"
        } else if $e < 1mb {
            "#1fad83"
        } else {{ fg: "#6684e1" }}
    }
    duration: "#6e6b5e"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d73737" attr: "b" }
        } else if $in < 6hr {
            "#d73737"
        } else if $in < 1day {
            "#ae9513"
        } else if $in < 3day {
            "#60ac39"
        } else if $in < 1wk {
            { fg: "#60ac39" attr: "b" }
        } else if $in < 6wk {
            "#1fad83"
        } else if $in < 52wk {
            "#6684e1"
        } else { "dark_gray" }
    }
    range: "#6e6b5e"
    float: "#6e6b5e"
    string: "#6e6b5e"
    nothing: "#6e6b5e"
    binary: "#6e6b5e"
    cellpath: "#6e6b5e"
    row_index: { fg: "#60ac39" attr: "b" }
    record: "#6e6b5e"
    list: "#6e6b5e"
    block: "#6e6b5e"
    hints: "dark_gray"
    search_result: { fg: "#d73737" bg: "#6e6b5e" }

    shape_and: { fg: "#b854d4" attr: "b" }
    shape_binary: { fg: "#b854d4" attr: "b" }
    shape_block: { fg: "#6684e1" attr: "b" }
    shape_bool: "#1fad83"
    shape_custom: "#60ac39"
    shape_datetime: { fg: "#1fad83" attr: "b" }
    shape_directory: "#1fad83"
    shape_external: "#1fad83"
    shape_externalarg: { fg: "#60ac39" attr: "b" }
    shape_filepath: "#1fad83"
    shape_flag: { fg: "#6684e1" attr: "b" }
    shape_float: { fg: "#b854d4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1fad83" attr: "b" }
    shape_int: { fg: "#b854d4" attr: "b" }
    shape_internalcall: { fg: "#1fad83" attr: "b" }
    shape_list: { fg: "#1fad83" attr: "b" }
    shape_literal: "#6684e1"
    shape_match_pattern: "#60ac39"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1fad83"
    shape_operator: "#ae9513"
    shape_or: { fg: "#b854d4" attr: "b" }
    shape_pipe: { fg: "#b854d4" attr: "b" }
    shape_range: { fg: "#ae9513" attr: "b" }
    shape_record: { fg: "#1fad83" attr: "b" }
    shape_redirection: { fg: "#b854d4" attr: "b" }
    shape_signature: { fg: "#60ac39" attr: "b" }
    shape_string: "#60ac39"
    shape_string_interpolation: { fg: "#1fad83" attr: "b" }
    shape_table: { fg: "#6684e1" attr: "b" }
    shape_variable: "#b854d4"

    background: "#fefbec"
    foreground: "#6e6b5e"
    cursor: "#6e6b5e"
}}