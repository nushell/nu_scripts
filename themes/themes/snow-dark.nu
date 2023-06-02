export def main [] { return {
    separator: "#afb7c0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7f9d77" attr: "b" }
    empty: "#759abd"
    bool: {|| if $in { "#5da19f" } else { "light_gray" } }
    int: "#afb7c0"
    filesize: {|e|
        if $e == 0b {
            "#afb7c0"
        } else if $e < 1mb {
            "#5da19f"
        } else {{ fg: "#759abd" }}
    }
    duration: "#afb7c0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#be868c" attr: "b" }
        } else if $in < 6hr {
            "#be868c"
        } else if $in < 1day {
            "#ab916d"
        } else if $in < 3day {
            "#7f9d77"
        } else if $in < 1wk {
            { fg: "#7f9d77" attr: "b" }
        } else if $in < 6wk {
            "#5da19f"
        } else if $in < 52wk {
            "#759abd"
        } else { "dark_gray" }
    }
    range: "#afb7c0"
    float: "#afb7c0"
    string: "#afb7c0"
    nothing: "#afb7c0"
    binary: "#afb7c0"
    cellpath: "#afb7c0"
    row_index: { fg: "#7f9d77" attr: "b" }
    record: "#afb7c0"
    list: "#afb7c0"
    block: "#afb7c0"
    hints: "dark_gray"
    search_result: { fg: "#be868c" bg: "#afb7c0" }

    shape_and: { fg: "#a88cb3" attr: "b" }
    shape_binary: { fg: "#a88cb3" attr: "b" }
    shape_block: { fg: "#759abd" attr: "b" }
    shape_bool: "#5da19f"
    shape_custom: "#7f9d77"
    shape_datetime: { fg: "#5da19f" attr: "b" }
    shape_directory: "#5da19f"
    shape_external: "#5da19f"
    shape_externalarg: { fg: "#7f9d77" attr: "b" }
    shape_filepath: "#5da19f"
    shape_flag: { fg: "#759abd" attr: "b" }
    shape_float: { fg: "#a88cb3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5da19f" attr: "b" }
    shape_int: { fg: "#a88cb3" attr: "b" }
    shape_internalcall: { fg: "#5da19f" attr: "b" }
    shape_list: { fg: "#5da19f" attr: "b" }
    shape_literal: "#759abd"
    shape_match_pattern: "#7f9d77"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5da19f"
    shape_operator: "#ab916d"
    shape_or: { fg: "#a88cb3" attr: "b" }
    shape_pipe: { fg: "#a88cb3" attr: "b" }
    shape_range: { fg: "#ab916d" attr: "b" }
    shape_record: { fg: "#5da19f" attr: "b" }
    shape_redirection: { fg: "#a88cb3" attr: "b" }
    shape_signature: { fg: "#7f9d77" attr: "b" }
    shape_string: "#7f9d77"
    shape_string_interpolation: { fg: "#5da19f" attr: "b" }
    shape_table: { fg: "#759abd" attr: "b" }
    shape_variable: "#a88cb3"

    background: "#2c2d30"
    foreground: "#afb7c0"
    cursor: "#cbd2d9"
}}