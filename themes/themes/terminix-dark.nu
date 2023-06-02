export def main [] { return {
    separator: "#777777"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a1b56c" attr: "b" }
    empty: "#225555"
    bool: {|| if $in { "#86c1b9" } else { "light_gray" } }
    int: "#777777"
    filesize: {|e|
        if $e == 0b {
            "#777777"
        } else if $e < 1mb {
            "#5e8d87"
        } else {{ fg: "#225555" }}
    }
    duration: "#777777"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a54242" attr: "b" }
        } else if $in < 6hr {
            "#a54242"
        } else if $in < 1day {
            "#de935f"
        } else if $in < 3day {
            "#a1b56c"
        } else if $in < 1wk {
            { fg: "#a1b56c" attr: "b" }
        } else if $in < 6wk {
            "#5e8d87"
        } else if $in < 52wk {
            "#225555"
        } else { "dark_gray" }
    }
    range: "#777777"
    float: "#777777"
    string: "#777777"
    nothing: "#777777"
    binary: "#777777"
    cellpath: "#777777"
    row_index: { fg: "#a1b56c" attr: "b" }
    record: "#777777"
    list: "#777777"
    block: "#777777"
    hints: "dark_gray"
    search_result: { fg: "#a54242" bg: "#777777" }

    shape_and: { fg: "#85678f" attr: "b" }
    shape_binary: { fg: "#85678f" attr: "b" }
    shape_block: { fg: "#225555" attr: "b" }
    shape_bool: "#86c1b9"
    shape_custom: "#a1b56c"
    shape_datetime: { fg: "#5e8d87" attr: "b" }
    shape_directory: "#5e8d87"
    shape_external: "#5e8d87"
    shape_externalarg: { fg: "#a1b56c" attr: "b" }
    shape_filepath: "#5e8d87"
    shape_flag: { fg: "#225555" attr: "b" }
    shape_float: { fg: "#85678f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5e8d87" attr: "b" }
    shape_int: { fg: "#85678f" attr: "b" }
    shape_internalcall: { fg: "#5e8d87" attr: "b" }
    shape_list: { fg: "#5e8d87" attr: "b" }
    shape_literal: "#225555"
    shape_match_pattern: "#a1b56c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#86c1b9"
    shape_operator: "#de935f"
    shape_or: { fg: "#85678f" attr: "b" }
    shape_pipe: { fg: "#85678f" attr: "b" }
    shape_range: { fg: "#de935f" attr: "b" }
    shape_record: { fg: "#5e8d87" attr: "b" }
    shape_redirection: { fg: "#85678f" attr: "b" }
    shape_signature: { fg: "#a1b56c" attr: "b" }
    shape_string: "#a1b56c"
    shape_string_interpolation: { fg: "#5e8d87" attr: "b" }
    shape_table: { fg: "#225555" attr: "b" }
    shape_variable: "#85678f"

    background: "#091116"
    foreground: "#868a8c"
    cursor: "#868a8c"
}}