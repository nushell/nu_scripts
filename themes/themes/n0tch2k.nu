export def main [] { return {
    separator: "#d0b8a3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#666666" attr: "b" }
    empty: "#657d3e"
    bool: {|| if $in { "#dcdcdc" } else { "light_gray" } }
    int: "#d0b8a3"
    filesize: {|e|
        if $e == 0b {
            "#d0b8a3"
        } else if $e < 1mb {
            "#c9c9c9"
        } else {{ fg: "#657d3e" }}
    }
    duration: "#d0b8a3"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a95551" attr: "b" }
        } else if $in < 6hr {
            "#a95551"
        } else if $in < 1day {
            "#a98051"
        } else if $in < 3day {
            "#666666"
        } else if $in < 1wk {
            { fg: "#666666" attr: "b" }
        } else if $in < 6wk {
            "#c9c9c9"
        } else if $in < 52wk {
            "#657d3e"
        } else { "dark_gray" }
    }
    range: "#d0b8a3"
    float: "#d0b8a3"
    string: "#d0b8a3"
    nothing: "#d0b8a3"
    binary: "#d0b8a3"
    cellpath: "#d0b8a3"
    row_index: { fg: "#666666" attr: "b" }
    record: "#d0b8a3"
    list: "#d0b8a3"
    block: "#d0b8a3"
    hints: "dark_gray"
    search_result: { fg: "#a95551" bg: "#d0b8a3" }

    shape_and: { fg: "#767676" attr: "b" }
    shape_binary: { fg: "#767676" attr: "b" }
    shape_block: { fg: "#657d3e" attr: "b" }
    shape_bool: "#dcdcdc"
    shape_custom: "#666666"
    shape_datetime: { fg: "#c9c9c9" attr: "b" }
    shape_directory: "#c9c9c9"
    shape_external: "#c9c9c9"
    shape_externalarg: { fg: "#666666" attr: "b" }
    shape_filepath: "#c9c9c9"
    shape_flag: { fg: "#657d3e" attr: "b" }
    shape_float: { fg: "#767676" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#c9c9c9" attr: "b" }
    shape_int: { fg: "#767676" attr: "b" }
    shape_internalcall: { fg: "#c9c9c9" attr: "b" }
    shape_list: { fg: "#c9c9c9" attr: "b" }
    shape_literal: "#657d3e"
    shape_match_pattern: "#666666"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#dcdcdc"
    shape_operator: "#a98051"
    shape_or: { fg: "#767676" attr: "b" }
    shape_pipe: { fg: "#767676" attr: "b" }
    shape_range: { fg: "#a98051" attr: "b" }
    shape_record: { fg: "#c9c9c9" attr: "b" }
    shape_redirection: { fg: "#767676" attr: "b" }
    shape_signature: { fg: "#666666" attr: "b" }
    shape_string: "#666666"
    shape_string_interpolation: { fg: "#c9c9c9" attr: "b" }
    shape_table: { fg: "#657d3e" attr: "b" }
    shape_variable: "#767676"

    background: "#222222"
    foreground: "#a0a0a0"
    cursor: "#a0a0a0"
}}