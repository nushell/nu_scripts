export def main [] { return {
    separator: "#586e75"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#859900" attr: "b" }
    empty: "#268bd2"
    bool: {|| if $in { "#2aa198" } else { "light_gray" } }
    int: "#586e75"
    filesize: {|e|
        if $e == 0b {
            "#586e75"
        } else if $e < 1mb {
            "#2aa198"
        } else {{ fg: "#268bd2" }}
    }
    duration: "#586e75"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#dc322f" attr: "b" }
        } else if $in < 6hr {
            "#dc322f"
        } else if $in < 1day {
            "#b58900"
        } else if $in < 3day {
            "#859900"
        } else if $in < 1wk {
            { fg: "#859900" attr: "b" }
        } else if $in < 6wk {
            "#2aa198"
        } else if $in < 52wk {
            "#268bd2"
        } else { "dark_gray" }
    }
    range: "#586e75"
    float: "#586e75"
    string: "#586e75"
    nothing: "#586e75"
    binary: "#586e75"
    cellpath: "#586e75"
    row_index: { fg: "#859900" attr: "b" }
    record: "#586e75"
    list: "#586e75"
    block: "#586e75"
    hints: "dark_gray"
    search_result: { fg: "#dc322f" bg: "#586e75" }

    shape_and: { fg: "#6c71c4" attr: "b" }
    shape_binary: { fg: "#6c71c4" attr: "b" }
    shape_block: { fg: "#268bd2" attr: "b" }
    shape_bool: "#2aa198"
    shape_custom: "#859900"
    shape_datetime: { fg: "#2aa198" attr: "b" }
    shape_directory: "#2aa198"
    shape_external: "#2aa198"
    shape_externalarg: { fg: "#859900" attr: "b" }
    shape_filepath: "#2aa198"
    shape_flag: { fg: "#268bd2" attr: "b" }
    shape_float: { fg: "#6c71c4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2aa198" attr: "b" }
    shape_int: { fg: "#6c71c4" attr: "b" }
    shape_internalcall: { fg: "#2aa198" attr: "b" }
    shape_list: { fg: "#2aa198" attr: "b" }
    shape_literal: "#268bd2"
    shape_match_pattern: "#859900"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2aa198"
    shape_operator: "#b58900"
    shape_or: { fg: "#6c71c4" attr: "b" }
    shape_pipe: { fg: "#6c71c4" attr: "b" }
    shape_range: { fg: "#b58900" attr: "b" }
    shape_record: { fg: "#2aa198" attr: "b" }
    shape_redirection: { fg: "#6c71c4" attr: "b" }
    shape_signature: { fg: "#859900" attr: "b" }
    shape_string: "#859900"
    shape_string_interpolation: { fg: "#2aa198" attr: "b" }
    shape_table: { fg: "#268bd2" attr: "b" }
    shape_variable: "#6c71c4"

    background: "#fdf6e3"
    foreground: "#586e75"
    cursor: "#586e75"
}}