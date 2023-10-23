export def main [] { return {
    separator: "#e2cca9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b0b846" attr: "b" }
    empty: "#80aa9e"
    bool: {|| if $in { "#8bba7f" } else { "light_gray" } }
    int: "#e2cca9"
    filesize: {|e|
        if $e == 0b {
            "#e2cca9"
        } else if $e < 1mb {
            "#8bba7f"
        } else {{ fg: "#80aa9e" }}
    }
    duration: "#e2cca9"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f2594b" attr: "b" }
        } else if $in < 6hr {
            "#f2594b"
        } else if $in < 1day {
            "#e9b143"
        } else if $in < 3day {
            "#b0b846"
        } else if $in < 1wk {
            { fg: "#b0b846" attr: "b" }
        } else if $in < 6wk {
            "#8bba7f"
        } else if $in < 52wk {
            "#80aa9e"
        } else { "dark_gray" }
    }
    range: "#e2cca9"
    float: "#e2cca9"
    string: "#e2cca9"
    nothing: "#e2cca9"
    binary: "#e2cca9"
    cellpath: "#e2cca9"
    row_index: { fg: "#b0b846" attr: "b" }
    record: "#e2cca9"
    list: "#e2cca9"
    block: "#e2cca9"
    hints: "dark_gray"
    search_result: { fg: "#f2594b" bg: "#e2cca9" }

    shape_and: { fg: "#d3869b" attr: "b" }
    shape_binary: { fg: "#d3869b" attr: "b" }
    shape_block: { fg: "#80aa9e" attr: "b" }
    shape_bool: "#8bba7f"
    shape_custom: "#b0b846"
    shape_datetime: { fg: "#8bba7f" attr: "b" }
    shape_directory: "#8bba7f"
    shape_external: "#8bba7f"
    shape_externalarg: { fg: "#b0b846" attr: "b" }
    shape_filepath: "#8bba7f"
    shape_flag: { fg: "#80aa9e" attr: "b" }
    shape_float: { fg: "#d3869b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8bba7f" attr: "b" }
    shape_int: { fg: "#d3869b" attr: "b" }
    shape_internalcall: { fg: "#8bba7f" attr: "b" }
    shape_list: { fg: "#8bba7f" attr: "b" }
    shape_literal: "#80aa9e"
    shape_match_pattern: "#b0b846"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8bba7f"
    shape_operator: "#e9b143"
    shape_or: { fg: "#d3869b" attr: "b" }
    shape_pipe: { fg: "#d3869b" attr: "b" }
    shape_range: { fg: "#e9b143" attr: "b" }
    shape_record: { fg: "#8bba7f" attr: "b" }
    shape_redirection: { fg: "#d3869b" attr: "b" }
    shape_signature: { fg: "#b0b846" attr: "b" }
    shape_string: "#b0b846"
    shape_string_interpolation: { fg: "#8bba7f" attr: "b" }
    shape_table: { fg: "#80aa9e" attr: "b" }
    shape_variable: "#d3869b"

    background: "#282828"
    foreground: "#e2cca9"
    cursor: "#e2cca9"
}}