export def main [] { return {
    separator: "#d9d9d9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#909d63" attr: "b" }
    empty: "#6a8799"
    bool: {|| if $in { "#acbbd0" } else { "light_gray" } }
    int: "#d9d9d9"
    filesize: {|e|
        if $e == 0b {
            "#d9d9d9"
        } else if $e < 1mb {
            "#c9dfff"
        } else {{ fg: "#6a8799" }}
    }
    duration: "#d9d9d9"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#bc5653" attr: "b" }
        } else if $in < 6hr {
            "#bc5653"
        } else if $in < 1day {
            "#ebc17a"
        } else if $in < 3day {
            "#909d63"
        } else if $in < 1wk {
            { fg: "#909d63" attr: "b" }
        } else if $in < 6wk {
            "#c9dfff"
        } else if $in < 52wk {
            "#6a8799"
        } else { "dark_gray" }
    }
    range: "#d9d9d9"
    float: "#d9d9d9"
    string: "#d9d9d9"
    nothing: "#d9d9d9"
    binary: "#d9d9d9"
    cellpath: "#d9d9d9"
    row_index: { fg: "#909d63" attr: "b" }
    record: "#d9d9d9"
    list: "#d9d9d9"
    block: "#d9d9d9"
    hints: "dark_gray"
    search_result: { fg: "#bc5653" bg: "#d9d9d9" }

    shape_and: { fg: "#b06698" attr: "b" }
    shape_binary: { fg: "#b06698" attr: "b" }
    shape_block: { fg: "#6a8799" attr: "b" }
    shape_bool: "#acbbd0"
    shape_custom: "#909d63"
    shape_datetime: { fg: "#c9dfff" attr: "b" }
    shape_directory: "#c9dfff"
    shape_external: "#c9dfff"
    shape_externalarg: { fg: "#909d63" attr: "b" }
    shape_filepath: "#c9dfff"
    shape_flag: { fg: "#6a8799" attr: "b" }
    shape_float: { fg: "#b06698" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#c9dfff" attr: "b" }
    shape_int: { fg: "#b06698" attr: "b" }
    shape_internalcall: { fg: "#c9dfff" attr: "b" }
    shape_list: { fg: "#c9dfff" attr: "b" }
    shape_literal: "#6a8799"
    shape_match_pattern: "#909d63"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#acbbd0"
    shape_operator: "#ebc17a"
    shape_or: { fg: "#b06698" attr: "b" }
    shape_pipe: { fg: "#b06698" attr: "b" }
    shape_range: { fg: "#ebc17a" attr: "b" }
    shape_record: { fg: "#c9dfff" attr: "b" }
    shape_redirection: { fg: "#b06698" attr: "b" }
    shape_signature: { fg: "#909d63" attr: "b" }
    shape_string: "#909d63"
    shape_string_interpolation: { fg: "#c9dfff" attr: "b" }
    shape_table: { fg: "#6a8799" attr: "b" }
    shape_variable: "#b06698"

    background: "#353a44"
    foreground: "#d9d9d9"
    cursor: "#d9d9d9"
}}