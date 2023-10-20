export def main [] { return {
    separator: "#909294"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#49a61d" attr: "b" }
    empty: "#798fd7"
    bool: {|| if $in { "#1ba2a0" } else { "light_gray" } }
    int: "#909294"
    filesize: {|e|
        if $e == 0b {
            "#909294"
        } else if $e < 1mb {
            "#4fa090"
        } else {{ fg: "#798fd7" }}
    }
    duration: "#909294"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#eb6a58" attr: "b" }
        } else if $in < 6hr {
            "#eb6a58"
        } else if $in < 1day {
            "#959721"
        } else if $in < 3day {
            "#49a61d"
        } else if $in < 1wk {
            { fg: "#49a61d" attr: "b" }
        } else if $in < 6wk {
            "#4fa090"
        } else if $in < 52wk {
            "#798fd7"
        } else { "dark_gray" }
    }
    range: "#909294"
    float: "#909294"
    string: "#909294"
    nothing: "#909294"
    binary: "#909294"
    cellpath: "#909294"
    row_index: { fg: "#49a61d" attr: "b" }
    record: "#909294"
    list: "#909294"
    block: "#909294"
    hints: "dark_gray"
    search_result: { fg: "#eb6a58" bg: "#909294" }

    shape_and: { fg: "#cd7b7e" attr: "b" }
    shape_binary: { fg: "#cd7b7e" attr: "b" }
    shape_block: { fg: "#798fd7" attr: "b" }
    shape_bool: "#1ba2a0"
    shape_custom: "#49a61d"
    shape_datetime: { fg: "#4fa090" attr: "b" }
    shape_directory: "#4fa090"
    shape_external: "#4fa090"
    shape_externalarg: { fg: "#49a61d" attr: "b" }
    shape_filepath: "#4fa090"
    shape_flag: { fg: "#798fd7" attr: "b" }
    shape_float: { fg: "#cd7b7e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4fa090" attr: "b" }
    shape_int: { fg: "#cd7b7e" attr: "b" }
    shape_internalcall: { fg: "#4fa090" attr: "b" }
    shape_list: { fg: "#4fa090" attr: "b" }
    shape_literal: "#798fd7"
    shape_match_pattern: "#49a61d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1ba2a0"
    shape_operator: "#959721"
    shape_or: { fg: "#cd7b7e" attr: "b" }
    shape_pipe: { fg: "#cd7b7e" attr: "b" }
    shape_range: { fg: "#959721" attr: "b" }
    shape_record: { fg: "#4fa090" attr: "b" }
    shape_redirection: { fg: "#cd7b7e" attr: "b" }
    shape_signature: { fg: "#49a61d" attr: "b" }
    shape_string: "#49a61d"
    shape_string_interpolation: { fg: "#4fa090" attr: "b" }
    shape_table: { fg: "#798fd7" attr: "b" }
    shape_variable: "#cd7b7e"

    background: "#202427"
    foreground: "#8da3b8"
    cursor: "#8da3b8"
}}