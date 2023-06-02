export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#acc267" attr: "b" }
    empty: "#6fc2ef"
    bool: {|| if $in { "#12cfc0" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
        if $e == 0b {
            "#d0d0d0"
        } else if $e < 1mb {
            "#12cfc0"
        } else {{ fg: "#6fc2ef" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fb9fb1" attr: "b" }
        } else if $in < 6hr {
            "#fb9fb1"
        } else if $in < 1day {
            "#ddb26f"
        } else if $in < 3day {
            "#acc267"
        } else if $in < 1wk {
            { fg: "#acc267" attr: "b" }
        } else if $in < 6wk {
            "#12cfc0"
        } else if $in < 52wk {
            "#6fc2ef"
        } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#acc267" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"
    search_result: { fg: "#fb9fb1" bg: "#d0d0d0" }

    shape_and: { fg: "#e1a3ee" attr: "b" }
    shape_binary: { fg: "#e1a3ee" attr: "b" }
    shape_block: { fg: "#6fc2ef" attr: "b" }
    shape_bool: "#12cfc0"
    shape_custom: "#acc267"
    shape_datetime: { fg: "#12cfc0" attr: "b" }
    shape_directory: "#12cfc0"
    shape_external: "#12cfc0"
    shape_externalarg: { fg: "#acc267" attr: "b" }
    shape_filepath: "#12cfc0"
    shape_flag: { fg: "#6fc2ef" attr: "b" }
    shape_float: { fg: "#e1a3ee" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#12cfc0" attr: "b" }
    shape_int: { fg: "#e1a3ee" attr: "b" }
    shape_internalcall: { fg: "#12cfc0" attr: "b" }
    shape_list: { fg: "#12cfc0" attr: "b" }
    shape_literal: "#6fc2ef"
    shape_match_pattern: "#acc267"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#12cfc0"
    shape_operator: "#ddb26f"
    shape_or: { fg: "#e1a3ee" attr: "b" }
    shape_pipe: { fg: "#e1a3ee" attr: "b" }
    shape_range: { fg: "#ddb26f" attr: "b" }
    shape_record: { fg: "#12cfc0" attr: "b" }
    shape_redirection: { fg: "#e1a3ee" attr: "b" }
    shape_signature: { fg: "#acc267" attr: "b" }
    shape_string: "#acc267"
    shape_string_interpolation: { fg: "#12cfc0" attr: "b" }
    shape_table: { fg: "#6fc2ef" attr: "b" }
    shape_variable: "#e1a3ee"

    background: "#151515"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}