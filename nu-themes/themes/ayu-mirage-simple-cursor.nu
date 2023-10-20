export def main [] { return {
    separator: "#c7c7c7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a6cc70" attr: "b" }
    empty: "#6dcbfa"
    bool: {|| if $in { "#95e6cb" } else { "light_gray" } }
    int: "#c7c7c7"
    filesize: {|e|
        if $e == 0b {
            "#c7c7c7"
        } else if $e < 1mb {
            "#90e1c6"
        } else {{ fg: "#6dcbfa" }}
    }
    duration: "#c7c7c7"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ed8274" attr: "b" }
        } else if $in < 6hr {
            "#ed8274"
        } else if $in < 1day {
            "#fad07b"
        } else if $in < 3day {
            "#a6cc70"
        } else if $in < 1wk {
            { fg: "#a6cc70" attr: "b" }
        } else if $in < 6wk {
            "#90e1c6"
        } else if $in < 52wk {
            "#6dcbfa"
        } else { "dark_gray" }
    }
    range: "#c7c7c7"
    float: "#c7c7c7"
    string: "#c7c7c7"
    nothing: "#c7c7c7"
    binary: "#c7c7c7"
    cellpath: "#c7c7c7"
    row_index: { fg: "#a6cc70" attr: "b" }
    record: "#c7c7c7"
    list: "#c7c7c7"
    block: "#c7c7c7"
    hints: "dark_gray"
    search_result: { fg: "#ed8274" bg: "#c7c7c7" }

    shape_and: { fg: "#cfbafa" attr: "b" }
    shape_binary: { fg: "#cfbafa" attr: "b" }
    shape_block: { fg: "#6dcbfa" attr: "b" }
    shape_bool: "#95e6cb"
    shape_custom: "#a6cc70"
    shape_datetime: { fg: "#90e1c6" attr: "b" }
    shape_directory: "#90e1c6"
    shape_external: "#90e1c6"
    shape_externalarg: { fg: "#a6cc70" attr: "b" }
    shape_filepath: "#90e1c6"
    shape_flag: { fg: "#6dcbfa" attr: "b" }
    shape_float: { fg: "#cfbafa" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#90e1c6" attr: "b" }
    shape_int: { fg: "#cfbafa" attr: "b" }
    shape_internalcall: { fg: "#90e1c6" attr: "b" }
    shape_list: { fg: "#90e1c6" attr: "b" }
    shape_literal: "#6dcbfa"
    shape_match_pattern: "#a6cc70"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#95e6cb"
    shape_operator: "#fad07b"
    shape_or: { fg: "#cfbafa" attr: "b" }
    shape_pipe: { fg: "#cfbafa" attr: "b" }
    shape_range: { fg: "#fad07b" attr: "b" }
    shape_record: { fg: "#90e1c6" attr: "b" }
    shape_redirection: { fg: "#cfbafa" attr: "b" }
    shape_signature: { fg: "#a6cc70" attr: "b" }
    shape_string: "#a6cc70"
    shape_string_interpolation: { fg: "#90e1c6" attr: "b" }
    shape_table: { fg: "#6dcbfa" attr: "b" }
    shape_variable: "#cfbafa"

    background: "#212733"
    foreground: "#d9d7ce"
    cursor: "#d9d7ce"
}}