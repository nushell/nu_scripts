export def main [] { return {
    separator: "#baa67f"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#519f50" attr: "b" }
    empty: "#2c78bf"
    bool: {|| if $in { "#2be4d0" } else { "light_gray" } }
    int: "#baa67f"
    filesize: {|e|
        if $e == 0b {
            "#baa67f"
        } else if $e < 1mb {
            "#0aaeb3"
        } else {{ fg: "#2c78bf" }}
    }
    duration: "#baa67f"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ef2f27" attr: "b" }
        } else if $in < 6hr {
            "#ef2f27"
        } else if $in < 1day {
            "#fbb829"
        } else if $in < 3day {
            "#519f50"
        } else if $in < 1wk {
            { fg: "#519f50" attr: "b" }
        } else if $in < 6wk {
            "#0aaeb3"
        } else if $in < 52wk {
            "#2c78bf"
        } else { "dark_gray" }
    }
    range: "#baa67f"
    float: "#baa67f"
    string: "#baa67f"
    nothing: "#baa67f"
    binary: "#baa67f"
    cellpath: "#baa67f"
    row_index: { fg: "#519f50" attr: "b" }
    record: "#baa67f"
    list: "#baa67f"
    block: "#baa67f"
    hints: "dark_gray"
    search_result: { fg: "#ef2f27" bg: "#baa67f" }

    shape_and: { fg: "#e02c6d" attr: "b" }
    shape_binary: { fg: "#e02c6d" attr: "b" }
    shape_block: { fg: "#2c78bf" attr: "b" }
    shape_bool: "#2be4d0"
    shape_custom: "#519f50"
    shape_datetime: { fg: "#0aaeb3" attr: "b" }
    shape_directory: "#0aaeb3"
    shape_external: "#0aaeb3"
    shape_externalarg: { fg: "#519f50" attr: "b" }
    shape_filepath: "#0aaeb3"
    shape_flag: { fg: "#2c78bf" attr: "b" }
    shape_float: { fg: "#e02c6d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0aaeb3" attr: "b" }
    shape_int: { fg: "#e02c6d" attr: "b" }
    shape_internalcall: { fg: "#0aaeb3" attr: "b" }
    shape_list: { fg: "#0aaeb3" attr: "b" }
    shape_literal: "#2c78bf"
    shape_match_pattern: "#519f50"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2be4d0"
    shape_operator: "#fbb829"
    shape_or: { fg: "#e02c6d" attr: "b" }
    shape_pipe: { fg: "#e02c6d" attr: "b" }
    shape_range: { fg: "#fbb829" attr: "b" }
    shape_record: { fg: "#0aaeb3" attr: "b" }
    shape_redirection: { fg: "#e02c6d" attr: "b" }
    shape_signature: { fg: "#519f50" attr: "b" }
    shape_string: "#519f50"
    shape_string_interpolation: { fg: "#0aaeb3" attr: "b" }
    shape_table: { fg: "#2c78bf" attr: "b" }
    shape_variable: "#e02c6d"

    background: "#1c1b19"
    foreground: "#fce8c3"
    cursor: "#fbb829"
}}