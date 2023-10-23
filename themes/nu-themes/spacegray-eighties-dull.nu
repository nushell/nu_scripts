export def main [] { return {
    separator: "#b3b8c3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#92b477" attr: "b" }
    empty: "#7c8fa5"
    bool: {|| if $in { "#58c2c1" } else { "light_gray" } }
    int: "#b3b8c3"
    filesize: {|e|
        if $e == 0b {
            "#b3b8c3"
        } else if $e < 1mb {
            "#80cdcb"
        } else {{ fg: "#7c8fa5" }}
    }
    duration: "#b3b8c3"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b24a56" attr: "b" }
        } else if $in < 6hr {
            "#b24a56"
        } else if $in < 1day {
            "#c6735a"
        } else if $in < 3day {
            "#92b477"
        } else if $in < 1wk {
            { fg: "#92b477" attr: "b" }
        } else if $in < 6wk {
            "#80cdcb"
        } else if $in < 52wk {
            "#7c8fa5"
        } else { "dark_gray" }
    }
    range: "#b3b8c3"
    float: "#b3b8c3"
    string: "#b3b8c3"
    nothing: "#b3b8c3"
    binary: "#b3b8c3"
    cellpath: "#b3b8c3"
    row_index: { fg: "#92b477" attr: "b" }
    record: "#b3b8c3"
    list: "#b3b8c3"
    block: "#b3b8c3"
    hints: "dark_gray"
    search_result: { fg: "#b24a56" bg: "#b3b8c3" }

    shape_and: { fg: "#a5789e" attr: "b" }
    shape_binary: { fg: "#a5789e" attr: "b" }
    shape_block: { fg: "#7c8fa5" attr: "b" }
    shape_bool: "#58c2c1"
    shape_custom: "#92b477"
    shape_datetime: { fg: "#80cdcb" attr: "b" }
    shape_directory: "#80cdcb"
    shape_external: "#80cdcb"
    shape_externalarg: { fg: "#92b477" attr: "b" }
    shape_filepath: "#80cdcb"
    shape_flag: { fg: "#7c8fa5" attr: "b" }
    shape_float: { fg: "#a5789e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#80cdcb" attr: "b" }
    shape_int: { fg: "#a5789e" attr: "b" }
    shape_internalcall: { fg: "#80cdcb" attr: "b" }
    shape_list: { fg: "#80cdcb" attr: "b" }
    shape_literal: "#7c8fa5"
    shape_match_pattern: "#92b477"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#58c2c1"
    shape_operator: "#c6735a"
    shape_or: { fg: "#a5789e" attr: "b" }
    shape_pipe: { fg: "#a5789e" attr: "b" }
    shape_range: { fg: "#c6735a" attr: "b" }
    shape_record: { fg: "#80cdcb" attr: "b" }
    shape_redirection: { fg: "#a5789e" attr: "b" }
    shape_signature: { fg: "#92b477" attr: "b" }
    shape_string: "#92b477"
    shape_string_interpolation: { fg: "#80cdcb" attr: "b" }
    shape_table: { fg: "#7c8fa5" attr: "b" }
    shape_variable: "#a5789e"

    background: "#222222"
    foreground: "#c9c6bc"
    cursor: "#c9c6bc"
}}