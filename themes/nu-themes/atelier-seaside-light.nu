export def main [] { return {
    separator: "#5e6e5e"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#29a329" attr: "b" }
    empty: "#3d62f5"
    bool: {|| if $in { "#1999b3" } else { "light_gray" } }
    int: "#5e6e5e"
    filesize: {|e|
        if $e == 0b {
            "#5e6e5e"
        } else if $e < 1mb {
            "#1999b3"
        } else {{ fg: "#3d62f5" }}
    }
    duration: "#5e6e5e"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e6193c" attr: "b" }
        } else if $in < 6hr {
            "#e6193c"
        } else if $in < 1day {
            "#98981b"
        } else if $in < 3day {
            "#29a329"
        } else if $in < 1wk {
            { fg: "#29a329" attr: "b" }
        } else if $in < 6wk {
            "#1999b3"
        } else if $in < 52wk {
            "#3d62f5"
        } else { "dark_gray" }
    }
    range: "#5e6e5e"
    float: "#5e6e5e"
    string: "#5e6e5e"
    nothing: "#5e6e5e"
    binary: "#5e6e5e"
    cellpath: "#5e6e5e"
    row_index: { fg: "#29a329" attr: "b" }
    record: "#5e6e5e"
    list: "#5e6e5e"
    block: "#5e6e5e"
    hints: "dark_gray"
    search_result: { fg: "#e6193c" bg: "#5e6e5e" }

    shape_and: { fg: "#ad2bee" attr: "b" }
    shape_binary: { fg: "#ad2bee" attr: "b" }
    shape_block: { fg: "#3d62f5" attr: "b" }
    shape_bool: "#1999b3"
    shape_custom: "#29a329"
    shape_datetime: { fg: "#1999b3" attr: "b" }
    shape_directory: "#1999b3"
    shape_external: "#1999b3"
    shape_externalarg: { fg: "#29a329" attr: "b" }
    shape_filepath: "#1999b3"
    shape_flag: { fg: "#3d62f5" attr: "b" }
    shape_float: { fg: "#ad2bee" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1999b3" attr: "b" }
    shape_int: { fg: "#ad2bee" attr: "b" }
    shape_internalcall: { fg: "#1999b3" attr: "b" }
    shape_list: { fg: "#1999b3" attr: "b" }
    shape_literal: "#3d62f5"
    shape_match_pattern: "#29a329"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1999b3"
    shape_operator: "#98981b"
    shape_or: { fg: "#ad2bee" attr: "b" }
    shape_pipe: { fg: "#ad2bee" attr: "b" }
    shape_range: { fg: "#98981b" attr: "b" }
    shape_record: { fg: "#1999b3" attr: "b" }
    shape_redirection: { fg: "#ad2bee" attr: "b" }
    shape_signature: { fg: "#29a329" attr: "b" }
    shape_string: "#29a329"
    shape_string_interpolation: { fg: "#1999b3" attr: "b" }
    shape_table: { fg: "#3d62f5" attr: "b" }
    shape_variable: "#ad2bee"

    background: "#f4fbf4"
    foreground: "#5e6e5e"
    cursor: "#5e6e5e"
}}