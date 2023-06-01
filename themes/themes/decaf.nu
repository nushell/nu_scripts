export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#beda78" attr: "b" }
    empty: "#90bee1"
    bool: {|| if $in { "#bed6ff" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
        if $e == 0b {
            "#cccccc"
        } else if $e < 1mb {
            "#bed6ff"
        } else {{ fg: "#90bee1" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff7f7b" attr: "b" }
        } else if $in < 6hr {
            "#ff7f7b"
        } else if $in < 1day {
            "#ffd67c"
        } else if $in < 3day {
            "#beda78"
        } else if $in < 1wk {
            { fg: "#beda78" attr: "b" }
        } else if $in < 6wk {
            "#bed6ff"
        } else if $in < 52wk {
            "#90bee1"
        } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#beda78" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"
    search_result: { fg: "#ff7f7b" bg: "#cccccc" }

    shape_and: { fg: "#efb3f7" attr: "b" }
    shape_binary: { fg: "#efb3f7" attr: "b" }
    shape_block: { fg: "#90bee1" attr: "b" }
    shape_bool: "#bed6ff"
    shape_custom: "#beda78"
    shape_datetime: { fg: "#bed6ff" attr: "b" }
    shape_directory: "#bed6ff"
    shape_external: "#bed6ff"
    shape_externalarg: { fg: "#beda78" attr: "b" }
    shape_filepath: "#bed6ff"
    shape_flag: { fg: "#90bee1" attr: "b" }
    shape_float: { fg: "#efb3f7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#bed6ff" attr: "b" }
    shape_int: { fg: "#efb3f7" attr: "b" }
    shape_internalcall: { fg: "#bed6ff" attr: "b" }
    shape_list: { fg: "#bed6ff" attr: "b" }
    shape_literal: "#90bee1"
    shape_match_pattern: "#beda78"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#bed6ff"
    shape_operator: "#ffd67c"
    shape_or: { fg: "#efb3f7" attr: "b" }
    shape_pipe: { fg: "#efb3f7" attr: "b" }
    shape_range: { fg: "#ffd67c" attr: "b" }
    shape_record: { fg: "#bed6ff" attr: "b" }
    shape_redirection: { fg: "#efb3f7" attr: "b" }
    shape_signature: { fg: "#beda78" attr: "b" }
    shape_string: "#beda78"
    shape_string_interpolation: { fg: "#bed6ff" attr: "b" }
    shape_table: { fg: "#90bee1" attr: "b" }
    shape_variable: "#efb3f7"

    background: "#2d2d2d"
    foreground: "#cccccc"
    cursor: "#cccccc"
}}