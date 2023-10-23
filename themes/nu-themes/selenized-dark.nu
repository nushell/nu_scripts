export def main [] { return {
    separator: "#72898f"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#75b938" attr: "b" }
    empty: "#4695f7"
    bool: {|| if $in { "#53d6c7" } else { "light_gray" } }
    int: "#72898f"
    filesize: {|e|
        if $e == 0b {
            "#72898f"
        } else if $e < 1mb {
            "#41c7b9"
        } else {{ fg: "#4695f7" }}
    }
    duration: "#72898f"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#fa5750" attr: "b" }
        } else if $in < 6hr {
            "#fa5750"
        } else if $in < 1day {
            "#dbb32d"
        } else if $in < 3day {
            "#75b938"
        } else if $in < 1wk {
            { fg: "#75b938" attr: "b" }
        } else if $in < 6wk {
            "#41c7b9"
        } else if $in < 52wk {
            "#4695f7"
        } else { "dark_gray" }
    }
    range: "#72898f"
    float: "#72898f"
    string: "#72898f"
    nothing: "#72898f"
    binary: "#72898f"
    cellpath: "#72898f"
    row_index: { fg: "#75b938" attr: "b" }
    record: "#72898f"
    list: "#72898f"
    block: "#72898f"
    hints: "dark_gray"
    search_result: { fg: "#fa5750" bg: "#72898f" }

    shape_and: { fg: "#f275be" attr: "b" }
    shape_binary: { fg: "#f275be" attr: "b" }
    shape_block: { fg: "#4695f7" attr: "b" }
    shape_bool: "#53d6c7"
    shape_custom: "#75b938"
    shape_datetime: { fg: "#41c7b9" attr: "b" }
    shape_directory: "#41c7b9"
    shape_external: "#41c7b9"
    shape_externalarg: { fg: "#75b938" attr: "b" }
    shape_filepath: "#41c7b9"
    shape_flag: { fg: "#4695f7" attr: "b" }
    shape_float: { fg: "#f275be" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#41c7b9" attr: "b" }
    shape_int: { fg: "#f275be" attr: "b" }
    shape_internalcall: { fg: "#41c7b9" attr: "b" }
    shape_list: { fg: "#41c7b9" attr: "b" }
    shape_literal: "#4695f7"
    shape_match_pattern: "#75b938"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#53d6c7"
    shape_operator: "#dbb32d"
    shape_or: { fg: "#f275be" attr: "b" }
    shape_pipe: { fg: "#f275be" attr: "b" }
    shape_range: { fg: "#dbb32d" attr: "b" }
    shape_record: { fg: "#41c7b9" attr: "b" }
    shape_redirection: { fg: "#f275be" attr: "b" }
    shape_signature: { fg: "#75b938" attr: "b" }
    shape_string: "#75b938"
    shape_string_interpolation: { fg: "#41c7b9" attr: "b" }
    shape_table: { fg: "#4695f7" attr: "b" }
    shape_variable: "#f275be"

    background: "#103c48"
    foreground: "#adbcbc"
    cursor: "#adbcbc"
}}