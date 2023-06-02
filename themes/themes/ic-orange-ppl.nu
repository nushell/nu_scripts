export def main [] { return {
    separator: "#ffc88a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a4a900" attr: "b" }
    empty: "#bd6d00"
    bool: {|| if $in { "#c69752" } else { "light_gray" } }
    int: "#ffc88a"
    filesize: {|e|
        if $e == 0b {
            "#ffc88a"
        } else if $e < 1mb {
            "#f79500"
        } else {{ fg: "#bd6d00" }}
    }
    duration: "#ffc88a"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c13900" attr: "b" }
        } else if $in < 6hr {
            "#c13900"
        } else if $in < 1day {
            "#caaf00"
        } else if $in < 3day {
            "#a4a900"
        } else if $in < 1wk {
            { fg: "#a4a900" attr: "b" }
        } else if $in < 6wk {
            "#f79500"
        } else if $in < 52wk {
            "#bd6d00"
        } else { "dark_gray" }
    }
    range: "#ffc88a"
    float: "#ffc88a"
    string: "#ffc88a"
    nothing: "#ffc88a"
    binary: "#ffc88a"
    cellpath: "#ffc88a"
    row_index: { fg: "#a4a900" attr: "b" }
    record: "#ffc88a"
    list: "#ffc88a"
    block: "#ffc88a"
    hints: "dark_gray"
    search_result: { fg: "#c13900" bg: "#ffc88a" }

    shape_and: { fg: "#fc5e00" attr: "b" }
    shape_binary: { fg: "#fc5e00" attr: "b" }
    shape_block: { fg: "#bd6d00" attr: "b" }
    shape_bool: "#c69752"
    shape_custom: "#a4a900"
    shape_datetime: { fg: "#f79500" attr: "b" }
    shape_directory: "#f79500"
    shape_external: "#f79500"
    shape_externalarg: { fg: "#a4a900" attr: "b" }
    shape_filepath: "#f79500"
    shape_flag: { fg: "#bd6d00" attr: "b" }
    shape_float: { fg: "#fc5e00" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#f79500" attr: "b" }
    shape_int: { fg: "#fc5e00" attr: "b" }
    shape_internalcall: { fg: "#f79500" attr: "b" }
    shape_list: { fg: "#f79500" attr: "b" }
    shape_literal: "#bd6d00"
    shape_match_pattern: "#a4a900"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c69752"
    shape_operator: "#caaf00"
    shape_or: { fg: "#fc5e00" attr: "b" }
    shape_pipe: { fg: "#fc5e00" attr: "b" }
    shape_range: { fg: "#caaf00" attr: "b" }
    shape_record: { fg: "#f79500" attr: "b" }
    shape_redirection: { fg: "#fc5e00" attr: "b" }
    shape_signature: { fg: "#a4a900" attr: "b" }
    shape_string: "#a4a900"
    shape_string_interpolation: { fg: "#f79500" attr: "b" }
    shape_table: { fg: "#bd6d00" attr: "b" }
    shape_variable: "#fc5e00"

    background: "#262626"
    foreground: "#ffcb83"
    cursor: "#ffcb83"
}}