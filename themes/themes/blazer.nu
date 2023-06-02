export def main [] { return {
    separator: "#d9d9d9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7ab87a" attr: "b" }
    empty: "#7a7ab8"
    bool: {|| if $in { "#bddbdb" } else { "light_gray" } }
    int: "#d9d9d9"
    filesize: {|e|
        if $e == 0b {
            "#d9d9d9"
        } else if $e < 1mb {
            "#7ab8b8"
        } else {{ fg: "#7a7ab8" }}
    }
    duration: "#d9d9d9"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b87a7a" attr: "b" }
        } else if $in < 6hr {
            "#b87a7a"
        } else if $in < 1day {
            "#b8b87a"
        } else if $in < 3day {
            "#7ab87a"
        } else if $in < 1wk {
            { fg: "#7ab87a" attr: "b" }
        } else if $in < 6wk {
            "#7ab8b8"
        } else if $in < 52wk {
            "#7a7ab8"
        } else { "dark_gray" }
    }
    range: "#d9d9d9"
    float: "#d9d9d9"
    string: "#d9d9d9"
    nothing: "#d9d9d9"
    binary: "#d9d9d9"
    cellpath: "#d9d9d9"
    row_index: { fg: "#7ab87a" attr: "b" }
    record: "#d9d9d9"
    list: "#d9d9d9"
    block: "#d9d9d9"
    hints: "dark_gray"
    search_result: { fg: "#b87a7a" bg: "#d9d9d9" }

    shape_and: { fg: "#b87ab8" attr: "b" }
    shape_binary: { fg: "#b87ab8" attr: "b" }
    shape_block: { fg: "#7a7ab8" attr: "b" }
    shape_bool: "#bddbdb"
    shape_custom: "#7ab87a"
    shape_datetime: { fg: "#7ab8b8" attr: "b" }
    shape_directory: "#7ab8b8"
    shape_external: "#7ab8b8"
    shape_externalarg: { fg: "#7ab87a" attr: "b" }
    shape_filepath: "#7ab8b8"
    shape_flag: { fg: "#7a7ab8" attr: "b" }
    shape_float: { fg: "#b87ab8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7ab8b8" attr: "b" }
    shape_int: { fg: "#b87ab8" attr: "b" }
    shape_internalcall: { fg: "#7ab8b8" attr: "b" }
    shape_list: { fg: "#7ab8b8" attr: "b" }
    shape_literal: "#7a7ab8"
    shape_match_pattern: "#7ab87a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#bddbdb"
    shape_operator: "#b8b87a"
    shape_or: { fg: "#b87ab8" attr: "b" }
    shape_pipe: { fg: "#b87ab8" attr: "b" }
    shape_range: { fg: "#b8b87a" attr: "b" }
    shape_record: { fg: "#7ab8b8" attr: "b" }
    shape_redirection: { fg: "#b87ab8" attr: "b" }
    shape_signature: { fg: "#7ab87a" attr: "b" }
    shape_string: "#7ab87a"
    shape_string_interpolation: { fg: "#7ab8b8" attr: "b" }
    shape_table: { fg: "#7a7ab8" attr: "b" }
    shape_variable: "#b87ab8"

    background: "#0d1926"
    foreground: "#d9e6f2"
    cursor: "#d9e6f2"
}}