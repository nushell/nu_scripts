export def main [] { return {
    separator: "#f8f8f8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7bb540" attr: "b" }
    empty: "#407bb5"
    bool: {|| if $in { "#73cda0" } else { "light_gray" } }
    int: "#f8f8f8"
    filesize: {|e|
        if $e == 0b {
            "#f8f8f8"
        } else if $e < 1mb {
            "#40b57b"
        } else {{ fg: "#407bb5" }}
    }
    duration: "#f8f8f8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b5407b" attr: "b" }
        } else if $in < 6hr {
            "#b5407b"
        } else if $in < 1day {
            "#b57b40"
        } else if $in < 3day {
            "#7bb540"
        } else if $in < 1wk {
            { fg: "#7bb540" attr: "b" }
        } else if $in < 6wk {
            "#40b57b"
        } else if $in < 52wk {
            "#407bb5"
        } else { "dark_gray" }
    }
    range: "#f8f8f8"
    float: "#f8f8f8"
    string: "#f8f8f8"
    nothing: "#f8f8f8"
    binary: "#f8f8f8"
    cellpath: "#f8f8f8"
    row_index: { fg: "#7bb540" attr: "b" }
    record: "#f8f8f8"
    list: "#f8f8f8"
    block: "#f8f8f8"
    hints: "dark_gray"
    search_result: { fg: "#b5407b" bg: "#f8f8f8" }

    shape_and: { fg: "#7b40b5" attr: "b" }
    shape_binary: { fg: "#7b40b5" attr: "b" }
    shape_block: { fg: "#407bb5" attr: "b" }
    shape_bool: "#73cda0"
    shape_custom: "#7bb540"
    shape_datetime: { fg: "#40b57b" attr: "b" }
    shape_directory: "#40b57b"
    shape_external: "#40b57b"
    shape_externalarg: { fg: "#7bb540" attr: "b" }
    shape_filepath: "#40b57b"
    shape_flag: { fg: "#407bb5" attr: "b" }
    shape_float: { fg: "#7b40b5" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#40b57b" attr: "b" }
    shape_int: { fg: "#7b40b5" attr: "b" }
    shape_internalcall: { fg: "#40b57b" attr: "b" }
    shape_list: { fg: "#40b57b" attr: "b" }
    shape_literal: "#407bb5"
    shape_match_pattern: "#7bb540"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#73cda0"
    shape_operator: "#b57b40"
    shape_or: { fg: "#7b40b5" attr: "b" }
    shape_pipe: { fg: "#7b40b5" attr: "b" }
    shape_range: { fg: "#b57b40" attr: "b" }
    shape_record: { fg: "#40b57b" attr: "b" }
    shape_redirection: { fg: "#7b40b5" attr: "b" }
    shape_signature: { fg: "#7bb540" attr: "b" }
    shape_string: "#7bb540"
    shape_string_interpolation: { fg: "#40b57b" attr: "b" }
    shape_table: { fg: "#407bb5" attr: "b" }
    shape_variable: "#7b40b5"

    background: "#ffffff"
    foreground: "#23476a"
    cursor: "#23476a"
}}