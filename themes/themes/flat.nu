export def main [] { return {
    separator: "#e0e0e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#2ecc71" attr: "b" }
    empty: "#3498db"
    bool: {|| if $in { "#1abc9c" } else { "light_gray" } }
    int: "#e0e0e0"
    filesize: {|e|
        if $e == 0b {
            "#e0e0e0"
        } else if $e < 1mb {
            "#1abc9c"
        } else {{ fg: "#3498db" }}
    }
    duration: "#e0e0e0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e74c3c" attr: "b" }
        } else if $in < 6hr {
            "#e74c3c"
        } else if $in < 1day {
            "#f1c40f"
        } else if $in < 3day {
            "#2ecc71"
        } else if $in < 1wk {
            { fg: "#2ecc71" attr: "b" }
        } else if $in < 6wk {
            "#1abc9c"
        } else if $in < 52wk {
            "#3498db"
        } else { "dark_gray" }
    }
    range: "#e0e0e0"
    float: "#e0e0e0"
    string: "#e0e0e0"
    nothing: "#e0e0e0"
    binary: "#e0e0e0"
    cellpath: "#e0e0e0"
    row_index: { fg: "#2ecc71" attr: "b" }
    record: "#e0e0e0"
    list: "#e0e0e0"
    block: "#e0e0e0"
    hints: "dark_gray"
    search_result: { fg: "#e74c3c" bg: "#e0e0e0" }

    shape_and: { fg: "#9b59b6" attr: "b" }
    shape_binary: { fg: "#9b59b6" attr: "b" }
    shape_block: { fg: "#3498db" attr: "b" }
    shape_bool: "#1abc9c"
    shape_custom: "#2ecc71"
    shape_datetime: { fg: "#1abc9c" attr: "b" }
    shape_directory: "#1abc9c"
    shape_external: "#1abc9c"
    shape_externalarg: { fg: "#2ecc71" attr: "b" }
    shape_filepath: "#1abc9c"
    shape_flag: { fg: "#3498db" attr: "b" }
    shape_float: { fg: "#9b59b6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1abc9c" attr: "b" }
    shape_int: { fg: "#9b59b6" attr: "b" }
    shape_internalcall: { fg: "#1abc9c" attr: "b" }
    shape_list: { fg: "#1abc9c" attr: "b" }
    shape_literal: "#3498db"
    shape_match_pattern: "#2ecc71"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1abc9c"
    shape_operator: "#f1c40f"
    shape_or: { fg: "#9b59b6" attr: "b" }
    shape_pipe: { fg: "#9b59b6" attr: "b" }
    shape_range: { fg: "#f1c40f" attr: "b" }
    shape_record: { fg: "#1abc9c" attr: "b" }
    shape_redirection: { fg: "#9b59b6" attr: "b" }
    shape_signature: { fg: "#2ecc71" attr: "b" }
    shape_string: "#2ecc71"
    shape_string_interpolation: { fg: "#1abc9c" attr: "b" }
    shape_table: { fg: "#3498db" attr: "b" }
    shape_variable: "#9b59b6"

    background: "#2c3e50"
    foreground: "#e0e0e0"
    cursor: "#e0e0e0"
}}