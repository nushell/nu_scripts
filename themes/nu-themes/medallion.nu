export def main [] { return {
    separator: "#cac29a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7c8b16" attr: "b" }
    empty: "#616bb0"
    bool: {|| if $in { "#ffbc51" } else { "light_gray" } }
    int: "#cac29a"
    filesize: {|e|
        if $e == 0b {
            "#cac29a"
        } else if $e < 1mb {
            "#916c25"
        } else {{ fg: "#616bb0" }}
    }
    duration: "#cac29a"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b64c00" attr: "b" }
        } else if $in < 6hr {
            "#b64c00"
        } else if $in < 1day {
            "#d3bd26"
        } else if $in < 3day {
            "#7c8b16"
        } else if $in < 1wk {
            { fg: "#7c8b16" attr: "b" }
        } else if $in < 6wk {
            "#916c25"
        } else if $in < 52wk {
            "#616bb0"
        } else { "dark_gray" }
    }
    range: "#cac29a"
    float: "#cac29a"
    string: "#cac29a"
    nothing: "#cac29a"
    binary: "#cac29a"
    cellpath: "#cac29a"
    row_index: { fg: "#7c8b16" attr: "b" }
    record: "#cac29a"
    list: "#cac29a"
    block: "#cac29a"
    hints: "dark_gray"
    search_result: { fg: "#b64c00" bg: "#cac29a" }

    shape_and: { fg: "#8c5a90" attr: "b" }
    shape_binary: { fg: "#8c5a90" attr: "b" }
    shape_block: { fg: "#616bb0" attr: "b" }
    shape_bool: "#ffbc51"
    shape_custom: "#7c8b16"
    shape_datetime: { fg: "#916c25" attr: "b" }
    shape_directory: "#916c25"
    shape_external: "#916c25"
    shape_externalarg: { fg: "#7c8b16" attr: "b" }
    shape_filepath: "#916c25"
    shape_flag: { fg: "#616bb0" attr: "b" }
    shape_float: { fg: "#8c5a90" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#916c25" attr: "b" }
    shape_int: { fg: "#8c5a90" attr: "b" }
    shape_internalcall: { fg: "#916c25" attr: "b" }
    shape_list: { fg: "#916c25" attr: "b" }
    shape_literal: "#616bb0"
    shape_match_pattern: "#7c8b16"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ffbc51"
    shape_operator: "#d3bd26"
    shape_or: { fg: "#8c5a90" attr: "b" }
    shape_pipe: { fg: "#8c5a90" attr: "b" }
    shape_range: { fg: "#d3bd26" attr: "b" }
    shape_record: { fg: "#916c25" attr: "b" }
    shape_redirection: { fg: "#8c5a90" attr: "b" }
    shape_signature: { fg: "#7c8b16" attr: "b" }
    shape_string: "#7c8b16"
    shape_string_interpolation: { fg: "#916c25" attr: "b" }
    shape_table: { fg: "#616bb0" attr: "b" }
    shape_variable: "#8c5a90"

    background: "#1d1908"
    foreground: "#cac296"
    cursor: "#cac296"
}}