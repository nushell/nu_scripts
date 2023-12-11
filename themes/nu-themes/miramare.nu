export def main [] { return {
    separator: "#444444"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#87af87" attr: "b" }
    empty: "#89beba"
    bool: {|| if $in { "#87c095" } else { "light_gray" } }
    int: "#444444"
    filesize: {|e|
        if $e == 0b {
            "#444444"
        } else if $e < 1mb {
            "#87c095"
        } else {{ fg: "#89beba" }}
    }
    duration: "#444444"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e68183" attr: "b" }
        } else if $in < 6hr {
            "#e68183"
        } else if $in < 1day {
            "#d9bb80"
        } else if $in < 3day {
            "#87af87"
        } else if $in < 1wk {
            { fg: "#87af87" attr: "b" }
        } else if $in < 6wk {
            "#87c095"
        } else if $in < 52wk {
            "#89beba"
        } else { "dark_gray" }
    }
    range: "#444444"
    float: "#444444"
    string: "#444444"
    nothing: "#444444"
    binary: "#444444"
    cellpath: "#444444"
    row_index: { fg: "#87af87" attr: "b" }
    record: "#444444"
    list: "#444444"
    block: "#444444"
    hints: "dark_gray"
    search_result: { fg: "#e68183" bg: "#444444" }

    shape_and: { fg: "#d3a0bc" attr: "b" }
    shape_binary: { fg: "#d3a0bc" attr: "b" }
    shape_block: { fg: "#89beba" attr: "b" }
    shape_bool: "#87c095"
    shape_custom: "#87af87"
    shape_datetime: { fg: "#87c095" attr: "b" }
    shape_directory: "#87c095"
    shape_external: "#87c095"
    shape_externalarg: { fg: "#87af87" attr: "b" }
    shape_filepath: "#87c095"
    shape_flag: { fg: "#89beba" attr: "b" }
    shape_float: { fg: "#d3a0bc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#87c095" attr: "b" }
    shape_int: { fg: "#d3a0bc" attr: "b" }
    shape_internalcall: { fg: "#87c095" attr: "b" }
    shape_list: { fg: "#87c095" attr: "b" }
    shape_literal: "#89beba"
    shape_match_pattern: "#87af87"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#87c095"
    shape_operator: "#d9bb80"
    shape_or: { fg: "#d3a0bc" attr: "b" }
    shape_pipe: { fg: "#d3a0bc" attr: "b" }
    shape_range: { fg: "#d9bb80" attr: "b" }
    shape_record: { fg: "#87c095" attr: "b" }
    shape_redirection: { fg: "#d3a0bc" attr: "b" }
    shape_signature: { fg: "#87af87" attr: "b" }
    shape_string: "#87af87"
    shape_string_interpolation: { fg: "#87c095" attr: "b" }
    shape_table: { fg: "#89beba" attr: "b" }
    shape_variable: "#d3a0bc"

    background: "#2a2426"
    foreground: "#e6d6ac"
    cursor: "#d9bb80"
}}