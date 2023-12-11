export def main [] { return {
    separator: "#000000"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#730073" attr: "b" }
    empty: "#007300"
    bool: {|| if $in { "#755b00" } else { "light_gray" } }
    int: "#000000"
    filesize: {|e|
        if $e == 0b {
            "#000000"
        } else if $e < 1mb {
            "#755b00"
        } else {{ fg: "#007300" }}
    }
    duration: "#000000"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#840000" attr: "b" }
        } else if $in < 6hr {
            "#840000"
        } else if $in < 1day {
            "#755b00"
        } else if $in < 3day {
            "#730073"
        } else if $in < 1wk {
            { fg: "#730073" attr: "b" }
        } else if $in < 6wk {
            "#755b00"
        } else if $in < 52wk {
            "#007300"
        } else { "dark_gray" }
    }
    range: "#000000"
    float: "#000000"
    string: "#000000"
    nothing: "#000000"
    binary: "#000000"
    cellpath: "#000000"
    row_index: { fg: "#730073" attr: "b" }
    record: "#000000"
    list: "#000000"
    block: "#000000"
    hints: "dark_gray"
    search_result: { fg: "#840000" bg: "#000000" }

    shape_and: { fg: "#000090" attr: "b" }
    shape_binary: { fg: "#000090" attr: "b" }
    shape_block: { fg: "#007300" attr: "b" }
    shape_bool: "#755b00"
    shape_custom: "#730073"
    shape_datetime: { fg: "#755b00" attr: "b" }
    shape_directory: "#755b00"
    shape_external: "#755b00"
    shape_externalarg: { fg: "#730073" attr: "b" }
    shape_filepath: "#755b00"
    shape_flag: { fg: "#007300" attr: "b" }
    shape_float: { fg: "#000090" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#755b00" attr: "b" }
    shape_int: { fg: "#000090" attr: "b" }
    shape_internalcall: { fg: "#755b00" attr: "b" }
    shape_list: { fg: "#755b00" attr: "b" }
    shape_literal: "#007300"
    shape_match_pattern: "#730073"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#755b00"
    shape_operator: "#755b00"
    shape_or: { fg: "#000090" attr: "b" }
    shape_pipe: { fg: "#000090" attr: "b" }
    shape_range: { fg: "#755b00" attr: "b" }
    shape_record: { fg: "#755b00" attr: "b" }
    shape_redirection: { fg: "#000090" attr: "b" }
    shape_signature: { fg: "#730073" attr: "b" }
    shape_string: "#730073"
    shape_string_interpolation: { fg: "#755b00" attr: "b" }
    shape_table: { fg: "#007300" attr: "b" }
    shape_variable: "#000090"

    background: "#e0e0e0"
    foreground: "#000000"
    cursor: "#000000"
}}