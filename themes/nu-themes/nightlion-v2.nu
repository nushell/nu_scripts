export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#04f623" attr: "b" }
    empty: "#64d0f0"
    bool: {|| if $in { "#00ccd8" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
        if $e == 0b {
            "#bbbbbb"
        } else if $e < 1mb {
            "#00dadf"
        } else {{ fg: "#64d0f0" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#bb0000" attr: "b" }
        } else if $in < 6hr {
            "#bb0000"
        } else if $in < 1day {
            "#f3f167"
        } else if $in < 3day {
            "#04f623"
        } else if $in < 1wk {
            { fg: "#04f623" attr: "b" }
        } else if $in < 6wk {
            "#00dadf"
        } else if $in < 52wk {
            "#64d0f0"
        } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#04f623" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"
    search_result: { fg: "#bb0000" bg: "#bbbbbb" }

    shape_and: { fg: "#ce6fdb" attr: "b" }
    shape_binary: { fg: "#ce6fdb" attr: "b" }
    shape_block: { fg: "#64d0f0" attr: "b" }
    shape_bool: "#00ccd8"
    shape_custom: "#04f623"
    shape_datetime: { fg: "#00dadf" attr: "b" }
    shape_directory: "#00dadf"
    shape_external: "#00dadf"
    shape_externalarg: { fg: "#04f623" attr: "b" }
    shape_filepath: "#00dadf"
    shape_flag: { fg: "#64d0f0" attr: "b" }
    shape_float: { fg: "#ce6fdb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00dadf" attr: "b" }
    shape_int: { fg: "#ce6fdb" attr: "b" }
    shape_internalcall: { fg: "#00dadf" attr: "b" }
    shape_list: { fg: "#00dadf" attr: "b" }
    shape_literal: "#64d0f0"
    shape_match_pattern: "#04f623"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00ccd8"
    shape_operator: "#f3f167"
    shape_or: { fg: "#ce6fdb" attr: "b" }
    shape_pipe: { fg: "#ce6fdb" attr: "b" }
    shape_range: { fg: "#f3f167" attr: "b" }
    shape_record: { fg: "#00dadf" attr: "b" }
    shape_redirection: { fg: "#ce6fdb" attr: "b" }
    shape_signature: { fg: "#04f623" attr: "b" }
    shape_string: "#04f623"
    shape_string_interpolation: { fg: "#00dadf" attr: "b" }
    shape_table: { fg: "#64d0f0" attr: "b" }
    shape_variable: "#ce6fdb"

    background: "#171717"
    foreground: "#bbbbbb"
    cursor: "#bbbbbb"
}}