export def main [] { return {
    separator: "#695d69"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#918b3b" attr: "b" }
    empty: "#516aec"
    bool: {|| if $in { "#159393" } else { "light_gray" } }
    int: "#695d69"
    filesize: {|e|
        if $e == 0b {
            "#695d69"
        } else if $e < 1mb {
            "#159393"
        } else {{ fg: "#516aec" }}
    }
    duration: "#695d69"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ca402b" attr: "b" }
        } else if $in < 6hr {
            "#ca402b"
        } else if $in < 1day {
            "#bb8a35"
        } else if $in < 3day {
            "#918b3b"
        } else if $in < 1wk {
            { fg: "#918b3b" attr: "b" }
        } else if $in < 6wk {
            "#159393"
        } else if $in < 52wk {
            "#516aec"
        } else { "dark_gray" }
    }
    range: "#695d69"
    float: "#695d69"
    string: "#695d69"
    nothing: "#695d69"
    binary: "#695d69"
    cellpath: "#695d69"
    row_index: { fg: "#918b3b" attr: "b" }
    record: "#695d69"
    list: "#695d69"
    block: "#695d69"
    hints: "dark_gray"
    search_result: { fg: "#ca402b" bg: "#695d69" }

    shape_and: { fg: "#7b59c0" attr: "b" }
    shape_binary: { fg: "#7b59c0" attr: "b" }
    shape_block: { fg: "#516aec" attr: "b" }
    shape_bool: "#159393"
    shape_custom: "#918b3b"
    shape_datetime: { fg: "#159393" attr: "b" }
    shape_directory: "#159393"
    shape_external: "#159393"
    shape_externalarg: { fg: "#918b3b" attr: "b" }
    shape_filepath: "#159393"
    shape_flag: { fg: "#516aec" attr: "b" }
    shape_float: { fg: "#7b59c0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#159393" attr: "b" }
    shape_int: { fg: "#7b59c0" attr: "b" }
    shape_internalcall: { fg: "#159393" attr: "b" }
    shape_list: { fg: "#159393" attr: "b" }
    shape_literal: "#516aec"
    shape_match_pattern: "#918b3b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#159393"
    shape_operator: "#bb8a35"
    shape_or: { fg: "#7b59c0" attr: "b" }
    shape_pipe: { fg: "#7b59c0" attr: "b" }
    shape_range: { fg: "#bb8a35" attr: "b" }
    shape_record: { fg: "#159393" attr: "b" }
    shape_redirection: { fg: "#7b59c0" attr: "b" }
    shape_signature: { fg: "#918b3b" attr: "b" }
    shape_string: "#918b3b"
    shape_string_interpolation: { fg: "#159393" attr: "b" }
    shape_table: { fg: "#516aec" attr: "b" }
    shape_variable: "#7b59c0"

    background: "#f7f3f7"
    foreground: "#695d69"
    cursor: "#695d69"
}}