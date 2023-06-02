export def main [] { return {
    separator: "#adadad"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#565747" attr: "b" }
    empty: "#2c70b7"
    bool: {|| if $in { "#4fbce6" } else { "light_gray" } }
    int: "#adadad"
    filesize: {|e|
        if $e == 0b {
            "#adadad"
        } else if $e < 1mb {
            "#3ca1a6"
        } else {{ fg: "#2c70b7" }}
    }
    duration: "#adadad"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f8511b" attr: "b" }
        } else if $in < 6hr {
            "#f8511b"
        } else if $in < 1day {
            "#fa771d"
        } else if $in < 3day {
            "#565747"
        } else if $in < 1wk {
            { fg: "#565747" attr: "b" }
        } else if $in < 6wk {
            "#3ca1a6"
        } else if $in < 52wk {
            "#2c70b7"
        } else { "dark_gray" }
    }
    range: "#adadad"
    float: "#adadad"
    string: "#adadad"
    nothing: "#adadad"
    binary: "#adadad"
    cellpath: "#adadad"
    row_index: { fg: "#565747" attr: "b" }
    record: "#adadad"
    list: "#adadad"
    block: "#adadad"
    hints: "dark_gray"
    search_result: { fg: "#f8511b" bg: "#adadad" }

    shape_and: { fg: "#f02e4f" attr: "b" }
    shape_binary: { fg: "#f02e4f" attr: "b" }
    shape_block: { fg: "#2c70b7" attr: "b" }
    shape_bool: "#4fbce6"
    shape_custom: "#565747"
    shape_datetime: { fg: "#3ca1a6" attr: "b" }
    shape_directory: "#3ca1a6"
    shape_external: "#3ca1a6"
    shape_externalarg: { fg: "#565747" attr: "b" }
    shape_filepath: "#3ca1a6"
    shape_flag: { fg: "#2c70b7" attr: "b" }
    shape_float: { fg: "#f02e4f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3ca1a6" attr: "b" }
    shape_int: { fg: "#f02e4f" attr: "b" }
    shape_internalcall: { fg: "#3ca1a6" attr: "b" }
    shape_list: { fg: "#3ca1a6" attr: "b" }
    shape_literal: "#2c70b7"
    shape_match_pattern: "#565747"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4fbce6"
    shape_operator: "#fa771d"
    shape_or: { fg: "#f02e4f" attr: "b" }
    shape_pipe: { fg: "#f02e4f" attr: "b" }
    shape_range: { fg: "#fa771d" attr: "b" }
    shape_record: { fg: "#3ca1a6" attr: "b" }
    shape_redirection: { fg: "#f02e4f" attr: "b" }
    shape_signature: { fg: "#565747" attr: "b" }
    shape_string: "#565747"
    shape_string_interpolation: { fg: "#3ca1a6" attr: "b" }
    shape_table: { fg: "#2c70b7" attr: "b" }
    shape_variable: "#f02e4f"

    background: "#1b1c1d"
    foreground: "#adadad"
    cursor: "#adadad"
}}