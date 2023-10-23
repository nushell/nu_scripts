export def main [] { return {
    separator: "#545454"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00a800" attr: "b" }
    empty: "#0000a8"
    bool: {|| if $in { "#00a8a8" } else { "light_gray" } }
    int: "#545454"
    filesize: {|e|
        if $e == 0b {
            "#545454"
        } else if $e < 1mb {
            "#00a8a8"
        } else {{ fg: "#0000a8" }}
    }
    duration: "#545454"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#a80000" attr: "b" }
        } else if $in < 6hr {
            "#a80000"
        } else if $in < 1day {
            "#a85400"
        } else if $in < 3day {
            "#00a800"
        } else if $in < 1wk {
            { fg: "#00a800" attr: "b" }
        } else if $in < 6wk {
            "#00a8a8"
        } else if $in < 52wk {
            "#0000a8"
        } else { "dark_gray" }
    }
    range: "#545454"
    float: "#545454"
    string: "#545454"
    nothing: "#545454"
    binary: "#545454"
    cellpath: "#545454"
    row_index: { fg: "#00a800" attr: "b" }
    record: "#545454"
    list: "#545454"
    block: "#545454"
    hints: "dark_gray"
    search_result: { fg: "#a80000" bg: "#545454" }

    shape_and: { fg: "#a800a8" attr: "b" }
    shape_binary: { fg: "#a800a8" attr: "b" }
    shape_block: { fg: "#0000a8" attr: "b" }
    shape_bool: "#00a8a8"
    shape_custom: "#00a800"
    shape_datetime: { fg: "#00a8a8" attr: "b" }
    shape_directory: "#00a8a8"
    shape_external: "#00a8a8"
    shape_externalarg: { fg: "#00a800" attr: "b" }
    shape_filepath: "#00a8a8"
    shape_flag: { fg: "#0000a8" attr: "b" }
    shape_float: { fg: "#a800a8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00a8a8" attr: "b" }
    shape_int: { fg: "#a800a8" attr: "b" }
    shape_internalcall: { fg: "#00a8a8" attr: "b" }
    shape_list: { fg: "#00a8a8" attr: "b" }
    shape_literal: "#0000a8"
    shape_match_pattern: "#00a800"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00a8a8"
    shape_operator: "#a85400"
    shape_or: { fg: "#a800a8" attr: "b" }
    shape_pipe: { fg: "#a800a8" attr: "b" }
    shape_range: { fg: "#a85400" attr: "b" }
    shape_record: { fg: "#00a8a8" attr: "b" }
    shape_redirection: { fg: "#a800a8" attr: "b" }
    shape_signature: { fg: "#00a800" attr: "b" }
    shape_string: "#00a800"
    shape_string_interpolation: { fg: "#00a8a8" attr: "b" }
    shape_table: { fg: "#0000a8" attr: "b" }
    shape_variable: "#a800a8"

    background: "#fcfcfc"
    foreground: "#545454"
    cursor: "#545454"
}}