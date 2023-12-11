export def main [] { return {
    separator: "#f7d75c"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#636232" attr: "b" }
    empty: "#515c5d"
    bool: {|| if $in { "#8acd8f" } else { "light_gray" } }
    int: "#f7d75c"
    filesize: {|e|
        if $e == 0b {
            "#f7d75c"
        } else if $e < 1mb {
            "#588056"
        } else {{ fg: "#515c5d" }}
    }
    duration: "#f7d75c"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#9b291c" attr: "b" }
        } else if $in < 6hr {
            "#9b291c"
        } else if $in < 1day {
            "#c36e28"
        } else if $in < 3day {
            "#636232"
        } else if $in < 1wk {
            { fg: "#636232" attr: "b" }
        } else if $in < 6wk {
            "#588056"
        } else if $in < 52wk {
            "#515c5d"
        } else { "dark_gray" }
    }
    range: "#f7d75c"
    float: "#f7d75c"
    string: "#f7d75c"
    nothing: "#f7d75c"
    binary: "#f7d75c"
    cellpath: "#f7d75c"
    row_index: { fg: "#636232" attr: "b" }
    record: "#f7d75c"
    list: "#f7d75c"
    block: "#f7d75c"
    hints: "dark_gray"
    search_result: { fg: "#9b291c" bg: "#f7d75c" }

    shape_and: { fg: "#9b1d29" attr: "b" }
    shape_binary: { fg: "#9b1d29" attr: "b" }
    shape_block: { fg: "#515c5d" attr: "b" }
    shape_bool: "#8acd8f"
    shape_custom: "#636232"
    shape_datetime: { fg: "#588056" attr: "b" }
    shape_directory: "#588056"
    shape_external: "#588056"
    shape_externalarg: { fg: "#636232" attr: "b" }
    shape_filepath: "#588056"
    shape_flag: { fg: "#515c5d" attr: "b" }
    shape_float: { fg: "#9b1d29" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#588056" attr: "b" }
    shape_int: { fg: "#9b1d29" attr: "b" }
    shape_internalcall: { fg: "#588056" attr: "b" }
    shape_list: { fg: "#588056" attr: "b" }
    shape_literal: "#515c5d"
    shape_match_pattern: "#636232"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8acd8f"
    shape_operator: "#c36e28"
    shape_or: { fg: "#9b1d29" attr: "b" }
    shape_pipe: { fg: "#9b1d29" attr: "b" }
    shape_range: { fg: "#c36e28" attr: "b" }
    shape_record: { fg: "#588056" attr: "b" }
    shape_redirection: { fg: "#9b1d29" attr: "b" }
    shape_signature: { fg: "#636232" attr: "b" }
    shape_string: "#636232"
    shape_string_interpolation: { fg: "#588056" attr: "b" }
    shape_table: { fg: "#515c5d" attr: "b" }
    shape_variable: "#9b1d29"

    background: "#120b0d"
    foreground: "#f7d66a"
    cursor: "#f7d66a"
}}