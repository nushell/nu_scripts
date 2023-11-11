export def main [] { return {
    separator: "#333333"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#183691" attr: "b" }
    empty: "#795da3"
    bool: {|| if $in { "#183691" } else { "light_gray" } }
    int: "#333333"
    filesize: {|e|
        if $e == 0b {
            "#333333"
        } else if $e < 1mb {
            "#183691"
        } else {{ fg: "#795da3" }}
    }
    duration: "#333333"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ed6a43" attr: "b" }
        } else if $in < 6hr {
            "#ed6a43"
        } else if $in < 1day {
            "#795da3"
        } else if $in < 3day {
            "#183691"
        } else if $in < 1wk {
            { fg: "#183691" attr: "b" }
        } else if $in < 6wk {
            "#183691"
        } else if $in < 52wk {
            "#795da3"
        } else { "dark_gray" }
    }
    range: "#333333"
    float: "#333333"
    string: "#333333"
    nothing: "#333333"
    binary: "#333333"
    cellpath: "#333333"
    row_index: { fg: "#183691" attr: "b" }
    record: "#333333"
    list: "#333333"
    block: "#333333"
    hints: "dark_gray"
    search_result: { fg: "#ed6a43" bg: "#333333" }

    shape_and: { fg: "#a71d5d" attr: "b" }
    shape_binary: { fg: "#a71d5d" attr: "b" }
    shape_block: { fg: "#795da3" attr: "b" }
    shape_bool: "#183691"
    shape_custom: "#183691"
    shape_datetime: { fg: "#183691" attr: "b" }
    shape_directory: "#183691"
    shape_external: "#183691"
    shape_externalarg: { fg: "#183691" attr: "b" }
    shape_filepath: "#183691"
    shape_flag: { fg: "#795da3" attr: "b" }
    shape_float: { fg: "#a71d5d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#183691" attr: "b" }
    shape_int: { fg: "#a71d5d" attr: "b" }
    shape_internalcall: { fg: "#183691" attr: "b" }
    shape_list: { fg: "#183691" attr: "b" }
    shape_literal: "#795da3"
    shape_match_pattern: "#183691"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#183691"
    shape_operator: "#795da3"
    shape_or: { fg: "#a71d5d" attr: "b" }
    shape_pipe: { fg: "#a71d5d" attr: "b" }
    shape_range: { fg: "#795da3" attr: "b" }
    shape_record: { fg: "#183691" attr: "b" }
    shape_redirection: { fg: "#a71d5d" attr: "b" }
    shape_signature: { fg: "#183691" attr: "b" }
    shape_string: "#183691"
    shape_string_interpolation: { fg: "#183691" attr: "b" }
    shape_table: { fg: "#795da3" attr: "b" }
    shape_variable: "#a71d5d"

    background: "#ffffff"
    foreground: "#333333"
    cursor: "#333333"
}}