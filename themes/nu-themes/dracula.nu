export def main [] { return {
    separator: "#e9e9f4"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ebff87" attr: "b" }
    empty: "#62d6e8"
    bool: {|| if $in { "#a1efe4" } else { "light_gray" } }
    int: "#e9e9f4"
    filesize: {|e|
        if $e == 0b {
            "#e9e9f4"
        } else if $e < 1mb {
            "#a1efe4"
        } else {{ fg: "#62d6e8" }}
    }
    duration: "#e9e9f4"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ea51b2" attr: "b" }
        } else if $in < 6hr {
            "#ea51b2"
        } else if $in < 1day {
            "#00f769"
        } else if $in < 3day {
            "#ebff87"
        } else if $in < 1wk {
            { fg: "#ebff87" attr: "b" }
        } else if $in < 6wk {
            "#a1efe4"
        } else if $in < 52wk {
            "#62d6e8"
        } else { "dark_gray" }
    }
    range: "#e9e9f4"
    float: "#e9e9f4"
    string: "#e9e9f4"
    nothing: "#e9e9f4"
    binary: "#e9e9f4"
    cellpath: "#e9e9f4"
    row_index: { fg: "#ebff87" attr: "b" }
    record: "#e9e9f4"
    list: "#e9e9f4"
    block: "#e9e9f4"
    hints: "dark_gray"
    search_result: { fg: "#ea51b2" bg: "#e9e9f4" }

    shape_and: { fg: "#b45bcf" attr: "b" }
    shape_binary: { fg: "#b45bcf" attr: "b" }
    shape_block: { fg: "#62d6e8" attr: "b" }
    shape_bool: "#a1efe4"
    shape_custom: "#ebff87"
    shape_datetime: { fg: "#a1efe4" attr: "b" }
    shape_directory: "#a1efe4"
    shape_external: "#a1efe4"
    shape_externalarg: { fg: "#ebff87" attr: "b" }
    shape_filepath: "#a1efe4"
    shape_flag: { fg: "#62d6e8" attr: "b" }
    shape_float: { fg: "#b45bcf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#a1efe4" attr: "b" }
    shape_int: { fg: "#b45bcf" attr: "b" }
    shape_internalcall: { fg: "#a1efe4" attr: "b" }
    shape_list: { fg: "#a1efe4" attr: "b" }
    shape_literal: "#62d6e8"
    shape_match_pattern: "#ebff87"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a1efe4"
    shape_operator: "#00f769"
    shape_or: { fg: "#b45bcf" attr: "b" }
    shape_pipe: { fg: "#b45bcf" attr: "b" }
    shape_range: { fg: "#00f769" attr: "b" }
    shape_record: { fg: "#a1efe4" attr: "b" }
    shape_redirection: { fg: "#b45bcf" attr: "b" }
    shape_signature: { fg: "#ebff87" attr: "b" }
    shape_string: "#ebff87"
    shape_string_interpolation: { fg: "#a1efe4" attr: "b" }
    shape_table: { fg: "#62d6e8" attr: "b" }
    shape_variable: "#b45bcf"

    background: "#282936"
    foreground: "#e9e9f4"
    cursor: "#e9e9f4"
}}