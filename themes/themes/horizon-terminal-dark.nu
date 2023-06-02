export def main [] { return {
    separator: "#cbced0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#29d398" attr: "b" }
    empty: "#26bbd9"
    bool: {|| if $in { "#59e1e3" } else { "light_gray" } }
    int: "#cbced0"
    filesize: {|e|
        if $e == 0b {
            "#cbced0"
        } else if $e < 1mb {
            "#59e1e3"
        } else {{ fg: "#26bbd9" }}
    }
    duration: "#cbced0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e95678" attr: "b" }
        } else if $in < 6hr {
            "#e95678"
        } else if $in < 1day {
            "#fac29a"
        } else if $in < 3day {
            "#29d398"
        } else if $in < 1wk {
            { fg: "#29d398" attr: "b" }
        } else if $in < 6wk {
            "#59e1e3"
        } else if $in < 52wk {
            "#26bbd9"
        } else { "dark_gray" }
    }
    range: "#cbced0"
    float: "#cbced0"
    string: "#cbced0"
    nothing: "#cbced0"
    binary: "#cbced0"
    cellpath: "#cbced0"
    row_index: { fg: "#29d398" attr: "b" }
    record: "#cbced0"
    list: "#cbced0"
    block: "#cbced0"
    hints: "dark_gray"
    search_result: { fg: "#e95678" bg: "#cbced0" }

    shape_and: { fg: "#ee64ac" attr: "b" }
    shape_binary: { fg: "#ee64ac" attr: "b" }
    shape_block: { fg: "#26bbd9" attr: "b" }
    shape_bool: "#59e1e3"
    shape_custom: "#29d398"
    shape_datetime: { fg: "#59e1e3" attr: "b" }
    shape_directory: "#59e1e3"
    shape_external: "#59e1e3"
    shape_externalarg: { fg: "#29d398" attr: "b" }
    shape_filepath: "#59e1e3"
    shape_flag: { fg: "#26bbd9" attr: "b" }
    shape_float: { fg: "#ee64ac" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#59e1e3" attr: "b" }
    shape_int: { fg: "#ee64ac" attr: "b" }
    shape_internalcall: { fg: "#59e1e3" attr: "b" }
    shape_list: { fg: "#59e1e3" attr: "b" }
    shape_literal: "#26bbd9"
    shape_match_pattern: "#29d398"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#59e1e3"
    shape_operator: "#fac29a"
    shape_or: { fg: "#ee64ac" attr: "b" }
    shape_pipe: { fg: "#ee64ac" attr: "b" }
    shape_range: { fg: "#fac29a" attr: "b" }
    shape_record: { fg: "#59e1e3" attr: "b" }
    shape_redirection: { fg: "#ee64ac" attr: "b" }
    shape_signature: { fg: "#29d398" attr: "b" }
    shape_string: "#29d398"
    shape_string_interpolation: { fg: "#59e1e3" attr: "b" }
    shape_table: { fg: "#26bbd9" attr: "b" }
    shape_variable: "#ee64ac"

    background: "#1c1e26"
    foreground: "#cbced0"
    cursor: "#cbced0"
}}