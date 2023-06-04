export def main [] { return {
    separator: "#a4a6a9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6562a8" attr: "b" }
    empty: "#4d6bb6"
    bool: {|| if $in { "#226f68" } else { "light_gray" } }
    int: "#a4a6a9"
    filesize: {|e|
        if $e == 0b {
            "#a4a6a9"
        } else if $e < 1mb {
            "#226f68"
        } else {{ fg: "#4d6bb6" }}
    }
    duration: "#a4a6a9"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#777abc" attr: "b" }
        } else if $in < 6hr {
            "#777abc"
        } else if $in < 1day {
            "#4f9062"
        } else if $in < 3day {
            "#6562a8"
        } else if $in < 1wk {
            { fg: "#6562a8" attr: "b" }
        } else if $in < 6wk {
            "#226f68"
        } else if $in < 52wk {
            "#4d6bb6"
        } else { "dark_gray" }
    }
    range: "#a4a6a9"
    float: "#a4a6a9"
    string: "#a4a6a9"
    nothing: "#a4a6a9"
    binary: "#a4a6a9"
    cellpath: "#a4a6a9"
    row_index: { fg: "#6562a8" attr: "b" }
    record: "#a4a6a9"
    list: "#a4a6a9"
    block: "#a4a6a9"
    hints: "dark_gray"
    search_result: { fg: "#777abc" bg: "#a4a6a9" }

    shape_and: { fg: "#716cae" attr: "b" }
    shape_binary: { fg: "#716cae" attr: "b" }
    shape_block: { fg: "#4d6bb6" attr: "b" }
    shape_bool: "#226f68"
    shape_custom: "#6562a8"
    shape_datetime: { fg: "#226f68" attr: "b" }
    shape_directory: "#226f68"
    shape_external: "#226f68"
    shape_externalarg: { fg: "#6562a8" attr: "b" }
    shape_filepath: "#226f68"
    shape_flag: { fg: "#4d6bb6" attr: "b" }
    shape_float: { fg: "#716cae" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#226f68" attr: "b" }
    shape_int: { fg: "#716cae" attr: "b" }
    shape_internalcall: { fg: "#226f68" attr: "b" }
    shape_list: { fg: "#226f68" attr: "b" }
    shape_literal: "#4d6bb6"
    shape_match_pattern: "#6562a8"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#226f68"
    shape_operator: "#4f9062"
    shape_or: { fg: "#716cae" attr: "b" }
    shape_pipe: { fg: "#716cae" attr: "b" }
    shape_range: { fg: "#4f9062" attr: "b" }
    shape_record: { fg: "#226f68" attr: "b" }
    shape_redirection: { fg: "#716cae" attr: "b" }
    shape_signature: { fg: "#6562a8" attr: "b" }
    shape_string: "#6562a8"
    shape_string_interpolation: { fg: "#226f68" attr: "b" }
    shape_table: { fg: "#4d6bb6" attr: "b" }
    shape_variable: "#716cae"

    background: "#22273b"
    foreground: "#a4a6a9"
    cursor: "#a4a6a9"
}}