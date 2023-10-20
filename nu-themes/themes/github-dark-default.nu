export def main [] { return {
    separator: "#b1bac4"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#3fb950" attr: "b" }
    empty: "#58a6ff"
    bool: {|| if $in { "#56d4dd" } else { "light_gray" } }
    int: "#b1bac4"
    filesize: {|e|
        if $e == 0b {
            "#b1bac4"
        } else if $e < 1mb {
            "#39c5cf"
        } else {{ fg: "#58a6ff" }}
    }
    duration: "#b1bac4"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff7b72" attr: "b" }
        } else if $in < 6hr {
            "#ff7b72"
        } else if $in < 1day {
            "#d29922"
        } else if $in < 3day {
            "#3fb950"
        } else if $in < 1wk {
            { fg: "#3fb950" attr: "b" }
        } else if $in < 6wk {
            "#39c5cf"
        } else if $in < 52wk {
            "#58a6ff"
        } else { "dark_gray" }
    }
    range: "#b1bac4"
    float: "#b1bac4"
    string: "#b1bac4"
    nothing: "#b1bac4"
    binary: "#b1bac4"
    cellpath: "#b1bac4"
    row_index: { fg: "#3fb950" attr: "b" }
    record: "#b1bac4"
    list: "#b1bac4"
    block: "#b1bac4"
    hints: "dark_gray"
    search_result: { fg: "#ff7b72" bg: "#b1bac4" }

    shape_and: { fg: "#bc8cff" attr: "b" }
    shape_binary: { fg: "#bc8cff" attr: "b" }
    shape_block: { fg: "#58a6ff" attr: "b" }
    shape_bool: "#56d4dd"
    shape_custom: "#3fb950"
    shape_datetime: { fg: "#39c5cf" attr: "b" }
    shape_directory: "#39c5cf"
    shape_external: "#39c5cf"
    shape_externalarg: { fg: "#3fb950" attr: "b" }
    shape_filepath: "#39c5cf"
    shape_flag: { fg: "#58a6ff" attr: "b" }
    shape_float: { fg: "#bc8cff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#39c5cf" attr: "b" }
    shape_int: { fg: "#bc8cff" attr: "b" }
    shape_internalcall: { fg: "#39c5cf" attr: "b" }
    shape_list: { fg: "#39c5cf" attr: "b" }
    shape_literal: "#58a6ff"
    shape_match_pattern: "#3fb950"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#56d4dd"
    shape_operator: "#d29922"
    shape_or: { fg: "#bc8cff" attr: "b" }
    shape_pipe: { fg: "#bc8cff" attr: "b" }
    shape_range: { fg: "#d29922" attr: "b" }
    shape_record: { fg: "#39c5cf" attr: "b" }
    shape_redirection: { fg: "#bc8cff" attr: "b" }
    shape_signature: { fg: "#3fb950" attr: "b" }
    shape_string: "#3fb950"
    shape_string_interpolation: { fg: "#39c5cf" attr: "b" }
    shape_table: { fg: "#58a6ff" attr: "b" }
    shape_variable: "#bc8cff"

    background: "#0d1117"
    foreground: "#b3b1ad"
    cursor: "#73b7f2"
}}