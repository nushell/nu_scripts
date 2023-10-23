export def main [] { return {
    separator: "#e6e1dc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a5c261" attr: "b" }
    empty: "#6d9cbe"
    bool: {|| if $in { "#519f50" } else { "light_gray" } }
    int: "#e6e1dc"
    filesize: {|e|
        if $e == 0b {
            "#e6e1dc"
        } else if $e < 1mb {
            "#519f50"
        } else {{ fg: "#6d9cbe" }}
    }
    duration: "#e6e1dc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#da4939" attr: "b" }
        } else if $in < 6hr {
            "#da4939"
        } else if $in < 1day {
            "#ffc66d"
        } else if $in < 3day {
            "#a5c261"
        } else if $in < 1wk {
            { fg: "#a5c261" attr: "b" }
        } else if $in < 6wk {
            "#519f50"
        } else if $in < 52wk {
            "#6d9cbe"
        } else { "dark_gray" }
    }
    range: "#e6e1dc"
    float: "#e6e1dc"
    string: "#e6e1dc"
    nothing: "#e6e1dc"
    binary: "#e6e1dc"
    cellpath: "#e6e1dc"
    row_index: { fg: "#a5c261" attr: "b" }
    record: "#e6e1dc"
    list: "#e6e1dc"
    block: "#e6e1dc"
    hints: "dark_gray"
    search_result: { fg: "#da4939" bg: "#e6e1dc" }

    shape_and: { fg: "#b6b3eb" attr: "b" }
    shape_binary: { fg: "#b6b3eb" attr: "b" }
    shape_block: { fg: "#6d9cbe" attr: "b" }
    shape_bool: "#519f50"
    shape_custom: "#a5c261"
    shape_datetime: { fg: "#519f50" attr: "b" }
    shape_directory: "#519f50"
    shape_external: "#519f50"
    shape_externalarg: { fg: "#a5c261" attr: "b" }
    shape_filepath: "#519f50"
    shape_flag: { fg: "#6d9cbe" attr: "b" }
    shape_float: { fg: "#b6b3eb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#519f50" attr: "b" }
    shape_int: { fg: "#b6b3eb" attr: "b" }
    shape_internalcall: { fg: "#519f50" attr: "b" }
    shape_list: { fg: "#519f50" attr: "b" }
    shape_literal: "#6d9cbe"
    shape_match_pattern: "#a5c261"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#519f50"
    shape_operator: "#ffc66d"
    shape_or: { fg: "#b6b3eb" attr: "b" }
    shape_pipe: { fg: "#b6b3eb" attr: "b" }
    shape_range: { fg: "#ffc66d" attr: "b" }
    shape_record: { fg: "#519f50" attr: "b" }
    shape_redirection: { fg: "#b6b3eb" attr: "b" }
    shape_signature: { fg: "#a5c261" attr: "b" }
    shape_string: "#a5c261"
    shape_string_interpolation: { fg: "#519f50" attr: "b" }
    shape_table: { fg: "#6d9cbe" attr: "b" }
    shape_variable: "#b6b3eb"

    background: "#2b2b2b"
    foreground: "#e6e1dc"
    cursor: "#e6e1dc"
}}