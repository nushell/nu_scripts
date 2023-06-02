export def main [] { return {
    separator: "#403c3d"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#94e1b0" attr: "b" }
    empty: "#da103f"
    bool: {|| if $in { "#dc3318" } else { "light_gray" } }
    int: "#403c3d"
    filesize: {|e|
        if $e == 0b {
            "#403c3d"
        } else if $e < 1mb {
            "#dc3318"
        } else {{ fg: "#da103f" }}
    }
    duration: "#403c3d"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f7939b" attr: "b" }
        } else if $in < 6hr {
            "#f7939b"
        } else if $in < 1day {
            "#fbe0d9"
        } else if $in < 3day {
            "#94e1b0"
        } else if $in < 1wk {
            { fg: "#94e1b0" attr: "b" }
        } else if $in < 6wk {
            "#dc3318"
        } else if $in < 52wk {
            "#da103f"
        } else { "dark_gray" }
    }
    range: "#403c3d"
    float: "#403c3d"
    string: "#403c3d"
    nothing: "#403c3d"
    binary: "#403c3d"
    cellpath: "#403c3d"
    row_index: { fg: "#94e1b0" attr: "b" }
    record: "#403c3d"
    list: "#403c3d"
    block: "#403c3d"
    hints: "dark_gray"
    search_result: { fg: "#f7939b" bg: "#403c3d" }

    shape_and: { fg: "#1d8991" attr: "b" }
    shape_binary: { fg: "#1d8991" attr: "b" }
    shape_block: { fg: "#da103f" attr: "b" }
    shape_bool: "#dc3318"
    shape_custom: "#94e1b0"
    shape_datetime: { fg: "#dc3318" attr: "b" }
    shape_directory: "#dc3318"
    shape_external: "#dc3318"
    shape_externalarg: { fg: "#94e1b0" attr: "b" }
    shape_filepath: "#dc3318"
    shape_flag: { fg: "#da103f" attr: "b" }
    shape_float: { fg: "#1d8991" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#dc3318" attr: "b" }
    shape_int: { fg: "#1d8991" attr: "b" }
    shape_internalcall: { fg: "#dc3318" attr: "b" }
    shape_list: { fg: "#dc3318" attr: "b" }
    shape_literal: "#da103f"
    shape_match_pattern: "#94e1b0"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#dc3318"
    shape_operator: "#fbe0d9"
    shape_or: { fg: "#1d8991" attr: "b" }
    shape_pipe: { fg: "#1d8991" attr: "b" }
    shape_range: { fg: "#fbe0d9" attr: "b" }
    shape_record: { fg: "#dc3318" attr: "b" }
    shape_redirection: { fg: "#1d8991" attr: "b" }
    shape_signature: { fg: "#94e1b0" attr: "b" }
    shape_string: "#94e1b0"
    shape_string_interpolation: { fg: "#dc3318" attr: "b" }
    shape_table: { fg: "#da103f" attr: "b" }
    shape_variable: "#1d8991"

    background: "#fdf0ed"
    foreground: "#403c3d"
    cursor: "#403c3d"
}}