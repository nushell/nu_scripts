export def main [] { return {
    separator: "#b8bbc2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#99bf52" attr: "b" }
    empty: "#5299bf"
    bool: {|| if $in { "#72b9bf" } else { "light_gray" } }
    int: "#b8bbc2"
    filesize: {|e|
        if $e == 0b {
            "#b8bbc2"
        } else if $e < 1mb {
            "#72b9bf"
        } else {{ fg: "#5299bf" }}
    }
    duration: "#b8bbc2"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d07346" attr: "b" }
        } else if $in < 6hr {
            "#d07346"
        } else if $in < 1day {
            "#fbd461"
        } else if $in < 3day {
            "#99bf52"
        } else if $in < 1wk {
            { fg: "#99bf52" attr: "b" }
        } else if $in < 6wk {
            "#72b9bf"
        } else if $in < 52wk {
            "#5299bf"
        } else { "dark_gray" }
    }
    range: "#b8bbc2"
    float: "#b8bbc2"
    string: "#b8bbc2"
    nothing: "#b8bbc2"
    binary: "#b8bbc2"
    cellpath: "#b8bbc2"
    row_index: { fg: "#99bf52" attr: "b" }
    record: "#b8bbc2"
    list: "#b8bbc2"
    block: "#b8bbc2"
    hints: "dark_gray"
    search_result: { fg: "#d07346" bg: "#b8bbc2" }

    shape_and: { fg: "#9989cc" attr: "b" }
    shape_binary: { fg: "#9989cc" attr: "b" }
    shape_block: { fg: "#5299bf" attr: "b" }
    shape_bool: "#72b9bf"
    shape_custom: "#99bf52"
    shape_datetime: { fg: "#72b9bf" attr: "b" }
    shape_directory: "#72b9bf"
    shape_external: "#72b9bf"
    shape_externalarg: { fg: "#99bf52" attr: "b" }
    shape_filepath: "#72b9bf"
    shape_flag: { fg: "#5299bf" attr: "b" }
    shape_float: { fg: "#9989cc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#72b9bf" attr: "b" }
    shape_int: { fg: "#9989cc" attr: "b" }
    shape_internalcall: { fg: "#72b9bf" attr: "b" }
    shape_list: { fg: "#72b9bf" attr: "b" }
    shape_literal: "#5299bf"
    shape_match_pattern: "#99bf52"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#72b9bf"
    shape_operator: "#fbd461"
    shape_or: { fg: "#9989cc" attr: "b" }
    shape_pipe: { fg: "#9989cc" attr: "b" }
    shape_range: { fg: "#fbd461" attr: "b" }
    shape_record: { fg: "#72b9bf" attr: "b" }
    shape_redirection: { fg: "#9989cc" attr: "b" }
    shape_signature: { fg: "#99bf52" attr: "b" }
    shape_string: "#99bf52"
    shape_string_interpolation: { fg: "#72b9bf" attr: "b" }
    shape_table: { fg: "#5299bf" attr: "b" }
    shape_variable: "#9989cc"

    background: "#061229"
    foreground: "#b8bbc2"
    cursor: "#b8bbc2"
}}