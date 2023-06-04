export def main [] { return {
    separator: "#474747"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#637200" attr: "b" }
    empty: "#0073b5"
    bool: {|| if $in { "#007a72" } else { "light_gray" } }
    int: "#474747"
    filesize: {|e|
        if $e == 0b {
            "#474747"
        } else if $e < 1mb {
            "#007a72"
        } else {{ fg: "#0073b5" }}
    }
    duration: "#474747"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d02023" attr: "b" }
        } else if $in < 6hr {
            "#d02023"
        } else if $in < 1day {
            "#9d6f00"
        } else if $in < 3day {
            "#637200"
        } else if $in < 1wk {
            { fg: "#637200" attr: "b" }
        } else if $in < 6wk {
            "#007a72"
        } else if $in < 52wk {
            "#0073b5"
        } else { "dark_gray" }
    }
    range: "#474747"
    float: "#474747"
    string: "#474747"
    nothing: "#474747"
    binary: "#474747"
    cellpath: "#474747"
    row_index: { fg: "#637200" attr: "b" }
    record: "#474747"
    list: "#474747"
    block: "#474747"
    hints: "dark_gray"
    search_result: { fg: "#d02023" bg: "#474747" }

    shape_and: { fg: "#4e66b6" attr: "b" }
    shape_binary: { fg: "#4e66b6" attr: "b" }
    shape_block: { fg: "#0073b5" attr: "b" }
    shape_bool: "#007a72"
    shape_custom: "#637200"
    shape_datetime: { fg: "#007a72" attr: "b" }
    shape_directory: "#007a72"
    shape_external: "#007a72"
    shape_externalarg: { fg: "#637200" attr: "b" }
    shape_filepath: "#007a72"
    shape_flag: { fg: "#0073b5" attr: "b" }
    shape_float: { fg: "#4e66b6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#007a72" attr: "b" }
    shape_int: { fg: "#4e66b6" attr: "b" }
    shape_internalcall: { fg: "#007a72" attr: "b" }
    shape_list: { fg: "#007a72" attr: "b" }
    shape_literal: "#0073b5"
    shape_match_pattern: "#637200"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#007a72"
    shape_operator: "#9d6f00"
    shape_or: { fg: "#4e66b6" attr: "b" }
    shape_pipe: { fg: "#4e66b6" attr: "b" }
    shape_range: { fg: "#9d6f00" attr: "b" }
    shape_record: { fg: "#007a72" attr: "b" }
    shape_redirection: { fg: "#4e66b6" attr: "b" }
    shape_signature: { fg: "#637200" attr: "b" }
    shape_string: "#637200"
    shape_string_interpolation: { fg: "#007a72" attr: "b" }
    shape_table: { fg: "#0073b5" attr: "b" }
    shape_variable: "#4e66b6"

    background: "#f1f1f1"
    foreground: "#474747"
    cursor: "#474747"
}}