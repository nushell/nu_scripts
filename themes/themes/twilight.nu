export def main [] { return {
    separator: "#a7a7a7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8f9d6a" attr: "b" }
    empty: "#7587a6"
    bool: {|| if $in { "#afc4db" } else { "light_gray" } }
    int: "#a7a7a7"
    filesize: {|e|
        if $e == 0b {
            "#a7a7a7"
        } else if $e < 1mb {
            "#afc4db"
        } else {{ fg: "#7587a6" }}
    }
    duration: "#a7a7a7"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cf6a4c" attr: "b" }
        } else if $in < 6hr {
            "#cf6a4c"
        } else if $in < 1day {
            "#f9ee98"
        } else if $in < 3day {
            "#8f9d6a"
        } else if $in < 1wk {
            { fg: "#8f9d6a" attr: "b" }
        } else if $in < 6wk {
            "#afc4db"
        } else if $in < 52wk {
            "#7587a6"
        } else { "dark_gray" }
    }
    range: "#a7a7a7"
    float: "#a7a7a7"
    string: "#a7a7a7"
    nothing: "#a7a7a7"
    binary: "#a7a7a7"
    cellpath: "#a7a7a7"
    row_index: { fg: "#8f9d6a" attr: "b" }
    record: "#a7a7a7"
    list: "#a7a7a7"
    block: "#a7a7a7"
    hints: "dark_gray"
    search_result: { fg: "#cf6a4c" bg: "#a7a7a7" }

    shape_and: { fg: "#9b859d" attr: "b" }
    shape_binary: { fg: "#9b859d" attr: "b" }
    shape_block: { fg: "#7587a6" attr: "b" }
    shape_bool: "#afc4db"
    shape_custom: "#8f9d6a"
    shape_datetime: { fg: "#afc4db" attr: "b" }
    shape_directory: "#afc4db"
    shape_external: "#afc4db"
    shape_externalarg: { fg: "#8f9d6a" attr: "b" }
    shape_filepath: "#afc4db"
    shape_flag: { fg: "#7587a6" attr: "b" }
    shape_float: { fg: "#9b859d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#afc4db" attr: "b" }
    shape_int: { fg: "#9b859d" attr: "b" }
    shape_internalcall: { fg: "#afc4db" attr: "b" }
    shape_list: { fg: "#afc4db" attr: "b" }
    shape_literal: "#7587a6"
    shape_match_pattern: "#8f9d6a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#afc4db"
    shape_operator: "#f9ee98"
    shape_or: { fg: "#9b859d" attr: "b" }
    shape_pipe: { fg: "#9b859d" attr: "b" }
    shape_range: { fg: "#f9ee98" attr: "b" }
    shape_record: { fg: "#afc4db" attr: "b" }
    shape_redirection: { fg: "#9b859d" attr: "b" }
    shape_signature: { fg: "#8f9d6a" attr: "b" }
    shape_string: "#8f9d6a"
    shape_string_interpolation: { fg: "#afc4db" attr: "b" }
    shape_table: { fg: "#7587a6" attr: "b" }
    shape_variable: "#9b859d"

    background: "#1e1e1e"
    foreground: "#a7a7a7"
    cursor: "#a7a7a7"
}}