export def main [] { return {
    separator: "#cdcdcd"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a6e22e" attr: "b" }
    empty: "#66d9ef"
    bool: {|| if $in { "#708387" } else { "light_gray" } }
    int: "#cdcdcd"
    filesize: {|e|
        if $e == 0b {
            "#cdcdcd"
        } else if $e < 1mb {
            "#708387"
        } else {{ fg: "#66d9ef" }}
    }
    duration: "#cdcdcd"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f92672" attr: "b" }
        } else if $in < 6hr {
            "#f92672"
        } else if $in < 1day {
            "#e6db74"
        } else if $in < 3day {
            "#a6e22e"
        } else if $in < 1wk {
            { fg: "#a6e22e" attr: "b" }
        } else if $in < 6wk {
            "#708387"
        } else if $in < 52wk {
            "#66d9ef"
        } else { "dark_gray" }
    }
    range: "#cdcdcd"
    float: "#cdcdcd"
    string: "#cdcdcd"
    nothing: "#cdcdcd"
    binary: "#cdcdcd"
    cellpath: "#cdcdcd"
    row_index: { fg: "#a6e22e" attr: "b" }
    record: "#cdcdcd"
    list: "#cdcdcd"
    block: "#cdcdcd"
    hints: "dark_gray"
    search_result: { fg: "#f92672" bg: "#cdcdcd" }

    shape_and: { fg: "#9e6ffe" attr: "b" }
    shape_binary: { fg: "#9e6ffe" attr: "b" }
    shape_block: { fg: "#66d9ef" attr: "b" }
    shape_bool: "#708387"
    shape_custom: "#a6e22e"
    shape_datetime: { fg: "#708387" attr: "b" }
    shape_directory: "#708387"
    shape_external: "#708387"
    shape_externalarg: { fg: "#a6e22e" attr: "b" }
    shape_filepath: "#708387"
    shape_flag: { fg: "#66d9ef" attr: "b" }
    shape_float: { fg: "#9e6ffe" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#708387" attr: "b" }
    shape_int: { fg: "#9e6ffe" attr: "b" }
    shape_internalcall: { fg: "#708387" attr: "b" }
    shape_list: { fg: "#708387" attr: "b" }
    shape_literal: "#66d9ef"
    shape_match_pattern: "#a6e22e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#708387"
    shape_operator: "#e6db74"
    shape_or: { fg: "#9e6ffe" attr: "b" }
    shape_pipe: { fg: "#9e6ffe" attr: "b" }
    shape_range: { fg: "#e6db74" attr: "b" }
    shape_record: { fg: "#708387" attr: "b" }
    shape_redirection: { fg: "#9e6ffe" attr: "b" }
    shape_signature: { fg: "#a6e22e" attr: "b" }
    shape_string: "#a6e22e"
    shape_string_interpolation: { fg: "#708387" attr: "b" }
    shape_table: { fg: "#66d9ef" attr: "b" }
    shape_variable: "#9e6ffe"

    background: "#212121"
    foreground: "#cdcdcd"
    cursor: "#cdcdcd"
}}