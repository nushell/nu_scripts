export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#37b349" attr: "b" }
    empty: "#0e5a94"
    bool: {|| if $in { "#00aabb" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
        if $e == 0b {
            "#d0d0d0"
        } else if $e < 1mb {
            "#00aabb"
        } else {{ fg: "#0e5a94" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#eb008a" attr: "b" }
        } else if $in < 6hr {
            "#eb008a"
        } else if $in < 1day {
            "#f8ca12"
        } else if $in < 3day {
            "#37b349"
        } else if $in < 1wk {
            { fg: "#37b349" attr: "b" }
        } else if $in < 6wk {
            "#00aabb"
        } else if $in < 52wk {
            "#0e5a94"
        } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#37b349" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"
    search_result: { fg: "#eb008a" bg: "#d0d0d0" }

    shape_and: { fg: "#b31e8d" attr: "b" }
    shape_binary: { fg: "#b31e8d" attr: "b" }
    shape_block: { fg: "#0e5a94" attr: "b" }
    shape_bool: "#00aabb"
    shape_custom: "#37b349"
    shape_datetime: { fg: "#00aabb" attr: "b" }
    shape_directory: "#00aabb"
    shape_external: "#00aabb"
    shape_externalarg: { fg: "#37b349" attr: "b" }
    shape_filepath: "#00aabb"
    shape_flag: { fg: "#0e5a94" attr: "b" }
    shape_float: { fg: "#b31e8d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00aabb" attr: "b" }
    shape_int: { fg: "#b31e8d" attr: "b" }
    shape_internalcall: { fg: "#00aabb" attr: "b" }
    shape_list: { fg: "#00aabb" attr: "b" }
    shape_literal: "#0e5a94"
    shape_match_pattern: "#37b349"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00aabb"
    shape_operator: "#f8ca12"
    shape_or: { fg: "#b31e8d" attr: "b" }
    shape_pipe: { fg: "#b31e8d" attr: "b" }
    shape_range: { fg: "#f8ca12" attr: "b" }
    shape_record: { fg: "#00aabb" attr: "b" }
    shape_redirection: { fg: "#b31e8d" attr: "b" }
    shape_signature: { fg: "#37b349" attr: "b" }
    shape_string: "#37b349"
    shape_string_interpolation: { fg: "#00aabb" attr: "b" }
    shape_table: { fg: "#0e5a94" attr: "b" }
    shape_variable: "#b31e8d"

    background: "#000000"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}