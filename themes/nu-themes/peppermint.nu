export def main [] { return {
    separator: "#b3b3b3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#89d287" attr: "b" }
    empty: "#439ecf"
    bool: {|| if $in { "#96dcda" } else { "light_gray" } }
    int: "#b3b3b3"
    filesize: {|e|
        if $e == 0b {
            "#b3b3b3"
        } else if $e < 1mb {
            "#64aaaf"
        } else {{ fg: "#439ecf" }}
    }
    duration: "#b3b3b3"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e64569" attr: "b" }
        } else if $in < 6hr {
            "#e64569"
        } else if $in < 1day {
            "#dab752"
        } else if $in < 3day {
            "#89d287"
        } else if $in < 1wk {
            { fg: "#89d287" attr: "b" }
        } else if $in < 6wk {
            "#64aaaf"
        } else if $in < 52wk {
            "#439ecf"
        } else { "dark_gray" }
    }
    range: "#b3b3b3"
    float: "#b3b3b3"
    string: "#b3b3b3"
    nothing: "#b3b3b3"
    binary: "#b3b3b3"
    cellpath: "#b3b3b3"
    row_index: { fg: "#89d287" attr: "b" }
    record: "#b3b3b3"
    list: "#b3b3b3"
    block: "#b3b3b3"
    hints: "dark_gray"
    search_result: { fg: "#e64569" bg: "#b3b3b3" }

    shape_and: { fg: "#d961dc" attr: "b" }
    shape_binary: { fg: "#d961dc" attr: "b" }
    shape_block: { fg: "#439ecf" attr: "b" }
    shape_bool: "#96dcda"
    shape_custom: "#89d287"
    shape_datetime: { fg: "#64aaaf" attr: "b" }
    shape_directory: "#64aaaf"
    shape_external: "#64aaaf"
    shape_externalarg: { fg: "#89d287" attr: "b" }
    shape_filepath: "#64aaaf"
    shape_flag: { fg: "#439ecf" attr: "b" }
    shape_float: { fg: "#d961dc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#64aaaf" attr: "b" }
    shape_int: { fg: "#d961dc" attr: "b" }
    shape_internalcall: { fg: "#64aaaf" attr: "b" }
    shape_list: { fg: "#64aaaf" attr: "b" }
    shape_literal: "#439ecf"
    shape_match_pattern: "#89d287"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#96dcda"
    shape_operator: "#dab752"
    shape_or: { fg: "#d961dc" attr: "b" }
    shape_pipe: { fg: "#d961dc" attr: "b" }
    shape_range: { fg: "#dab752" attr: "b" }
    shape_record: { fg: "#64aaaf" attr: "b" }
    shape_redirection: { fg: "#d961dc" attr: "b" }
    shape_signature: { fg: "#89d287" attr: "b" }
    shape_string: "#89d287"
    shape_string_interpolation: { fg: "#64aaaf" attr: "b" }
    shape_table: { fg: "#439ecf" attr: "b" }
    shape_variable: "#d961dc"

    background: "#000000"
    foreground: "#c7c7c7"
    cursor: "#bbbbbb"
}}