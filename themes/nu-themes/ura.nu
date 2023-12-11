export def main [] { return {
    separator: "#808080"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6fc21b" attr: "b" }
    empty: "#1b6fc2"
    bool: {|| if $in { "#84eeb9" } else { "light_gray" } }
    int: "#808080"
    filesize: {|e|
        if $e == 0b {
            "#808080"
        } else if $e < 1mb {
            "#1bc26f"
        } else {{ fg: "#1b6fc2" }}
    }
    duration: "#808080"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c21b6f" attr: "b" }
        } else if $in < 6hr {
            "#c21b6f"
        } else if $in < 1day {
            "#c26f1b"
        } else if $in < 3day {
            "#6fc21b"
        } else if $in < 1wk {
            { fg: "#6fc21b" attr: "b" }
        } else if $in < 6wk {
            "#1bc26f"
        } else if $in < 52wk {
            "#1b6fc2"
        } else { "dark_gray" }
    }
    range: "#808080"
    float: "#808080"
    string: "#808080"
    nothing: "#808080"
    binary: "#808080"
    cellpath: "#808080"
    row_index: { fg: "#6fc21b" attr: "b" }
    record: "#808080"
    list: "#808080"
    block: "#808080"
    hints: "dark_gray"
    search_result: { fg: "#c21b6f" bg: "#808080" }

    shape_and: { fg: "#6f1bc2" attr: "b" }
    shape_binary: { fg: "#6f1bc2" attr: "b" }
    shape_block: { fg: "#1b6fc2" attr: "b" }
    shape_bool: "#84eeb9"
    shape_custom: "#6fc21b"
    shape_datetime: { fg: "#1bc26f" attr: "b" }
    shape_directory: "#1bc26f"
    shape_external: "#1bc26f"
    shape_externalarg: { fg: "#6fc21b" attr: "b" }
    shape_filepath: "#1bc26f"
    shape_flag: { fg: "#1b6fc2" attr: "b" }
    shape_float: { fg: "#6f1bc2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1bc26f" attr: "b" }
    shape_int: { fg: "#6f1bc2" attr: "b" }
    shape_internalcall: { fg: "#1bc26f" attr: "b" }
    shape_list: { fg: "#1bc26f" attr: "b" }
    shape_literal: "#1b6fc2"
    shape_match_pattern: "#6fc21b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#84eeb9"
    shape_operator: "#c26f1b"
    shape_or: { fg: "#6f1bc2" attr: "b" }
    shape_pipe: { fg: "#6f1bc2" attr: "b" }
    shape_range: { fg: "#c26f1b" attr: "b" }
    shape_record: { fg: "#1bc26f" attr: "b" }
    shape_redirection: { fg: "#6f1bc2" attr: "b" }
    shape_signature: { fg: "#6fc21b" attr: "b" }
    shape_string: "#6fc21b"
    shape_string_interpolation: { fg: "#1bc26f" attr: "b" }
    shape_table: { fg: "#1b6fc2" attr: "b" }
    shape_variable: "#6f1bc2"

    background: "#feffee"
    foreground: "#23476a"
    cursor: "#23476a"
}}