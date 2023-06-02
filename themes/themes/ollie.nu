export def main [] { return {
    separator: "#8a8eac"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#31ac61" attr: "b" }
    empty: "#2d57ac"
    bool: {|| if $in { "#1ffaff" } else { "light_gray" } }
    int: "#8a8eac"
    filesize: {|e|
        if $e == 0b {
            "#8a8eac"
        } else if $e < 1mb {
            "#1fa6ac"
        } else {{ fg: "#2d57ac" }}
    }
    duration: "#8a8eac"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ac2e31" attr: "b" }
        } else if $in < 6hr {
            "#ac2e31"
        } else if $in < 1day {
            "#ac4300"
        } else if $in < 3day {
            "#31ac61"
        } else if $in < 1wk {
            { fg: "#31ac61" attr: "b" }
        } else if $in < 6wk {
            "#1fa6ac"
        } else if $in < 52wk {
            "#2d57ac"
        } else { "dark_gray" }
    }
    range: "#8a8eac"
    float: "#8a8eac"
    string: "#8a8eac"
    nothing: "#8a8eac"
    binary: "#8a8eac"
    cellpath: "#8a8eac"
    row_index: { fg: "#31ac61" attr: "b" }
    record: "#8a8eac"
    list: "#8a8eac"
    block: "#8a8eac"
    hints: "dark_gray"
    search_result: { fg: "#ac2e31" bg: "#8a8eac" }

    shape_and: { fg: "#b08528" attr: "b" }
    shape_binary: { fg: "#b08528" attr: "b" }
    shape_block: { fg: "#2d57ac" attr: "b" }
    shape_bool: "#1ffaff"
    shape_custom: "#31ac61"
    shape_datetime: { fg: "#1fa6ac" attr: "b" }
    shape_directory: "#1fa6ac"
    shape_external: "#1fa6ac"
    shape_externalarg: { fg: "#31ac61" attr: "b" }
    shape_filepath: "#1fa6ac"
    shape_flag: { fg: "#2d57ac" attr: "b" }
    shape_float: { fg: "#b08528" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1fa6ac" attr: "b" }
    shape_int: { fg: "#b08528" attr: "b" }
    shape_internalcall: { fg: "#1fa6ac" attr: "b" }
    shape_list: { fg: "#1fa6ac" attr: "b" }
    shape_literal: "#2d57ac"
    shape_match_pattern: "#31ac61"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1ffaff"
    shape_operator: "#ac4300"
    shape_or: { fg: "#b08528" attr: "b" }
    shape_pipe: { fg: "#b08528" attr: "b" }
    shape_range: { fg: "#ac4300" attr: "b" }
    shape_record: { fg: "#1fa6ac" attr: "b" }
    shape_redirection: { fg: "#b08528" attr: "b" }
    shape_signature: { fg: "#31ac61" attr: "b" }
    shape_string: "#31ac61"
    shape_string_interpolation: { fg: "#1fa6ac" attr: "b" }
    shape_table: { fg: "#2d57ac" attr: "b" }
    shape_variable: "#b08528"

    background: "#222125"
    foreground: "#8a8dae"
    cursor: "#8a8dae"
}}