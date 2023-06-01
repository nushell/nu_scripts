export def main [] { return {
    separator: "#93a1a1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#859900" attr: "b" }
    empty: "#268bd2"
    bool: {|| if $in { "#2aa198" } else { "light_gray" } }
    int: "#93a1a1"
    filesize: {|e|
        if $e == 0b {
            "#93a1a1"
        } else if $e < 1mb {
            "#2aa198"
        } else {{ fg: "#268bd2" }}
    }
    duration: "#93a1a1"
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
    range: "#93a1a1"
    float: "#93a1a1"
    string: "#93a1a1"
    nothing: "#93a1a1"
    binary: "#93a1a1"
    cellpath: "#93a1a1"
    row_index: { fg: "#859900" attr: "b" }
    record: "#93a1a1"
    list: "#93a1a1"
    block: "#93a1a1"
    hints: "dark_gray"
    search_result: { fg: "#dc322f" bg: "#93a1a1" }

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

    background: "#002b36"
    foreground: "#93a1a1"
    cursor: "#93a1a1"
}}