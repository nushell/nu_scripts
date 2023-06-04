export def main [] { return {
    separator: "#a89984"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#98971a" attr: "b" }
    empty: "#458588"
    bool: {|| if $in { "#8ec07c" } else { "light_gray" } }
    int: "#a89984"
    filesize: {|e|
        if $e == 0b {
            "#a89984"
        } else if $e < 1mb {
            "#689d6a"
        } else {{ fg: "#458588" }}
    }
    duration: "#a89984"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cc241d" attr: "b" }
        } else if $in < 6hr {
            "#cc241d"
        } else if $in < 1day {
            "#d79921"
        } else if $in < 3day {
            "#98971a"
        } else if $in < 1wk {
            { fg: "#98971a" attr: "b" }
        } else if $in < 6wk {
            "#689d6a"
        } else if $in < 52wk {
            "#458588"
        } else { "dark_gray" }
    }
    range: "#a89984"
    float: "#a89984"
    string: "#a89984"
    nothing: "#a89984"
    binary: "#a89984"
    cellpath: "#a89984"
    row_index: { fg: "#98971a" attr: "b" }
    record: "#a89984"
    list: "#a89984"
    block: "#a89984"
    hints: "dark_gray"
    search_result: { fg: "#cc241d" bg: "#a89984" }

    shape_and: { fg: "#b16286" attr: "b" }
    shape_binary: { fg: "#b16286" attr: "b" }
    shape_block: { fg: "#458588" attr: "b" }
    shape_bool: "#8ec07c"
    shape_custom: "#98971a"
    shape_datetime: { fg: "#689d6a" attr: "b" }
    shape_directory: "#689d6a"
    shape_external: "#689d6a"
    shape_externalarg: { fg: "#98971a" attr: "b" }
    shape_filepath: "#689d6a"
    shape_flag: { fg: "#458588" attr: "b" }
    shape_float: { fg: "#b16286" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#689d6a" attr: "b" }
    shape_int: { fg: "#b16286" attr: "b" }
    shape_internalcall: { fg: "#689d6a" attr: "b" }
    shape_list: { fg: "#689d6a" attr: "b" }
    shape_literal: "#458588"
    shape_match_pattern: "#98971a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8ec07c"
    shape_operator: "#d79921"
    shape_or: { fg: "#b16286" attr: "b" }
    shape_pipe: { fg: "#b16286" attr: "b" }
    shape_range: { fg: "#d79921" attr: "b" }
    shape_record: { fg: "#689d6a" attr: "b" }
    shape_redirection: { fg: "#b16286" attr: "b" }
    shape_signature: { fg: "#98971a" attr: "b" }
    shape_string: "#98971a"
    shape_string_interpolation: { fg: "#689d6a" attr: "b" }
    shape_table: { fg: "#458588" attr: "b" }
    shape_variable: "#b16286"

    background: "#282828"
    foreground: "#ebdbb2"
    cursor: "#ebdbb2"
}}