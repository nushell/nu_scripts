export def main [] { return {
    separator: "#bfbfbf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00a600" attr: "b" }
    empty: "#2009db"
    bool: {|| if $in { "#00e5e5" } else { "light_gray" } }
    int: "#bfbfbf"
    filesize: {|e|
        if $e == 0b {
            "#bfbfbf"
        } else if $e < 1mb {
            "#00a6b2"
        } else {{ fg: "#2009db" }}
    }
    duration: "#bfbfbf"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#990000" attr: "b" }
        } else if $in < 6hr {
            "#990000"
        } else if $in < 1day {
            "#999900"
        } else if $in < 3day {
            "#00a600"
        } else if $in < 1wk {
            { fg: "#00a600" attr: "b" }
        } else if $in < 6wk {
            "#00a6b2"
        } else if $in < 52wk {
            "#2009db"
        } else { "dark_gray" }
    }
    range: "#bfbfbf"
    float: "#bfbfbf"
    string: "#bfbfbf"
    nothing: "#bfbfbf"
    binary: "#bfbfbf"
    cellpath: "#bfbfbf"
    row_index: { fg: "#00a600" attr: "b" }
    record: "#bfbfbf"
    list: "#bfbfbf"
    block: "#bfbfbf"
    hints: "dark_gray"
    search_result: { fg: "#990000" bg: "#bfbfbf" }

    shape_and: { fg: "#b200b2" attr: "b" }
    shape_binary: { fg: "#b200b2" attr: "b" }
    shape_block: { fg: "#2009db" attr: "b" }
    shape_bool: "#00e5e5"
    shape_custom: "#00a600"
    shape_datetime: { fg: "#00a6b2" attr: "b" }
    shape_directory: "#00a6b2"
    shape_external: "#00a6b2"
    shape_externalarg: { fg: "#00a600" attr: "b" }
    shape_filepath: "#00a6b2"
    shape_flag: { fg: "#2009db" attr: "b" }
    shape_float: { fg: "#b200b2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00a6b2" attr: "b" }
    shape_int: { fg: "#b200b2" attr: "b" }
    shape_internalcall: { fg: "#00a6b2" attr: "b" }
    shape_list: { fg: "#00a6b2" attr: "b" }
    shape_literal: "#2009db"
    shape_match_pattern: "#00a600"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00e5e5"
    shape_operator: "#999900"
    shape_or: { fg: "#b200b2" attr: "b" }
    shape_pipe: { fg: "#b200b2" attr: "b" }
    shape_range: { fg: "#999900" attr: "b" }
    shape_record: { fg: "#00a6b2" attr: "b" }
    shape_redirection: { fg: "#b200b2" attr: "b" }
    shape_signature: { fg: "#00a600" attr: "b" }
    shape_string: "#00a600"
    shape_string_interpolation: { fg: "#00a6b2" attr: "b" }
    shape_table: { fg: "#2009db" attr: "b" }
    shape_variable: "#b200b2"

    background: "#000000"
    foreground: "#f2f2f2"
    cursor: "#f2f2f2"
}}