export def main [] { return {
    separator: "#f3e0b8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5d731a" attr: "b" }
    empty: "#1d6da1"
    bool: {|| if $in { "#62caa8" } else { "light_gray" } }
    int: "#f3e0b8"
    filesize: {|e|
        if $e == 0b {
            "#f3e0b8"
        } else if $e < 1mb {
            "#42a38c"
        } else {{ fg: "#1d6da1" }}
    }
    duration: "#f3e0b8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#64002c" attr: "b" }
        } else if $in < 6hr {
            "#64002c"
        } else if $in < 1day {
            "#cd751c"
        } else if $in < 3day {
            "#5d731a"
        } else if $in < 1wk {
            { fg: "#5d731a" attr: "b" }
        } else if $in < 6wk {
            "#42a38c"
        } else if $in < 52wk {
            "#1d6da1"
        } else { "dark_gray" }
    }
    range: "#f3e0b8"
    float: "#f3e0b8"
    string: "#f3e0b8"
    nothing: "#f3e0b8"
    binary: "#f3e0b8"
    cellpath: "#f3e0b8"
    row_index: { fg: "#5d731a" attr: "b" }
    record: "#f3e0b8"
    list: "#f3e0b8"
    block: "#f3e0b8"
    hints: "dark_gray"
    search_result: { fg: "#64002c" bg: "#f3e0b8" }

    shape_and: { fg: "#b7077e" attr: "b" }
    shape_binary: { fg: "#b7077e" attr: "b" }
    shape_block: { fg: "#1d6da1" attr: "b" }
    shape_bool: "#62caa8"
    shape_custom: "#5d731a"
    shape_datetime: { fg: "#42a38c" attr: "b" }
    shape_directory: "#42a38c"
    shape_external: "#42a38c"
    shape_externalarg: { fg: "#5d731a" attr: "b" }
    shape_filepath: "#42a38c"
    shape_flag: { fg: "#1d6da1" attr: "b" }
    shape_float: { fg: "#b7077e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#42a38c" attr: "b" }
    shape_int: { fg: "#b7077e" attr: "b" }
    shape_internalcall: { fg: "#42a38c" attr: "b" }
    shape_list: { fg: "#42a38c" attr: "b" }
    shape_literal: "#1d6da1"
    shape_match_pattern: "#5d731a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#62caa8"
    shape_operator: "#cd751c"
    shape_or: { fg: "#b7077e" attr: "b" }
    shape_pipe: { fg: "#b7077e" attr: "b" }
    shape_range: { fg: "#cd751c" attr: "b" }
    shape_record: { fg: "#42a38c" attr: "b" }
    shape_redirection: { fg: "#b7077e" attr: "b" }
    shape_signature: { fg: "#5d731a" attr: "b" }
    shape_string: "#5d731a"
    shape_string_interpolation: { fg: "#42a38c" attr: "b" }
    shape_table: { fg: "#1d6da1" attr: "b" }
    shape_variable: "#b7077e"

    background: "#0e0c15"
    foreground: "#dbd0b9"
    cursor: "#bbbbbb"
}}