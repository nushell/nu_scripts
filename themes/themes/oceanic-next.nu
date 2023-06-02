export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#89bd82" attr: "b" }
    empty: "#5486c0"
    bool: {|| if $in { "#50a5a4" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#50a5a4"
        } else {{ fg: "#5486c0" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e44754" attr: "b" }
        } else if $in < 6hr {
            "#e44754"
        } else if $in < 1day {
            "#f7bd51"
        } else if $in < 3day {
            "#89bd82"
        } else if $in < 1wk {
            { fg: "#89bd82" attr: "b" }
        } else if $in < 6wk {
            "#50a5a4"
        } else if $in < 52wk {
            "#5486c0"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#89bd82" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#e44754" bg: "#ffffff" }

    shape_and: { fg: "#b77eb8" attr: "b" }
    shape_binary: { fg: "#b77eb8" attr: "b" }
    shape_block: { fg: "#5486c0" attr: "b" }
    shape_bool: "#50a5a4"
    shape_custom: "#89bd82"
    shape_datetime: { fg: "#50a5a4" attr: "b" }
    shape_directory: "#50a5a4"
    shape_external: "#50a5a4"
    shape_externalarg: { fg: "#89bd82" attr: "b" }
    shape_filepath: "#50a5a4"
    shape_flag: { fg: "#5486c0" attr: "b" }
    shape_float: { fg: "#b77eb8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#50a5a4" attr: "b" }
    shape_int: { fg: "#b77eb8" attr: "b" }
    shape_internalcall: { fg: "#50a5a4" attr: "b" }
    shape_list: { fg: "#50a5a4" attr: "b" }
    shape_literal: "#5486c0"
    shape_match_pattern: "#89bd82"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#50a5a4"
    shape_operator: "#f7bd51"
    shape_or: { fg: "#b77eb8" attr: "b" }
    shape_pipe: { fg: "#b77eb8" attr: "b" }
    shape_range: { fg: "#f7bd51" attr: "b" }
    shape_record: { fg: "#50a5a4" attr: "b" }
    shape_redirection: { fg: "#b77eb8" attr: "b" }
    shape_signature: { fg: "#89bd82" attr: "b" }
    shape_string: "#89bd82"
    shape_string_interpolation: { fg: "#50a5a4" attr: "b" }
    shape_table: { fg: "#5486c0" attr: "b" }
    shape_variable: "#b77eb8"

    background: "#121b21"
    foreground: "#b3b8c3"
    cursor: "#b3b8c3"
}}