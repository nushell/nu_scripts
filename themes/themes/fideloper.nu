export def main [] { return {
    separator: "#e9e2cd"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#edb7ab" attr: "b" }
    empty: "#2e78c1"
    bool: {|| if $in { "#81908f" } else { "light_gray" } }
    int: "#e9e2cd"
    filesize: {|e|
        if $e == 0b {
            "#e9e2cd"
        } else if $e < 1mb {
            "#309185"
        } else {{ fg: "#2e78c1" }}
    }
    duration: "#e9e2cd"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ca1d2c" attr: "b" }
        } else if $in < 6hr {
            "#ca1d2c"
        } else if $in < 1day {
            "#b7aa9a"
        } else if $in < 3day {
            "#edb7ab"
        } else if $in < 1wk {
            { fg: "#edb7ab" attr: "b" }
        } else if $in < 6wk {
            "#309185"
        } else if $in < 52wk {
            "#2e78c1"
        } else { "dark_gray" }
    }
    range: "#e9e2cd"
    float: "#e9e2cd"
    string: "#e9e2cd"
    nothing: "#e9e2cd"
    binary: "#e9e2cd"
    cellpath: "#e9e2cd"
    row_index: { fg: "#edb7ab" attr: "b" }
    record: "#e9e2cd"
    list: "#e9e2cd"
    block: "#e9e2cd"
    hints: "dark_gray"
    search_result: { fg: "#ca1d2c" bg: "#e9e2cd" }

    shape_and: { fg: "#c0226e" attr: "b" }
    shape_binary: { fg: "#c0226e" attr: "b" }
    shape_block: { fg: "#2e78c1" attr: "b" }
    shape_bool: "#81908f"
    shape_custom: "#edb7ab"
    shape_datetime: { fg: "#309185" attr: "b" }
    shape_directory: "#309185"
    shape_external: "#309185"
    shape_externalarg: { fg: "#edb7ab" attr: "b" }
    shape_filepath: "#309185"
    shape_flag: { fg: "#2e78c1" attr: "b" }
    shape_float: { fg: "#c0226e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#309185" attr: "b" }
    shape_int: { fg: "#c0226e" attr: "b" }
    shape_internalcall: { fg: "#309185" attr: "b" }
    shape_list: { fg: "#309185" attr: "b" }
    shape_literal: "#2e78c1"
    shape_match_pattern: "#edb7ab"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#81908f"
    shape_operator: "#b7aa9a"
    shape_or: { fg: "#c0226e" attr: "b" }
    shape_pipe: { fg: "#c0226e" attr: "b" }
    shape_range: { fg: "#b7aa9a" attr: "b" }
    shape_record: { fg: "#309185" attr: "b" }
    shape_redirection: { fg: "#c0226e" attr: "b" }
    shape_signature: { fg: "#edb7ab" attr: "b" }
    shape_string: "#edb7ab"
    shape_string_interpolation: { fg: "#309185" attr: "b" }
    shape_table: { fg: "#2e78c1" attr: "b" }
    shape_variable: "#c0226e"

    background: "#282f32"
    foreground: "#dad9df"
    cursor: "#d35f5a"
}}