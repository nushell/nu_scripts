export def main [] { return {
    separator: "#80868b"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00e676" attr: "b" }
    empty: "#2196f3"
    bool: {|| if $in { "#00bcd4" } else { "light_gray" } }
    int: "#80868b"
    filesize: {|e|
        if $e == 0b {
            "#80868b"
        } else if $e < 1mb {
            "#00bcd4"
        } else {{ fg: "#2196f3" }}
    }
    duration: "#80868b"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f44336" attr: "b" }
        } else if $in < 6hr {
            "#f44336"
        } else if $in < 1day {
            "#ffeb3b"
        } else if $in < 3day {
            "#00e676"
        } else if $in < 1wk {
            { fg: "#00e676" attr: "b" }
        } else if $in < 6wk {
            "#00bcd4"
        } else if $in < 52wk {
            "#2196f3"
        } else { "dark_gray" }
    }
    range: "#80868b"
    float: "#80868b"
    string: "#80868b"
    nothing: "#80868b"
    binary: "#80868b"
    cellpath: "#80868b"
    row_index: { fg: "#00e676" attr: "b" }
    record: "#80868b"
    list: "#80868b"
    block: "#80868b"
    hints: "dark_gray"
    search_result: { fg: "#f44336" bg: "#80868b" }

    shape_and: { fg: "#673ab7" attr: "b" }
    shape_binary: { fg: "#673ab7" attr: "b" }
    shape_block: { fg: "#2196f3" attr: "b" }
    shape_bool: "#00bcd4"
    shape_custom: "#00e676"
    shape_datetime: { fg: "#00bcd4" attr: "b" }
    shape_directory: "#00bcd4"
    shape_external: "#00bcd4"
    shape_externalarg: { fg: "#00e676" attr: "b" }
    shape_filepath: "#00bcd4"
    shape_flag: { fg: "#2196f3" attr: "b" }
    shape_float: { fg: "#673ab7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00bcd4" attr: "b" }
    shape_int: { fg: "#673ab7" attr: "b" }
    shape_internalcall: { fg: "#00bcd4" attr: "b" }
    shape_list: { fg: "#00bcd4" attr: "b" }
    shape_literal: "#2196f3"
    shape_match_pattern: "#00e676"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00bcd4"
    shape_operator: "#ffeb3b"
    shape_or: { fg: "#673ab7" attr: "b" }
    shape_pipe: { fg: "#673ab7" attr: "b" }
    shape_range: { fg: "#ffeb3b" attr: "b" }
    shape_record: { fg: "#00bcd4" attr: "b" }
    shape_redirection: { fg: "#673ab7" attr: "b" }
    shape_signature: { fg: "#00e676" attr: "b" }
    shape_string: "#00e676"
    shape_string_interpolation: { fg: "#00bcd4" attr: "b" }
    shape_table: { fg: "#2196f3" attr: "b" }
    shape_variable: "#673ab7"

    background: "#202124"
    foreground: "#80868b"
    cursor: "#80868b"
}}