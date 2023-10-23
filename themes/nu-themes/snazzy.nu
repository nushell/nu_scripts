export def main [] { return {
    separator: "#e2e4e5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5af78e" attr: "b" }
    empty: "#57c7ff"
    bool: {|| if $in { "#9aedfe" } else { "light_gray" } }
    int: "#e2e4e5"
    filesize: {|e|
        if $e == 0b {
            "#e2e4e5"
        } else if $e < 1mb {
            "#9aedfe"
        } else {{ fg: "#57c7ff" }}
    }
    duration: "#e2e4e5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff5c57" attr: "b" }
        } else if $in < 6hr {
            "#ff5c57"
        } else if $in < 1day {
            "#f3f99d"
        } else if $in < 3day {
            "#5af78e"
        } else if $in < 1wk {
            { fg: "#5af78e" attr: "b" }
        } else if $in < 6wk {
            "#9aedfe"
        } else if $in < 52wk {
            "#57c7ff"
        } else { "dark_gray" }
    }
    range: "#e2e4e5"
    float: "#e2e4e5"
    string: "#e2e4e5"
    nothing: "#e2e4e5"
    binary: "#e2e4e5"
    cellpath: "#e2e4e5"
    row_index: { fg: "#5af78e" attr: "b" }
    record: "#e2e4e5"
    list: "#e2e4e5"
    block: "#e2e4e5"
    hints: "dark_gray"
    search_result: { fg: "#ff5c57" bg: "#e2e4e5" }

    shape_and: { fg: "#ff6ac1" attr: "b" }
    shape_binary: { fg: "#ff6ac1" attr: "b" }
    shape_block: { fg: "#57c7ff" attr: "b" }
    shape_bool: "#9aedfe"
    shape_custom: "#5af78e"
    shape_datetime: { fg: "#9aedfe" attr: "b" }
    shape_directory: "#9aedfe"
    shape_external: "#9aedfe"
    shape_externalarg: { fg: "#5af78e" attr: "b" }
    shape_filepath: "#9aedfe"
    shape_flag: { fg: "#57c7ff" attr: "b" }
    shape_float: { fg: "#ff6ac1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#9aedfe" attr: "b" }
    shape_int: { fg: "#ff6ac1" attr: "b" }
    shape_internalcall: { fg: "#9aedfe" attr: "b" }
    shape_list: { fg: "#9aedfe" attr: "b" }
    shape_literal: "#57c7ff"
    shape_match_pattern: "#5af78e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#9aedfe"
    shape_operator: "#f3f99d"
    shape_or: { fg: "#ff6ac1" attr: "b" }
    shape_pipe: { fg: "#ff6ac1" attr: "b" }
    shape_range: { fg: "#f3f99d" attr: "b" }
    shape_record: { fg: "#9aedfe" attr: "b" }
    shape_redirection: { fg: "#ff6ac1" attr: "b" }
    shape_signature: { fg: "#5af78e" attr: "b" }
    shape_string: "#5af78e"
    shape_string_interpolation: { fg: "#9aedfe" attr: "b" }
    shape_table: { fg: "#57c7ff" attr: "b" }
    shape_variable: "#ff6ac1"

    background: "#282a36"
    foreground: "#e2e4e5"
    cursor: "#e2e4e5"
}}