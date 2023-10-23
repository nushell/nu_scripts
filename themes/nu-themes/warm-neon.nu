export def main [] { return {
    separator: "#d0b8a3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#39b13a" attr: "b" }
    empty: "#4261c5"
    bool: {|| if $in { "#5ed1e5" } else { "light_gray" } }
    int: "#d0b8a3"
    filesize: {|e|
        if $e == 0b {
            "#d0b8a3"
        } else if $e < 1mb {
            "#2abbd4"
        } else {{ fg: "#4261c5" }}
    }
    duration: "#d0b8a3"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e24346" attr: "b" }
        } else if $in < 6hr {
            "#e24346"
        } else if $in < 1day {
            "#dae145"
        } else if $in < 3day {
            "#39b13a"
        } else if $in < 1wk {
            { fg: "#39b13a" attr: "b" }
        } else if $in < 6wk {
            "#2abbd4"
        } else if $in < 52wk {
            "#4261c5"
        } else { "dark_gray" }
    }
    range: "#d0b8a3"
    float: "#d0b8a3"
    string: "#d0b8a3"
    nothing: "#d0b8a3"
    binary: "#d0b8a3"
    cellpath: "#d0b8a3"
    row_index: { fg: "#39b13a" attr: "b" }
    record: "#d0b8a3"
    list: "#d0b8a3"
    block: "#d0b8a3"
    hints: "dark_gray"
    search_result: { fg: "#e24346" bg: "#d0b8a3" }

    shape_and: { fg: "#f920fb" attr: "b" }
    shape_binary: { fg: "#f920fb" attr: "b" }
    shape_block: { fg: "#4261c5" attr: "b" }
    shape_bool: "#5ed1e5"
    shape_custom: "#39b13a"
    shape_datetime: { fg: "#2abbd4" attr: "b" }
    shape_directory: "#2abbd4"
    shape_external: "#2abbd4"
    shape_externalarg: { fg: "#39b13a" attr: "b" }
    shape_filepath: "#2abbd4"
    shape_flag: { fg: "#4261c5" attr: "b" }
    shape_float: { fg: "#f920fb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2abbd4" attr: "b" }
    shape_int: { fg: "#f920fb" attr: "b" }
    shape_internalcall: { fg: "#2abbd4" attr: "b" }
    shape_list: { fg: "#2abbd4" attr: "b" }
    shape_literal: "#4261c5"
    shape_match_pattern: "#39b13a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5ed1e5"
    shape_operator: "#dae145"
    shape_or: { fg: "#f920fb" attr: "b" }
    shape_pipe: { fg: "#f920fb" attr: "b" }
    shape_range: { fg: "#dae145" attr: "b" }
    shape_record: { fg: "#2abbd4" attr: "b" }
    shape_redirection: { fg: "#f920fb" attr: "b" }
    shape_signature: { fg: "#39b13a" attr: "b" }
    shape_string: "#39b13a"
    shape_string_interpolation: { fg: "#2abbd4" attr: "b" }
    shape_table: { fg: "#4261c5" attr: "b" }
    shape_variable: "#f920fb"

    background: "#404040"
    foreground: "#afdab6"
    cursor: "#afdab6"
}}