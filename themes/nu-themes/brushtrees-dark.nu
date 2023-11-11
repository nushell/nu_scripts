export def main [] { return {
    separator: "#b0c5c8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#87b386" attr: "b" }
    empty: "#868cb3"
    bool: {|| if $in { "#86b3b3" } else { "light_gray" } }
    int: "#b0c5c8"
    filesize: {|e|
        if $e == 0b {
            "#b0c5c8"
        } else if $e < 1mb {
            "#86b3b3"
        } else {{ fg: "#868cb3" }}
    }
    duration: "#b0c5c8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b38686" attr: "b" }
        } else if $in < 6hr {
            "#b38686"
        } else if $in < 1day {
            "#aab386"
        } else if $in < 3day {
            "#87b386"
        } else if $in < 1wk {
            { fg: "#87b386" attr: "b" }
        } else if $in < 6wk {
            "#86b3b3"
        } else if $in < 52wk {
            "#868cb3"
        } else { "dark_gray" }
    }
    range: "#b0c5c8"
    float: "#b0c5c8"
    string: "#b0c5c8"
    nothing: "#b0c5c8"
    binary: "#b0c5c8"
    cellpath: "#b0c5c8"
    row_index: { fg: "#87b386" attr: "b" }
    record: "#b0c5c8"
    list: "#b0c5c8"
    block: "#b0c5c8"
    hints: "dark_gray"
    search_result: { fg: "#b38686" bg: "#b0c5c8" }

    shape_and: { fg: "#b386b2" attr: "b" }
    shape_binary: { fg: "#b386b2" attr: "b" }
    shape_block: { fg: "#868cb3" attr: "b" }
    shape_bool: "#86b3b3"
    shape_custom: "#87b386"
    shape_datetime: { fg: "#86b3b3" attr: "b" }
    shape_directory: "#86b3b3"
    shape_external: "#86b3b3"
    shape_externalarg: { fg: "#87b386" attr: "b" }
    shape_filepath: "#86b3b3"
    shape_flag: { fg: "#868cb3" attr: "b" }
    shape_float: { fg: "#b386b2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#86b3b3" attr: "b" }
    shape_int: { fg: "#b386b2" attr: "b" }
    shape_internalcall: { fg: "#86b3b3" attr: "b" }
    shape_list: { fg: "#86b3b3" attr: "b" }
    shape_literal: "#868cb3"
    shape_match_pattern: "#87b386"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#86b3b3"
    shape_operator: "#aab386"
    shape_or: { fg: "#b386b2" attr: "b" }
    shape_pipe: { fg: "#b386b2" attr: "b" }
    shape_range: { fg: "#aab386" attr: "b" }
    shape_record: { fg: "#86b3b3" attr: "b" }
    shape_redirection: { fg: "#b386b2" attr: "b" }
    shape_signature: { fg: "#87b386" attr: "b" }
    shape_string: "#87b386"
    shape_string_interpolation: { fg: "#86b3b3" attr: "b" }
    shape_table: { fg: "#868cb3" attr: "b" }
    shape_variable: "#b386b2"

    background: "#485867"
    foreground: "#b0c5c8"
    cursor: "#b0c5c8"
}}