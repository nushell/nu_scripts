export def main [] { return {
    separator: "#373b41"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#198844" attr: "b" }
    empty: "#3971ed"
    bool: {|| if $in { "#3971ed" } else { "light_gray" } }
    int: "#373b41"
    filesize: {|e|
        if $e == 0b {
            "#373b41"
        } else if $e < 1mb {
            "#3971ed"
        } else {{ fg: "#3971ed" }}
    }
    duration: "#373b41"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cc342b" attr: "b" }
        } else if $in < 6hr {
            "#cc342b"
        } else if $in < 1day {
            "#fba922"
        } else if $in < 3day {
            "#198844"
        } else if $in < 1wk {
            { fg: "#198844" attr: "b" }
        } else if $in < 6wk {
            "#3971ed"
        } else if $in < 52wk {
            "#3971ed"
        } else { "dark_gray" }
    }
    range: "#373b41"
    float: "#373b41"
    string: "#373b41"
    nothing: "#373b41"
    binary: "#373b41"
    cellpath: "#373b41"
    row_index: { fg: "#198844" attr: "b" }
    record: "#373b41"
    list: "#373b41"
    block: "#373b41"
    hints: "dark_gray"
    search_result: { fg: "#cc342b" bg: "#373b41" }

    shape_and: { fg: "#a36ac7" attr: "b" }
    shape_binary: { fg: "#a36ac7" attr: "b" }
    shape_block: { fg: "#3971ed" attr: "b" }
    shape_bool: "#3971ed"
    shape_custom: "#198844"
    shape_datetime: { fg: "#3971ed" attr: "b" }
    shape_directory: "#3971ed"
    shape_external: "#3971ed"
    shape_externalarg: { fg: "#198844" attr: "b" }
    shape_filepath: "#3971ed"
    shape_flag: { fg: "#3971ed" attr: "b" }
    shape_float: { fg: "#a36ac7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3971ed" attr: "b" }
    shape_int: { fg: "#a36ac7" attr: "b" }
    shape_internalcall: { fg: "#3971ed" attr: "b" }
    shape_list: { fg: "#3971ed" attr: "b" }
    shape_literal: "#3971ed"
    shape_match_pattern: "#198844"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3971ed"
    shape_operator: "#fba922"
    shape_or: { fg: "#a36ac7" attr: "b" }
    shape_pipe: { fg: "#a36ac7" attr: "b" }
    shape_range: { fg: "#fba922" attr: "b" }
    shape_record: { fg: "#3971ed" attr: "b" }
    shape_redirection: { fg: "#a36ac7" attr: "b" }
    shape_signature: { fg: "#198844" attr: "b" }
    shape_string: "#198844"
    shape_string_interpolation: { fg: "#3971ed" attr: "b" }
    shape_table: { fg: "#3971ed" attr: "b" }
    shape_variable: "#a36ac7"

    background: "#ffffff"
    foreground: "#373b41"
    cursor: "#373b41"
}}