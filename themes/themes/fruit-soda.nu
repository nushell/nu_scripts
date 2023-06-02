export def main [] { return {
    separator: "#515151"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#47f74c" attr: "b" }
    empty: "#2931df"
    bool: {|| if $in { "#0f9cfd" } else { "light_gray" } }
    int: "#515151"
    filesize: {|e|
        if $e == 0b {
            "#515151"
        } else if $e < 1mb {
            "#0f9cfd"
        } else {{ fg: "#2931df" }}
    }
    duration: "#515151"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fe3e31" attr: "b" }
        } else if $in < 6hr {
            "#fe3e31"
        } else if $in < 1day {
            "#f7e203"
        } else if $in < 3day {
            "#47f74c"
        } else if $in < 1wk {
            { fg: "#47f74c" attr: "b" }
        } else if $in < 6wk {
            "#0f9cfd"
        } else if $in < 52wk {
            "#2931df"
        } else { "dark_gray" }
    }
    range: "#515151"
    float: "#515151"
    string: "#515151"
    nothing: "#515151"
    binary: "#515151"
    cellpath: "#515151"
    row_index: { fg: "#47f74c" attr: "b" }
    record: "#515151"
    list: "#515151"
    block: "#515151"
    hints: "dark_gray"
    search_result: { fg: "#fe3e31" bg: "#515151" }

    shape_and: { fg: "#611fce" attr: "b" }
    shape_binary: { fg: "#611fce" attr: "b" }
    shape_block: { fg: "#2931df" attr: "b" }
    shape_bool: "#0f9cfd"
    shape_custom: "#47f74c"
    shape_datetime: { fg: "#0f9cfd" attr: "b" }
    shape_directory: "#0f9cfd"
    shape_external: "#0f9cfd"
    shape_externalarg: { fg: "#47f74c" attr: "b" }
    shape_filepath: "#0f9cfd"
    shape_flag: { fg: "#2931df" attr: "b" }
    shape_float: { fg: "#611fce" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0f9cfd" attr: "b" }
    shape_int: { fg: "#611fce" attr: "b" }
    shape_internalcall: { fg: "#0f9cfd" attr: "b" }
    shape_list: { fg: "#0f9cfd" attr: "b" }
    shape_literal: "#2931df"
    shape_match_pattern: "#47f74c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#0f9cfd"
    shape_operator: "#f7e203"
    shape_or: { fg: "#611fce" attr: "b" }
    shape_pipe: { fg: "#611fce" attr: "b" }
    shape_range: { fg: "#f7e203" attr: "b" }
    shape_record: { fg: "#0f9cfd" attr: "b" }
    shape_redirection: { fg: "#611fce" attr: "b" }
    shape_signature: { fg: "#47f74c" attr: "b" }
    shape_string: "#47f74c"
    shape_string_interpolation: { fg: "#0f9cfd" attr: "b" }
    shape_table: { fg: "#2931df" attr: "b" }
    shape_variable: "#611fce"

    background: "#f1ecf1"
    foreground: "#515151"
    cursor: "#515151"
}}