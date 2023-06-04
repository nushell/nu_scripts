export def main [] { return {
    separator: "#fafafa"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#fafafa" attr: "b" }
    empty: "#fafafa"
    bool: {|| if $in { "#fafafa" } else { "light_gray" } }
    int: "#fafafa"
    filesize: {|e|
        if $e == 0b {
            "#fafafa"
        } else if $e < 1mb {
            "#fafafa"
        } else {{ fg: "#fafafa" }}
    }
    duration: "#fafafa"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fafafa" attr: "b" }
        } else if $in < 6hr {
            "#fafafa"
        } else if $in < 1day {
            "#fafafa"
        } else if $in < 3day {
            "#fafafa"
        } else if $in < 1wk {
            { fg: "#fafafa" attr: "b" }
        } else if $in < 6wk {
            "#fafafa"
        } else if $in < 52wk {
            "#fafafa"
        } else { "dark_gray" }
    }
    range: "#fafafa"
    float: "#fafafa"
    string: "#fafafa"
    nothing: "#fafafa"
    binary: "#fafafa"
    cellpath: "#fafafa"
    row_index: { fg: "#fafafa" attr: "b" }
    record: "#fafafa"
    list: "#fafafa"
    block: "#fafafa"
    hints: "dark_gray"
    search_result: { fg: "#fafafa" bg: "#fafafa" }

    shape_and: { fg: "#fafafa" attr: "b" }
    shape_binary: { fg: "#fafafa" attr: "b" }
    shape_block: { fg: "#fafafa" attr: "b" }
    shape_bool: "#fafafa"
    shape_custom: "#fafafa"
    shape_datetime: { fg: "#fafafa" attr: "b" }
    shape_directory: "#fafafa"
    shape_external: "#fafafa"
    shape_externalarg: { fg: "#fafafa" attr: "b" }
    shape_filepath: "#fafafa"
    shape_flag: { fg: "#fafafa" attr: "b" }
    shape_float: { fg: "#fafafa" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#fafafa" attr: "b" }
    shape_int: { fg: "#fafafa" attr: "b" }
    shape_internalcall: { fg: "#fafafa" attr: "b" }
    shape_list: { fg: "#fafafa" attr: "b" }
    shape_literal: "#fafafa"
    shape_match_pattern: "#fafafa"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#fafafa"
    shape_operator: "#fafafa"
    shape_or: { fg: "#fafafa" attr: "b" }
    shape_pipe: { fg: "#fafafa" attr: "b" }
    shape_range: { fg: "#fafafa" attr: "b" }
    shape_record: { fg: "#fafafa" attr: "b" }
    shape_redirection: { fg: "#fafafa" attr: "b" }
    shape_signature: { fg: "#fafafa" attr: "b" }
    shape_string: "#fafafa"
    shape_string_interpolation: { fg: "#fafafa" attr: "b" }
    shape_table: { fg: "#fafafa" attr: "b" }
    shape_variable: "#fafafa"

    background: "#262626"
    foreground: "#fafafa"
    cursor: "#fafafa"
}}