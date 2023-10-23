export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5fde8f" attr: "b" }
    empty: "#276bd8"
    bool: {|| if $in { "#55ffff" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
        if $e == 0b {
            "#bbbbbb"
        } else if $e < 1mb {
            "#00dadf"
        } else {{ fg: "#276bd8" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#bb0000" attr: "b" }
        } else if $in < 6hr {
            "#bb0000"
        } else if $in < 1day {
            "#f3f167"
        } else if $in < 3day {
            "#5fde8f"
        } else if $in < 1wk {
            { fg: "#5fde8f" attr: "b" }
        } else if $in < 6wk {
            "#00dadf"
        } else if $in < 52wk {
            "#276bd8"
        } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#5fde8f" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"
    search_result: { fg: "#bb0000" bg: "#bbbbbb" }

    shape_and: { fg: "#bb00bb" attr: "b" }
    shape_binary: { fg: "#bb00bb" attr: "b" }
    shape_block: { fg: "#276bd8" attr: "b" }
    shape_bool: "#55ffff"
    shape_custom: "#5fde8f"
    shape_datetime: { fg: "#00dadf" attr: "b" }
    shape_directory: "#00dadf"
    shape_external: "#00dadf"
    shape_externalarg: { fg: "#5fde8f" attr: "b" }
    shape_filepath: "#00dadf"
    shape_flag: { fg: "#276bd8" attr: "b" }
    shape_float: { fg: "#bb00bb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00dadf" attr: "b" }
    shape_int: { fg: "#bb00bb" attr: "b" }
    shape_internalcall: { fg: "#00dadf" attr: "b" }
    shape_list: { fg: "#00dadf" attr: "b" }
    shape_literal: "#276bd8"
    shape_match_pattern: "#5fde8f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#55ffff"
    shape_operator: "#f3f167"
    shape_or: { fg: "#bb00bb" attr: "b" }
    shape_pipe: { fg: "#bb00bb" attr: "b" }
    shape_range: { fg: "#f3f167" attr: "b" }
    shape_record: { fg: "#00dadf" attr: "b" }
    shape_redirection: { fg: "#bb00bb" attr: "b" }
    shape_signature: { fg: "#5fde8f" attr: "b" }
    shape_string: "#5fde8f"
    shape_string_interpolation: { fg: "#00dadf" attr: "b" }
    shape_table: { fg: "#276bd8" attr: "b" }
    shape_variable: "#bb00bb"

    background: "#000000"
    foreground: "#bbbbbb"
    cursor: "#bbbbbb"
}}