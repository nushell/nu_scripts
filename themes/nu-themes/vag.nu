export def main [] { return {
    separator: "#8a8a8a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#39a871" attr: "b" }
    empty: "#7139a8"
    bool: {|| if $in { "#3b76b0" } else { "light_gray" } }
    int: "#8a8a8a"
    filesize: {|e|
        if $e == 0b {
            "#8a8a8a"
        } else if $e < 1mb {
            "#3971a8"
        } else {{ fg: "#7139a8" }}
    }
    duration: "#8a8a8a"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a87139" attr: "b" }
        } else if $in < 6hr {
            "#a87139"
        } else if $in < 1day {
            "#71a839"
        } else if $in < 3day {
            "#39a871"
        } else if $in < 1wk {
            { fg: "#39a871" attr: "b" }
        } else if $in < 6wk {
            "#3971a8"
        } else if $in < 52wk {
            "#7139a8"
        } else { "dark_gray" }
    }
    range: "#8a8a8a"
    float: "#8a8a8a"
    string: "#8a8a8a"
    nothing: "#8a8a8a"
    binary: "#8a8a8a"
    cellpath: "#8a8a8a"
    row_index: { fg: "#39a871" attr: "b" }
    record: "#8a8a8a"
    list: "#8a8a8a"
    block: "#8a8a8a"
    hints: "dark_gray"
    search_result: { fg: "#a87139" bg: "#8a8a8a" }

    shape_and: { fg: "#a83971" attr: "b" }
    shape_binary: { fg: "#a83971" attr: "b" }
    shape_block: { fg: "#7139a8" attr: "b" }
    shape_bool: "#3b76b0"
    shape_custom: "#39a871"
    shape_datetime: { fg: "#3971a8" attr: "b" }
    shape_directory: "#3971a8"
    shape_external: "#3971a8"
    shape_externalarg: { fg: "#39a871" attr: "b" }
    shape_filepath: "#3971a8"
    shape_flag: { fg: "#7139a8" attr: "b" }
    shape_float: { fg: "#a83971" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3971a8" attr: "b" }
    shape_int: { fg: "#a83971" attr: "b" }
    shape_internalcall: { fg: "#3971a8" attr: "b" }
    shape_list: { fg: "#3971a8" attr: "b" }
    shape_literal: "#7139a8"
    shape_match_pattern: "#39a871"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3b76b0"
    shape_operator: "#71a839"
    shape_or: { fg: "#a83971" attr: "b" }
    shape_pipe: { fg: "#a83971" attr: "b" }
    shape_range: { fg: "#71a839" attr: "b" }
    shape_record: { fg: "#3971a8" attr: "b" }
    shape_redirection: { fg: "#a83971" attr: "b" }
    shape_signature: { fg: "#39a871" attr: "b" }
    shape_string: "#39a871"
    shape_string_interpolation: { fg: "#3971a8" attr: "b" }
    shape_table: { fg: "#7139a8" attr: "b" }
    shape_variable: "#a83971"

    background: "#191f1d"
    foreground: "#d9e6f2"
    cursor: "#d9e6f2"
}}