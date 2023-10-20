export def main [] { return {
    separator: "#c0c0c0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#1fb714" attr: "b" }
    empty: "#0000d3"
    bool: {|| if $in { "#02abea" } else { "light_gray" } }
    int: "#c0c0c0"
    filesize: {|e|
        if $e == 0b {
            "#c0c0c0"
        } else if $e < 1mb {
            "#02abea"
        } else {{ fg: "#0000d3" }}
    }
    duration: "#c0c0c0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#dd0907" attr: "b" }
        } else if $in < 6hr {
            "#dd0907"
        } else if $in < 1day {
            "#fbf305"
        } else if $in < 3day {
            "#1fb714"
        } else if $in < 1wk {
            { fg: "#1fb714" attr: "b" }
        } else if $in < 6wk {
            "#02abea"
        } else if $in < 52wk {
            "#0000d3"
        } else { "dark_gray" }
    }
    range: "#c0c0c0"
    float: "#c0c0c0"
    string: "#c0c0c0"
    nothing: "#c0c0c0"
    binary: "#c0c0c0"
    cellpath: "#c0c0c0"
    row_index: { fg: "#1fb714" attr: "b" }
    record: "#c0c0c0"
    list: "#c0c0c0"
    block: "#c0c0c0"
    hints: "dark_gray"
    search_result: { fg: "#dd0907" bg: "#c0c0c0" }

    shape_and: { fg: "#4700a5" attr: "b" }
    shape_binary: { fg: "#4700a5" attr: "b" }
    shape_block: { fg: "#0000d3" attr: "b" }
    shape_bool: "#02abea"
    shape_custom: "#1fb714"
    shape_datetime: { fg: "#02abea" attr: "b" }
    shape_directory: "#02abea"
    shape_external: "#02abea"
    shape_externalarg: { fg: "#1fb714" attr: "b" }
    shape_filepath: "#02abea"
    shape_flag: { fg: "#0000d3" attr: "b" }
    shape_float: { fg: "#4700a5" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#02abea" attr: "b" }
    shape_int: { fg: "#4700a5" attr: "b" }
    shape_internalcall: { fg: "#02abea" attr: "b" }
    shape_list: { fg: "#02abea" attr: "b" }
    shape_literal: "#0000d3"
    shape_match_pattern: "#1fb714"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#02abea"
    shape_operator: "#fbf305"
    shape_or: { fg: "#4700a5" attr: "b" }
    shape_pipe: { fg: "#4700a5" attr: "b" }
    shape_range: { fg: "#fbf305" attr: "b" }
    shape_record: { fg: "#02abea" attr: "b" }
    shape_redirection: { fg: "#4700a5" attr: "b" }
    shape_signature: { fg: "#1fb714" attr: "b" }
    shape_string: "#1fb714"
    shape_string_interpolation: { fg: "#02abea" attr: "b" }
    shape_table: { fg: "#0000d3" attr: "b" }
    shape_variable: "#4700a5"

    background: "#000000"
    foreground: "#c0c0c0"
    cursor: "#c0c0c0"
}}