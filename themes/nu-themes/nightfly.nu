export def main [] { return {
    separator: "#a1aab8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a1cd5e" attr: "b" }
    empty: "#82aaff"
    bool: {|| if $in { "#7fdbca" } else { "light_gray" } }
    int: "#a1aab8"
    filesize: {|e|
        if $e == 0b {
            "#a1aab8"
        } else if $e < 1mb {
            "#7fdbca"
        } else {{ fg: "#82aaff" }}
    }
    duration: "#a1aab8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fc514e" attr: "b" }
        } else if $in < 6hr {
            "#fc514e"
        } else if $in < 1day {
            "#e7d37a"
        } else if $in < 3day {
            "#a1cd5e"
        } else if $in < 1wk {
            { fg: "#a1cd5e" attr: "b" }
        } else if $in < 6wk {
            "#7fdbca"
        } else if $in < 52wk {
            "#82aaff"
        } else { "dark_gray" }
    }
    range: "#a1aab8"
    float: "#a1aab8"
    string: "#a1aab8"
    nothing: "#a1aab8"
    binary: "#a1aab8"
    cellpath: "#a1aab8"
    row_index: { fg: "#a1cd5e" attr: "b" }
    record: "#a1aab8"
    list: "#a1aab8"
    block: "#a1aab8"
    hints: "dark_gray"
    search_result: { fg: "#fc514e" bg: "#a1aab8" }

    shape_and: { fg: "#c792ea" attr: "b" }
    shape_binary: { fg: "#c792ea" attr: "b" }
    shape_block: { fg: "#82aaff" attr: "b" }
    shape_bool: "#7fdbca"
    shape_custom: "#a1cd5e"
    shape_datetime: { fg: "#7fdbca" attr: "b" }
    shape_directory: "#7fdbca"
    shape_external: "#7fdbca"
    shape_externalarg: { fg: "#a1cd5e" attr: "b" }
    shape_filepath: "#7fdbca"
    shape_flag: { fg: "#82aaff" attr: "b" }
    shape_float: { fg: "#c792ea" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7fdbca" attr: "b" }
    shape_int: { fg: "#c792ea" attr: "b" }
    shape_internalcall: { fg: "#7fdbca" attr: "b" }
    shape_list: { fg: "#7fdbca" attr: "b" }
    shape_literal: "#82aaff"
    shape_match_pattern: "#a1cd5e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7fdbca"
    shape_operator: "#e7d37a"
    shape_or: { fg: "#c792ea" attr: "b" }
    shape_pipe: { fg: "#c792ea" attr: "b" }
    shape_range: { fg: "#e7d37a" attr: "b" }
    shape_record: { fg: "#7fdbca" attr: "b" }
    shape_redirection: { fg: "#c792ea" attr: "b" }
    shape_signature: { fg: "#a1cd5e" attr: "b" }
    shape_string: "#a1cd5e"
    shape_string_interpolation: { fg: "#7fdbca" attr: "b" }
    shape_table: { fg: "#82aaff" attr: "b" }
    shape_variable: "#c792ea"

    background: "#011627"
    foreground: "#c3ccdc"
    cursor: "#82aaff"
}}