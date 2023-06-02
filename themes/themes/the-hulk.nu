export def main [] { return {
    separator: "#d8d8d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#13ce2f" attr: "b" }
    empty: "#2424f4"
    bool: {|| if $in { "#3f85a5" } else { "light_gray" } }
    int: "#d8d8d0"
    filesize: {|e|
        if $e == 0b {
            "#d8d8d0"
        } else if $e < 1mb {
            "#378ca9"
        } else {{ fg: "#2424f4" }}
    }
    duration: "#d8d8d0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#259d1a" attr: "b" }
        } else if $in < 6hr {
            "#259d1a"
        } else if $in < 1day {
            "#62e456"
        } else if $in < 3day {
            "#13ce2f"
        } else if $in < 1wk {
            { fg: "#13ce2f" attr: "b" }
        } else if $in < 6wk {
            "#378ca9"
        } else if $in < 52wk {
            "#2424f4"
        } else { "dark_gray" }
    }
    range: "#d8d8d0"
    float: "#d8d8d0"
    string: "#d8d8d0"
    nothing: "#d8d8d0"
    binary: "#d8d8d0"
    cellpath: "#d8d8d0"
    row_index: { fg: "#13ce2f" attr: "b" }
    record: "#d8d8d0"
    list: "#d8d8d0"
    block: "#d8d8d0"
    hints: "dark_gray"
    search_result: { fg: "#259d1a" bg: "#d8d8d0" }

    shape_and: { fg: "#641e73" attr: "b" }
    shape_binary: { fg: "#641e73" attr: "b" }
    shape_block: { fg: "#2424f4" attr: "b" }
    shape_bool: "#3f85a5"
    shape_custom: "#13ce2f"
    shape_datetime: { fg: "#378ca9" attr: "b" }
    shape_directory: "#378ca9"
    shape_external: "#378ca9"
    shape_externalarg: { fg: "#13ce2f" attr: "b" }
    shape_filepath: "#378ca9"
    shape_flag: { fg: "#2424f4" attr: "b" }
    shape_float: { fg: "#641e73" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#378ca9" attr: "b" }
    shape_int: { fg: "#641e73" attr: "b" }
    shape_internalcall: { fg: "#378ca9" attr: "b" }
    shape_list: { fg: "#378ca9" attr: "b" }
    shape_literal: "#2424f4"
    shape_match_pattern: "#13ce2f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3f85a5"
    shape_operator: "#62e456"
    shape_or: { fg: "#641e73" attr: "b" }
    shape_pipe: { fg: "#641e73" attr: "b" }
    shape_range: { fg: "#62e456" attr: "b" }
    shape_record: { fg: "#378ca9" attr: "b" }
    shape_redirection: { fg: "#641e73" attr: "b" }
    shape_signature: { fg: "#13ce2f" attr: "b" }
    shape_string: "#13ce2f"
    shape_string_interpolation: { fg: "#378ca9" attr: "b" }
    shape_table: { fg: "#2424f4" attr: "b" }
    shape_variable: "#641e73"

    background: "#1b1d1e"
    foreground: "#b4b4b4"
    cursor: "#15b61a"
}}