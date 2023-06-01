export def main [] { return {
    separator: "#8b8792"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#2a9292" attr: "b" }
    empty: "#576ddb"
    bool: {|| if $in { "#398bc6" } else { "light_gray" } }
    int: "#8b8792"
    filesize: {|e|
        if $e == 0b {
            "#8b8792"
        } else if $e < 1mb {
            "#398bc6"
        } else {{ fg: "#576ddb" }}
    }
    duration: "#8b8792"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#be4678" attr: "b" }
        } else if $in < 6hr {
            "#be4678"
        } else if $in < 1day {
            "#a06e3b"
        } else if $in < 3day {
            "#2a9292"
        } else if $in < 1wk {
            { fg: "#2a9292" attr: "b" }
        } else if $in < 6wk {
            "#398bc6"
        } else if $in < 52wk {
            "#576ddb"
        } else { "dark_gray" }
    }
    range: "#8b8792"
    float: "#8b8792"
    string: "#8b8792"
    nothing: "#8b8792"
    binary: "#8b8792"
    cellpath: "#8b8792"
    row_index: { fg: "#2a9292" attr: "b" }
    record: "#8b8792"
    list: "#8b8792"
    block: "#8b8792"
    hints: "dark_gray"
    search_result: { fg: "#be4678" bg: "#8b8792" }

    shape_and: { fg: "#955ae7" attr: "b" }
    shape_binary: { fg: "#955ae7" attr: "b" }
    shape_block: { fg: "#576ddb" attr: "b" }
    shape_bool: "#398bc6"
    shape_custom: "#2a9292"
    shape_datetime: { fg: "#398bc6" attr: "b" }
    shape_directory: "#398bc6"
    shape_external: "#398bc6"
    shape_externalarg: { fg: "#2a9292" attr: "b" }
    shape_filepath: "#398bc6"
    shape_flag: { fg: "#576ddb" attr: "b" }
    shape_float: { fg: "#955ae7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#398bc6" attr: "b" }
    shape_int: { fg: "#955ae7" attr: "b" }
    shape_internalcall: { fg: "#398bc6" attr: "b" }
    shape_list: { fg: "#398bc6" attr: "b" }
    shape_literal: "#576ddb"
    shape_match_pattern: "#2a9292"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#398bc6"
    shape_operator: "#a06e3b"
    shape_or: { fg: "#955ae7" attr: "b" }
    shape_pipe: { fg: "#955ae7" attr: "b" }
    shape_range: { fg: "#a06e3b" attr: "b" }
    shape_record: { fg: "#398bc6" attr: "b" }
    shape_redirection: { fg: "#955ae7" attr: "b" }
    shape_signature: { fg: "#2a9292" attr: "b" }
    shape_string: "#2a9292"
    shape_string_interpolation: { fg: "#398bc6" attr: "b" }
    shape_table: { fg: "#576ddb" attr: "b" }
    shape_variable: "#955ae7"

    background: "#19171c"
    foreground: "#8b8792"
    cursor: "#8b8792"
}}