export def main [] { return {
    separator: "#fffef6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#e22828" attr: "b" }
    empty: "#2b3fff"
    bool: {|| if $in { "#6083ff" } else { "light_gray" } }
    int: "#fffef6"
    filesize: {|e|
        if $e == 0b {
            "#fffef6"
        } else if $e < 1mb {
            "#3255ff"
        } else {{ fg: "#2b3fff" }}
    }
    duration: "#fffef6"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e60712" attr: "b" }
        } else if $in < 6hr {
            "#e60712"
        } else if $in < 1day {
            "#e24655"
        } else if $in < 3day {
            "#e22828"
        } else if $in < 1wk {
            { fg: "#e22828" attr: "b" }
        } else if $in < 6wk {
            "#3255ff"
        } else if $in < 52wk {
            "#2b3fff"
        } else { "dark_gray" }
    }
    range: "#fffef6"
    float: "#fffef6"
    string: "#fffef6"
    nothing: "#fffef6"
    binary: "#fffef6"
    cellpath: "#fffef6"
    row_index: { fg: "#e22828" attr: "b" }
    record: "#fffef6"
    list: "#fffef6"
    block: "#fffef6"
    hints: "dark_gray"
    search_result: { fg: "#e60712" bg: "#fffef6" }

    shape_and: { fg: "#2435db" attr: "b" }
    shape_binary: { fg: "#2435db" attr: "b" }
    shape_block: { fg: "#2b3fff" attr: "b" }
    shape_bool: "#6083ff"
    shape_custom: "#e22828"
    shape_datetime: { fg: "#3255ff" attr: "b" }
    shape_directory: "#3255ff"
    shape_external: "#3255ff"
    shape_externalarg: { fg: "#e22828" attr: "b" }
    shape_filepath: "#3255ff"
    shape_flag: { fg: "#2b3fff" attr: "b" }
    shape_float: { fg: "#2435db" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3255ff" attr: "b" }
    shape_int: { fg: "#2435db" attr: "b" }
    shape_internalcall: { fg: "#3255ff" attr: "b" }
    shape_list: { fg: "#3255ff" attr: "b" }
    shape_literal: "#2b3fff"
    shape_match_pattern: "#e22828"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#6083ff"
    shape_operator: "#e24655"
    shape_or: { fg: "#2435db" attr: "b" }
    shape_pipe: { fg: "#2435db" attr: "b" }
    shape_range: { fg: "#e24655" attr: "b" }
    shape_record: { fg: "#3255ff" attr: "b" }
    shape_redirection: { fg: "#2435db" attr: "b" }
    shape_signature: { fg: "#e22828" attr: "b" }
    shape_string: "#e22828"
    shape_string_interpolation: { fg: "#3255ff" attr: "b" }
    shape_table: { fg: "#2b3fff" attr: "b" }
    shape_variable: "#2435db"

    background: "#1b1d1e"
    foreground: "#e2e2e2"
    cursor: "#2b3fff"
}}