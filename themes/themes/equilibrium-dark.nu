export def main [] { return {
    separator: "#afaba2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7f8b00" attr: "b" }
    empty: "#008dd1"
    bool: {|| if $in { "#00948b" } else { "light_gray" } }
    int: "#afaba2"
    filesize: {|e|
        if $e == 0b {
            "#afaba2"
        } else if $e < 1mb {
            "#00948b"
        } else {{ fg: "#008dd1" }}
    }
    duration: "#afaba2"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f04339" attr: "b" }
        } else if $in < 6hr {
            "#f04339"
        } else if $in < 1day {
            "#bb8801"
        } else if $in < 3day {
            "#7f8b00"
        } else if $in < 1wk {
            { fg: "#7f8b00" attr: "b" }
        } else if $in < 6wk {
            "#00948b"
        } else if $in < 52wk {
            "#008dd1"
        } else { "dark_gray" }
    }
    range: "#afaba2"
    float: "#afaba2"
    string: "#afaba2"
    nothing: "#afaba2"
    binary: "#afaba2"
    cellpath: "#afaba2"
    row_index: { fg: "#7f8b00" attr: "b" }
    record: "#afaba2"
    list: "#afaba2"
    block: "#afaba2"
    hints: "dark_gray"
    search_result: { fg: "#f04339" bg: "#afaba2" }

    shape_and: { fg: "#6a7fd2" attr: "b" }
    shape_binary: { fg: "#6a7fd2" attr: "b" }
    shape_block: { fg: "#008dd1" attr: "b" }
    shape_bool: "#00948b"
    shape_custom: "#7f8b00"
    shape_datetime: { fg: "#00948b" attr: "b" }
    shape_directory: "#00948b"
    shape_external: "#00948b"
    shape_externalarg: { fg: "#7f8b00" attr: "b" }
    shape_filepath: "#00948b"
    shape_flag: { fg: "#008dd1" attr: "b" }
    shape_float: { fg: "#6a7fd2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00948b" attr: "b" }
    shape_int: { fg: "#6a7fd2" attr: "b" }
    shape_internalcall: { fg: "#00948b" attr: "b" }
    shape_list: { fg: "#00948b" attr: "b" }
    shape_literal: "#008dd1"
    shape_match_pattern: "#7f8b00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00948b"
    shape_operator: "#bb8801"
    shape_or: { fg: "#6a7fd2" attr: "b" }
    shape_pipe: { fg: "#6a7fd2" attr: "b" }
    shape_range: { fg: "#bb8801" attr: "b" }
    shape_record: { fg: "#00948b" attr: "b" }
    shape_redirection: { fg: "#6a7fd2" attr: "b" }
    shape_signature: { fg: "#7f8b00" attr: "b" }
    shape_string: "#7f8b00"
    shape_string_interpolation: { fg: "#00948b" attr: "b" }
    shape_table: { fg: "#008dd1" attr: "b" }
    shape_variable: "#6a7fd2"

    background: "#0c1118"
    foreground: "#afaba2"
    cursor: "#afaba2"
}}