export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#90a57d" attr: "b" }
    empty: "#7fa5bd"
    bool: {|| if $in { "#b1e7dd" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
        if $e == 0b {
            "#d0d0d0"
        } else if $e < 1mb {
            "#8adbb4"
        } else {{ fg: "#7fa5bd" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a36666" attr: "b" }
        } else if $in < 6hr {
            "#a36666"
        } else if $in < 1day {
            "#d7af87"
        } else if $in < 3day {
            "#90a57d"
        } else if $in < 1wk {
            { fg: "#90a57d" attr: "b" }
        } else if $in < 6wk {
            "#8adbb4"
        } else if $in < 52wk {
            "#7fa5bd"
        } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#90a57d" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"
    search_result: { fg: "#a36666" bg: "#d0d0d0" }

    shape_and: { fg: "#c79ec4" attr: "b" }
    shape_binary: { fg: "#c79ec4" attr: "b" }
    shape_block: { fg: "#7fa5bd" attr: "b" }
    shape_bool: "#b1e7dd"
    shape_custom: "#90a57d"
    shape_datetime: { fg: "#8adbb4" attr: "b" }
    shape_directory: "#8adbb4"
    shape_external: "#8adbb4"
    shape_externalarg: { fg: "#90a57d" attr: "b" }
    shape_filepath: "#8adbb4"
    shape_flag: { fg: "#7fa5bd" attr: "b" }
    shape_float: { fg: "#c79ec4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8adbb4" attr: "b" }
    shape_int: { fg: "#c79ec4" attr: "b" }
    shape_internalcall: { fg: "#8adbb4" attr: "b" }
    shape_list: { fg: "#8adbb4" attr: "b" }
    shape_literal: "#7fa5bd"
    shape_match_pattern: "#90a57d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b1e7dd"
    shape_operator: "#d7af87"
    shape_or: { fg: "#c79ec4" attr: "b" }
    shape_pipe: { fg: "#c79ec4" attr: "b" }
    shape_range: { fg: "#d7af87" attr: "b" }
    shape_record: { fg: "#8adbb4" attr: "b" }
    shape_redirection: { fg: "#c79ec4" attr: "b" }
    shape_signature: { fg: "#90a57d" attr: "b" }
    shape_string: "#90a57d"
    shape_string_interpolation: { fg: "#8adbb4" attr: "b" }
    shape_table: { fg: "#7fa5bd" attr: "b" }
    shape_variable: "#c79ec4"

    background: "#1c1c1c"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}