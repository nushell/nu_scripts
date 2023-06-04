export def main [] { return {
    separator: "#a59ebd"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6ab539" attr: "b" }
    empty: "#4aaed3"
    bool: {|| if $in { "#2cbab6" } else { "light_gray" } }
    int: "#a59ebd"
    filesize: {|e|
        if $e == 0b {
            "#a59ebd"
        } else if $e < 1mb {
            "#29b3bb"
        } else {{ fg: "#4aaed3" }}
    }
    duration: "#a59ebd"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff778a" attr: "b" }
        } else if $in < 6hr {
            "#ff778a"
        } else if $in < 1day {
            "#bfa01a"
        } else if $in < 3day {
            "#6ab539"
        } else if $in < 1wk {
            { fg: "#6ab539" attr: "b" }
        } else if $in < 6wk {
            "#29b3bb"
        } else if $in < 52wk {
            "#4aaed3"
        } else { "dark_gray" }
    }
    range: "#a59ebd"
    float: "#a59ebd"
    string: "#a59ebd"
    nothing: "#a59ebd"
    binary: "#a59ebd"
    cellpath: "#a59ebd"
    row_index: { fg: "#6ab539" attr: "b" }
    record: "#a59ebd"
    list: "#a59ebd"
    block: "#a59ebd"
    hints: "dark_gray"
    search_result: { fg: "#ff778a" bg: "#a59ebd" }

    shape_and: { fg: "#e58a82" attr: "b" }
    shape_binary: { fg: "#e58a82" attr: "b" }
    shape_block: { fg: "#4aaed3" attr: "b" }
    shape_bool: "#2cbab6"
    shape_custom: "#6ab539"
    shape_datetime: { fg: "#29b3bb" attr: "b" }
    shape_directory: "#29b3bb"
    shape_external: "#29b3bb"
    shape_externalarg: { fg: "#6ab539" attr: "b" }
    shape_filepath: "#29b3bb"
    shape_flag: { fg: "#4aaed3" attr: "b" }
    shape_float: { fg: "#e58a82" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#29b3bb" attr: "b" }
    shape_int: { fg: "#e58a82" attr: "b" }
    shape_internalcall: { fg: "#29b3bb" attr: "b" }
    shape_list: { fg: "#29b3bb" attr: "b" }
    shape_literal: "#4aaed3"
    shape_match_pattern: "#6ab539"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2cbab6"
    shape_operator: "#bfa01a"
    shape_or: { fg: "#e58a82" attr: "b" }
    shape_pipe: { fg: "#e58a82" attr: "b" }
    shape_range: { fg: "#bfa01a" attr: "b" }
    shape_record: { fg: "#29b3bb" attr: "b" }
    shape_redirection: { fg: "#e58a82" attr: "b" }
    shape_signature: { fg: "#6ab539" attr: "b" }
    shape_string: "#6ab539"
    shape_string_interpolation: { fg: "#29b3bb" attr: "b" }
    shape_table: { fg: "#4aaed3" attr: "b" }
    shape_variable: "#e58a82"

    background: "#090a18"
    foreground: "#b4abac"
    cursor: "#b4abac"
}}