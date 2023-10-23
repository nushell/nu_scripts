export def main [] { return {
    separator: "#c6c6c6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#87af5f" attr: "b" }
    empty: "#87afd7"
    bool: {|| if $in { "#5fd7d7" } else { "light_gray" } }
    int: "#c6c6c6"
    filesize: {|e|
        if $e == 0b {
            "#c6c6c6"
        } else if $e < 1mb {
            "#87d7d7"
        } else {{ fg: "#87afd7" }}
    }
    duration: "#c6c6c6"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d78787" attr: "b" }
        } else if $in < 6hr {
            "#d78787"
        } else if $in < 1day {
            "#d7d7af"
        } else if $in < 3day {
            "#87af5f"
        } else if $in < 1wk {
            { fg: "#87af5f" attr: "b" }
        } else if $in < 6wk {
            "#87d7d7"
        } else if $in < 52wk {
            "#87afd7"
        } else { "dark_gray" }
    }
    range: "#c6c6c6"
    float: "#c6c6c6"
    string: "#c6c6c6"
    nothing: "#c6c6c6"
    binary: "#c6c6c6"
    cellpath: "#c6c6c6"
    row_index: { fg: "#87af5f" attr: "b" }
    record: "#c6c6c6"
    list: "#c6c6c6"
    block: "#c6c6c6"
    hints: "dark_gray"
    search_result: { fg: "#d78787" bg: "#c6c6c6" }

    shape_and: { fg: "#afafd7" attr: "b" }
    shape_binary: { fg: "#afafd7" attr: "b" }
    shape_block: { fg: "#87afd7" attr: "b" }
    shape_bool: "#5fd7d7"
    shape_custom: "#87af5f"
    shape_datetime: { fg: "#87d7d7" attr: "b" }
    shape_directory: "#87d7d7"
    shape_external: "#87d7d7"
    shape_externalarg: { fg: "#87af5f" attr: "b" }
    shape_filepath: "#87d7d7"
    shape_flag: { fg: "#87afd7" attr: "b" }
    shape_float: { fg: "#afafd7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#87d7d7" attr: "b" }
    shape_int: { fg: "#afafd7" attr: "b" }
    shape_internalcall: { fg: "#87d7d7" attr: "b" }
    shape_list: { fg: "#87d7d7" attr: "b" }
    shape_literal: "#87afd7"
    shape_match_pattern: "#87af5f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5fd7d7"
    shape_operator: "#d7d7af"
    shape_or: { fg: "#afafd7" attr: "b" }
    shape_pipe: { fg: "#afafd7" attr: "b" }
    shape_range: { fg: "#d7d7af" attr: "b" }
    shape_record: { fg: "#87d7d7" attr: "b" }
    shape_redirection: { fg: "#afafd7" attr: "b" }
    shape_signature: { fg: "#87af5f" attr: "b" }
    shape_string: "#87af5f"
    shape_string_interpolation: { fg: "#87d7d7" attr: "b" }
    shape_table: { fg: "#87afd7" attr: "b" }
    shape_variable: "#afafd7"

    background: "#262626"
    foreground: "#c6c6c6"
    cursor: "#c6c6c6"
}}