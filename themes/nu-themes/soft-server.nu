export def main [] { return {
    separator: "#99a3a2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#9aa56a" attr: "b" }
    empty: "#6b8fa3"
    bool: {|| if $in { "#64e39c" } else { "light_gray" } }
    int: "#99a3a2"
    filesize: {|e|
        if $e == 0b {
            "#99a3a2"
        } else if $e < 1mb {
            "#6ba58f"
        } else {{ fg: "#6b8fa3" }}
    }
    duration: "#99a3a2"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a2686a" attr: "b" }
        } else if $in < 6hr {
            "#a2686a"
        } else if $in < 1day {
            "#a3906a"
        } else if $in < 3day {
            "#9aa56a"
        } else if $in < 1wk {
            { fg: "#9aa56a" attr: "b" }
        } else if $in < 6wk {
            "#6ba58f"
        } else if $in < 52wk {
            "#6b8fa3"
        } else { "dark_gray" }
    }
    range: "#99a3a2"
    float: "#99a3a2"
    string: "#99a3a2"
    nothing: "#99a3a2"
    binary: "#99a3a2"
    cellpath: "#99a3a2"
    row_index: { fg: "#9aa56a" attr: "b" }
    record: "#99a3a2"
    list: "#99a3a2"
    block: "#99a3a2"
    hints: "dark_gray"
    search_result: { fg: "#a2686a" bg: "#99a3a2" }

    shape_and: { fg: "#6a71a3" attr: "b" }
    shape_binary: { fg: "#6a71a3" attr: "b" }
    shape_block: { fg: "#6b8fa3" attr: "b" }
    shape_bool: "#64e39c"
    shape_custom: "#9aa56a"
    shape_datetime: { fg: "#6ba58f" attr: "b" }
    shape_directory: "#6ba58f"
    shape_external: "#6ba58f"
    shape_externalarg: { fg: "#9aa56a" attr: "b" }
    shape_filepath: "#6ba58f"
    shape_flag: { fg: "#6b8fa3" attr: "b" }
    shape_float: { fg: "#6a71a3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#6ba58f" attr: "b" }
    shape_int: { fg: "#6a71a3" attr: "b" }
    shape_internalcall: { fg: "#6ba58f" attr: "b" }
    shape_list: { fg: "#6ba58f" attr: "b" }
    shape_literal: "#6b8fa3"
    shape_match_pattern: "#9aa56a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#64e39c"
    shape_operator: "#a3906a"
    shape_or: { fg: "#6a71a3" attr: "b" }
    shape_pipe: { fg: "#6a71a3" attr: "b" }
    shape_range: { fg: "#a3906a" attr: "b" }
    shape_record: { fg: "#6ba58f" attr: "b" }
    shape_redirection: { fg: "#6a71a3" attr: "b" }
    shape_signature: { fg: "#9aa56a" attr: "b" }
    shape_string: "#9aa56a"
    shape_string_interpolation: { fg: "#6ba58f" attr: "b" }
    shape_table: { fg: "#6b8fa3" attr: "b" }
    shape_variable: "#6a71a3"

    background: "#242626"
    foreground: "#99a3a2"
    cursor: "#99a3a2"
}}