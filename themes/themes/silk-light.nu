export def main [] { return {
    separator: "#385156"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6ca38c" attr: "b" }
    empty: "#39aac9"
    bool: {|| if $in { "#329ca2" } else { "light_gray" } }
    int: "#385156"
    filesize: {|e|
        if $e == 0b {
            "#385156"
        } else if $e < 1mb {
            "#329ca2"
        } else {{ fg: "#39aac9" }}
    }
    duration: "#385156"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cf432e" attr: "b" }
        } else if $in < 6hr {
            "#cf432e"
        } else if $in < 1day {
            "#cfad25"
        } else if $in < 3day {
            "#6ca38c"
        } else if $in < 1wk {
            { fg: "#6ca38c" attr: "b" }
        } else if $in < 6wk {
            "#329ca2"
        } else if $in < 52wk {
            "#39aac9"
        } else { "dark_gray" }
    }
    range: "#385156"
    float: "#385156"
    string: "#385156"
    nothing: "#385156"
    binary: "#385156"
    cellpath: "#385156"
    row_index: { fg: "#6ca38c" attr: "b" }
    record: "#385156"
    list: "#385156"
    block: "#385156"
    hints: "dark_gray"
    search_result: { fg: "#cf432e" bg: "#385156" }

    shape_and: { fg: "#6e6582" attr: "b" }
    shape_binary: { fg: "#6e6582" attr: "b" }
    shape_block: { fg: "#39aac9" attr: "b" }
    shape_bool: "#329ca2"
    shape_custom: "#6ca38c"
    shape_datetime: { fg: "#329ca2" attr: "b" }
    shape_directory: "#329ca2"
    shape_external: "#329ca2"
    shape_externalarg: { fg: "#6ca38c" attr: "b" }
    shape_filepath: "#329ca2"
    shape_flag: { fg: "#39aac9" attr: "b" }
    shape_float: { fg: "#6e6582" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#329ca2" attr: "b" }
    shape_int: { fg: "#6e6582" attr: "b" }
    shape_internalcall: { fg: "#329ca2" attr: "b" }
    shape_list: { fg: "#329ca2" attr: "b" }
    shape_literal: "#39aac9"
    shape_match_pattern: "#6ca38c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#329ca2"
    shape_operator: "#cfad25"
    shape_or: { fg: "#6e6582" attr: "b" }
    shape_pipe: { fg: "#6e6582" attr: "b" }
    shape_range: { fg: "#cfad25" attr: "b" }
    shape_record: { fg: "#329ca2" attr: "b" }
    shape_redirection: { fg: "#6e6582" attr: "b" }
    shape_signature: { fg: "#6ca38c" attr: "b" }
    shape_string: "#6ca38c"
    shape_string_interpolation: { fg: "#329ca2" attr: "b" }
    shape_table: { fg: "#39aac9" attr: "b" }
    shape_variable: "#6e6582"

    background: "#e9f1ef"
    foreground: "#385156"
    cursor: "#385156"
}}