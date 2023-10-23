export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#86b200" attr: "b" }
    empty: "#41a6d9"
    bool: {|| if $in { "#7ff0cb" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#4cbe99"
        } else {{ fg: "#41a6d9" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff3333" attr: "b" }
        } else if $in < 6hr {
            "#ff3333"
        } else if $in < 1day {
            "#f19618"
        } else if $in < 3day {
            "#86b200"
        } else if $in < 1wk {
            { fg: "#86b200" attr: "b" }
        } else if $in < 6wk {
            "#4cbe99"
        } else if $in < 52wk {
            "#41a6d9"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#86b200" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#ff3333" bg: "#ffffff" }

    shape_and: { fg: "#f07078" attr: "b" }
    shape_binary: { fg: "#f07078" attr: "b" }
    shape_block: { fg: "#41a6d9" attr: "b" }
    shape_bool: "#7ff0cb"
    shape_custom: "#86b200"
    shape_datetime: { fg: "#4cbe99" attr: "b" }
    shape_directory: "#4cbe99"
    shape_external: "#4cbe99"
    shape_externalarg: { fg: "#86b200" attr: "b" }
    shape_filepath: "#4cbe99"
    shape_flag: { fg: "#41a6d9" attr: "b" }
    shape_float: { fg: "#f07078" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4cbe99" attr: "b" }
    shape_int: { fg: "#f07078" attr: "b" }
    shape_internalcall: { fg: "#4cbe99" attr: "b" }
    shape_list: { fg: "#4cbe99" attr: "b" }
    shape_literal: "#41a6d9"
    shape_match_pattern: "#86b200"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7ff0cb"
    shape_operator: "#f19618"
    shape_or: { fg: "#f07078" attr: "b" }
    shape_pipe: { fg: "#f07078" attr: "b" }
    shape_range: { fg: "#f19618" attr: "b" }
    shape_record: { fg: "#4cbe99" attr: "b" }
    shape_redirection: { fg: "#f07078" attr: "b" }
    shape_signature: { fg: "#86b200" attr: "b" }
    shape_string: "#86b200"
    shape_string_interpolation: { fg: "#4cbe99" attr: "b" }
    shape_table: { fg: "#41a6d9" attr: "b" }
    shape_variable: "#f07078"

    background: "#fafafa"
    foreground: "#5b6673"
    cursor: "#ff6900"
}}