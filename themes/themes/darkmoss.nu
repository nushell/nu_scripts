export def main [] { return {
    separator: "#c7c7a5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#499180" attr: "b" }
    empty: "#498091"
    bool: {|| if $in { "#66d9ef" } else { "light_gray" } }
    int: "#c7c7a5"
    filesize: {|e|
        if $e == 0b {
            "#c7c7a5"
        } else if $e < 1mb {
            "#66d9ef"
        } else {{ fg: "#498091" }}
    }
    duration: "#c7c7a5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff4658" attr: "b" }
        } else if $in < 6hr {
            "#ff4658"
        } else if $in < 1day {
            "#fdb11f"
        } else if $in < 3day {
            "#499180"
        } else if $in < 1wk {
            { fg: "#499180" attr: "b" }
        } else if $in < 6wk {
            "#66d9ef"
        } else if $in < 52wk {
            "#498091"
        } else { "dark_gray" }
    }
    range: "#c7c7a5"
    float: "#c7c7a5"
    string: "#c7c7a5"
    nothing: "#c7c7a5"
    binary: "#c7c7a5"
    cellpath: "#c7c7a5"
    row_index: { fg: "#499180" attr: "b" }
    record: "#c7c7a5"
    list: "#c7c7a5"
    block: "#c7c7a5"
    hints: "dark_gray"
    search_result: { fg: "#ff4658" bg: "#c7c7a5" }

    shape_and: { fg: "#9bc0c8" attr: "b" }
    shape_binary: { fg: "#9bc0c8" attr: "b" }
    shape_block: { fg: "#498091" attr: "b" }
    shape_bool: "#66d9ef"
    shape_custom: "#499180"
    shape_datetime: { fg: "#66d9ef" attr: "b" }
    shape_directory: "#66d9ef"
    shape_external: "#66d9ef"
    shape_externalarg: { fg: "#499180" attr: "b" }
    shape_filepath: "#66d9ef"
    shape_flag: { fg: "#498091" attr: "b" }
    shape_float: { fg: "#9bc0c8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#66d9ef" attr: "b" }
    shape_int: { fg: "#9bc0c8" attr: "b" }
    shape_internalcall: { fg: "#66d9ef" attr: "b" }
    shape_list: { fg: "#66d9ef" attr: "b" }
    shape_literal: "#498091"
    shape_match_pattern: "#499180"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#66d9ef"
    shape_operator: "#fdb11f"
    shape_or: { fg: "#9bc0c8" attr: "b" }
    shape_pipe: { fg: "#9bc0c8" attr: "b" }
    shape_range: { fg: "#fdb11f" attr: "b" }
    shape_record: { fg: "#66d9ef" attr: "b" }
    shape_redirection: { fg: "#9bc0c8" attr: "b" }
    shape_signature: { fg: "#499180" attr: "b" }
    shape_string: "#499180"
    shape_string_interpolation: { fg: "#66d9ef" attr: "b" }
    shape_table: { fg: "#498091" attr: "b" }
    shape_variable: "#9bc0c8"

    background: "#171e1f"
    foreground: "#c7c7a5"
    cursor: "#c7c7a5"
}}