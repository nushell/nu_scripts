export def main [] { return {
    separator: "#e6e6e6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#74ac6d" attr: "b" }
    empty: "#6d74ac"
    bool: {|| if $in { "#b8d6d3" } else { "light_gray" } }
    int: "#e6e6e6"
    filesize: {|e|
        if $e == 0b {
            "#e6e6e6"
        } else if $e < 1mb {
            "#6daca4"
        } else {{ fg: "#6d74ac" }}
    }
    duration: "#e6e6e6"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ac6d74" attr: "b" }
        } else if $in < 6hr {
            "#ac6d74"
        } else if $in < 1day {
            "#aca46d"
        } else if $in < 3day {
            "#74ac6d"
        } else if $in < 1wk {
            { fg: "#74ac6d" attr: "b" }
        } else if $in < 6wk {
            "#6daca4"
        } else if $in < 52wk {
            "#6d74ac"
        } else { "dark_gray" }
    }
    range: "#e6e6e6"
    float: "#e6e6e6"
    string: "#e6e6e6"
    nothing: "#e6e6e6"
    binary: "#e6e6e6"
    cellpath: "#e6e6e6"
    row_index: { fg: "#74ac6d" attr: "b" }
    record: "#e6e6e6"
    list: "#e6e6e6"
    block: "#e6e6e6"
    hints: "dark_gray"
    search_result: { fg: "#ac6d74" bg: "#e6e6e6" }

    shape_and: { fg: "#a46dac" attr: "b" }
    shape_binary: { fg: "#a46dac" attr: "b" }
    shape_block: { fg: "#6d74ac" attr: "b" }
    shape_bool: "#b8d6d3"
    shape_custom: "#74ac6d"
    shape_datetime: { fg: "#6daca4" attr: "b" }
    shape_directory: "#6daca4"
    shape_external: "#6daca4"
    shape_externalarg: { fg: "#74ac6d" attr: "b" }
    shape_filepath: "#6daca4"
    shape_flag: { fg: "#6d74ac" attr: "b" }
    shape_float: { fg: "#a46dac" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#6daca4" attr: "b" }
    shape_int: { fg: "#a46dac" attr: "b" }
    shape_internalcall: { fg: "#6daca4" attr: "b" }
    shape_list: { fg: "#6daca4" attr: "b" }
    shape_literal: "#6d74ac"
    shape_match_pattern: "#74ac6d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b8d6d3"
    shape_operator: "#aca46d"
    shape_or: { fg: "#a46dac" attr: "b" }
    shape_pipe: { fg: "#a46dac" attr: "b" }
    shape_range: { fg: "#aca46d" attr: "b" }
    shape_record: { fg: "#6daca4" attr: "b" }
    shape_redirection: { fg: "#a46dac" attr: "b" }
    shape_signature: { fg: "#74ac6d" attr: "b" }
    shape_string: "#74ac6d"
    shape_string_interpolation: { fg: "#6daca4" attr: "b" }
    shape_table: { fg: "#6d74ac" attr: "b" }
    shape_variable: "#a46dac"

    background: "#09111a"
    foreground: "#d9e6f2"
    cursor: "#d9e6f2"
}}