export def main [] { return {
    separator: "#ece6de"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#0a7040" attr: "b" }
    empty: "#1763aa"
    bool: {|| if $in { "#07737a" } else { "light_gray" } }
    int: "#ece6de"
    filesize: {|e|
        if $e == 0b {
            "#ece6de"
        } else if $e < 1mb {
            "#096a83"
        } else {{ fg: "#1763aa" }}
    }
    duration: "#ece6de"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c00c50" attr: "b" }
        } else if $in < 6hr {
            "#c00c50"
        } else if $in < 1day {
            "#a6403a"
        } else if $in < 3day {
            "#0a7040"
        } else if $in < 1wk {
            { fg: "#0a7040" attr: "b" }
        } else if $in < 6wk {
            "#096a83"
        } else if $in < 52wk {
            "#1763aa"
        } else { "dark_gray" }
    }
    range: "#ece6de"
    float: "#ece6de"
    string: "#ece6de"
    nothing: "#ece6de"
    binary: "#ece6de"
    cellpath: "#ece6de"
    row_index: { fg: "#0a7040" attr: "b" }
    record: "#ece6de"
    list: "#ece6de"
    block: "#ece6de"
    hints: "dark_gray"
    search_result: { fg: "#c00c50" bg: "#ece6de" }

    shape_and: { fg: "#b02874" attr: "b" }
    shape_binary: { fg: "#b02874" attr: "b" }
    shape_block: { fg: "#1763aa" attr: "b" }
    shape_bool: "#07737a"
    shape_custom: "#0a7040"
    shape_datetime: { fg: "#096a83" attr: "b" }
    shape_directory: "#096a83"
    shape_external: "#096a83"
    shape_externalarg: { fg: "#0a7040" attr: "b" }
    shape_filepath: "#096a83"
    shape_flag: { fg: "#1763aa" attr: "b" }
    shape_float: { fg: "#b02874" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#096a83" attr: "b" }
    shape_int: { fg: "#b02874" attr: "b" }
    shape_internalcall: { fg: "#096a83" attr: "b" }
    shape_list: { fg: "#096a83" attr: "b" }
    shape_literal: "#1763aa"
    shape_match_pattern: "#0a7040"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#07737a"
    shape_operator: "#a6403a"
    shape_or: { fg: "#b02874" attr: "b" }
    shape_pipe: { fg: "#b02874" attr: "b" }
    shape_range: { fg: "#a6403a" attr: "b" }
    shape_record: { fg: "#096a83" attr: "b" }
    shape_redirection: { fg: "#b02874" attr: "b" }
    shape_signature: { fg: "#0a7040" attr: "b" }
    shape_string: "#0a7040"
    shape_string_interpolation: { fg: "#096a83" attr: "b" }
    shape_table: { fg: "#1763aa" attr: "b" }
    shape_variable: "#b02874"

    background: "#f3f2f4"
    foreground: "#53545b"
    cursor: "#53545b"
}}