export def main [] { return {
    separator: "#c0c5ce"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a3be8c" attr: "b" }
    empty: "#8fa1b3"
    bool: {|| if $in { "#96b5b4" } else { "light_gray" } }
    int: "#c0c5ce"
    filesize: {|e|
        if $e == 0b {
            "#c0c5ce"
        } else if $e < 1mb {
            "#96b5b4"
        } else {{ fg: "#8fa1b3" }}
    }
    duration: "#c0c5ce"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#bf616a" attr: "b" }
        } else if $in < 6hr {
            "#bf616a"
        } else if $in < 1day {
            "#ebcb8b"
        } else if $in < 3day {
            "#a3be8c"
        } else if $in < 1wk {
            { fg: "#a3be8c" attr: "b" }
        } else if $in < 6wk {
            "#96b5b4"
        } else if $in < 52wk {
            "#8fa1b3"
        } else { "dark_gray" }
    }
    range: "#c0c5ce"
    float: "#c0c5ce"
    string: "#c0c5ce"
    nothing: "#c0c5ce"
    binary: "#c0c5ce"
    cellpath: "#c0c5ce"
    row_index: { fg: "#a3be8c" attr: "b" }
    record: "#c0c5ce"
    list: "#c0c5ce"
    block: "#c0c5ce"
    hints: "dark_gray"
    search_result: { fg: "#bf616a" bg: "#c0c5ce" }

    shape_and: { fg: "#b48ead" attr: "b" }
    shape_binary: { fg: "#b48ead" attr: "b" }
    shape_block: { fg: "#8fa1b3" attr: "b" }
    shape_bool: "#96b5b4"
    shape_custom: "#a3be8c"
    shape_datetime: { fg: "#96b5b4" attr: "b" }
    shape_directory: "#96b5b4"
    shape_external: "#96b5b4"
    shape_externalarg: { fg: "#a3be8c" attr: "b" }
    shape_filepath: "#96b5b4"
    shape_flag: { fg: "#8fa1b3" attr: "b" }
    shape_float: { fg: "#b48ead" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#96b5b4" attr: "b" }
    shape_int: { fg: "#b48ead" attr: "b" }
    shape_internalcall: { fg: "#96b5b4" attr: "b" }
    shape_list: { fg: "#96b5b4" attr: "b" }
    shape_literal: "#8fa1b3"
    shape_match_pattern: "#a3be8c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#96b5b4"
    shape_operator: "#ebcb8b"
    shape_or: { fg: "#b48ead" attr: "b" }
    shape_pipe: { fg: "#b48ead" attr: "b" }
    shape_range: { fg: "#ebcb8b" attr: "b" }
    shape_record: { fg: "#96b5b4" attr: "b" }
    shape_redirection: { fg: "#b48ead" attr: "b" }
    shape_signature: { fg: "#a3be8c" attr: "b" }
    shape_string: "#a3be8c"
    shape_string_interpolation: { fg: "#96b5b4" attr: "b" }
    shape_table: { fg: "#8fa1b3" attr: "b" }
    shape_variable: "#b48ead"

    background: "#2b303b"
    foreground: "#c0c5ce"
    cursor: "#c0c5ce"
}}