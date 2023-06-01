export def main [] { return {
    separator: "#00bb00"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00bb00" attr: "b" }
    empty: "#009900"
    bool: {|| if $in { "#005500" } else { "light_gray" } }
    int: "#00bb00"
    filesize: {|e|
        if $e == 0b {
            "#00bb00"
        } else if $e < 1mb {
            "#005500"
        } else {{ fg: "#009900" }}
    }
    duration: "#00bb00"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#007700" attr: "b" }
        } else if $in < 6hr {
            "#007700"
        } else if $in < 1day {
            "#007700"
        } else if $in < 3day {
            "#00bb00"
        } else if $in < 1wk {
            { fg: "#00bb00" attr: "b" }
        } else if $in < 6wk {
            "#005500"
        } else if $in < 52wk {
            "#009900"
        } else { "dark_gray" }
    }
    range: "#00bb00"
    float: "#00bb00"
    string: "#00bb00"
    nothing: "#00bb00"
    binary: "#00bb00"
    cellpath: "#00bb00"
    row_index: { fg: "#00bb00" attr: "b" }
    record: "#00bb00"
    list: "#00bb00"
    block: "#00bb00"
    hints: "dark_gray"
    search_result: { fg: "#007700" bg: "#00bb00" }

    shape_and: { fg: "#00bb00" attr: "b" }
    shape_binary: { fg: "#00bb00" attr: "b" }
    shape_block: { fg: "#009900" attr: "b" }
    shape_bool: "#005500"
    shape_custom: "#00bb00"
    shape_datetime: { fg: "#005500" attr: "b" }
    shape_directory: "#005500"
    shape_external: "#005500"
    shape_externalarg: { fg: "#00bb00" attr: "b" }
    shape_filepath: "#005500"
    shape_flag: { fg: "#009900" attr: "b" }
    shape_float: { fg: "#00bb00" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#005500" attr: "b" }
    shape_int: { fg: "#00bb00" attr: "b" }
    shape_internalcall: { fg: "#005500" attr: "b" }
    shape_list: { fg: "#005500" attr: "b" }
    shape_literal: "#009900"
    shape_match_pattern: "#00bb00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#005500"
    shape_operator: "#007700"
    shape_or: { fg: "#00bb00" attr: "b" }
    shape_pipe: { fg: "#00bb00" attr: "b" }
    shape_range: { fg: "#007700" attr: "b" }
    shape_record: { fg: "#005500" attr: "b" }
    shape_redirection: { fg: "#00bb00" attr: "b" }
    shape_signature: { fg: "#00bb00" attr: "b" }
    shape_string: "#00bb00"
    shape_string_interpolation: { fg: "#005500" attr: "b" }
    shape_table: { fg: "#009900" attr: "b" }
    shape_variable: "#00bb00"

    background: "#001100"
    foreground: "#00bb00"
    cursor: "#00bb00"
}}