export def main [] { return {
    separator: "#b9b5b8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8fc13e" attr: "b" }
    empty: "#1290bf"
    bool: {|| if $in { "#149b93" } else { "light_gray" } }
    int: "#b9b5b8"
    filesize: {|e|
        if $e == 0b {
            "#b9b5b8"
        } else if $e < 1mb {
            "#149b93"
        } else {{ fg: "#1290bf" }}
    }
    duration: "#b9b5b8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#dd464c" attr: "b" }
        } else if $in < 6hr {
            "#dd464c"
        } else if $in < 1day {
            "#fdcc59"
        } else if $in < 3day {
            "#8fc13e"
        } else if $in < 1wk {
            { fg: "#8fc13e" attr: "b" }
        } else if $in < 6wk {
            "#149b93"
        } else if $in < 52wk {
            "#1290bf"
        } else { "dark_gray" }
    }
    range: "#b9b5b8"
    float: "#b9b5b8"
    string: "#b9b5b8"
    nothing: "#b9b5b8"
    binary: "#b9b5b8"
    cellpath: "#b9b5b8"
    row_index: { fg: "#8fc13e" attr: "b" }
    record: "#b9b5b8"
    list: "#b9b5b8"
    block: "#b9b5b8"
    hints: "dark_gray"
    search_result: { fg: "#dd464c" bg: "#b9b5b8" }

    shape_and: { fg: "#c85e7c" attr: "b" }
    shape_binary: { fg: "#c85e7c" attr: "b" }
    shape_block: { fg: "#1290bf" attr: "b" }
    shape_bool: "#149b93"
    shape_custom: "#8fc13e"
    shape_datetime: { fg: "#149b93" attr: "b" }
    shape_directory: "#149b93"
    shape_external: "#149b93"
    shape_externalarg: { fg: "#8fc13e" attr: "b" }
    shape_filepath: "#149b93"
    shape_flag: { fg: "#1290bf" attr: "b" }
    shape_float: { fg: "#c85e7c" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#149b93" attr: "b" }
    shape_int: { fg: "#c85e7c" attr: "b" }
    shape_internalcall: { fg: "#149b93" attr: "b" }
    shape_list: { fg: "#149b93" attr: "b" }
    shape_literal: "#1290bf"
    shape_match_pattern: "#8fc13e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#149b93"
    shape_operator: "#fdcc59"
    shape_or: { fg: "#c85e7c" attr: "b" }
    shape_pipe: { fg: "#c85e7c" attr: "b" }
    shape_range: { fg: "#fdcc59" attr: "b" }
    shape_record: { fg: "#149b93" attr: "b" }
    shape_redirection: { fg: "#c85e7c" attr: "b" }
    shape_signature: { fg: "#8fc13e" attr: "b" }
    shape_string: "#8fc13e"
    shape_string_interpolation: { fg: "#149b93" attr: "b" }
    shape_table: { fg: "#1290bf" attr: "b" }
    shape_variable: "#c85e7c"

    background: "#322931"
    foreground: "#b9b5b8"
    cursor: "#b9b5b8"
}}