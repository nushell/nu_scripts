export def main [] { return {
    separator: "#918988"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a9ee55" attr: "b" }
    empty: "#5ea2ec"
    bool: {|| if $in { "#81eeb2" } else { "light_gray" } }
    int: "#918988"
    filesize: {|e|
        if $e == 0b {
            "#918988"
        } else if $e < 1mb {
            "#5eeea0"
        } else {{ fg: "#5ea2ec" }}
    }
    duration: "#918988"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f557a0" attr: "b" }
        } else if $in < 6hr {
            "#f557a0"
        } else if $in < 1day {
            "#f5a255"
        } else if $in < 3day {
            "#a9ee55"
        } else if $in < 1wk {
            { fg: "#a9ee55" attr: "b" }
        } else if $in < 6wk {
            "#5eeea0"
        } else if $in < 52wk {
            "#5ea2ec"
        } else { "dark_gray" }
    }
    range: "#918988"
    float: "#918988"
    string: "#918988"
    nothing: "#918988"
    binary: "#918988"
    cellpath: "#918988"
    row_index: { fg: "#a9ee55" attr: "b" }
    record: "#918988"
    list: "#918988"
    block: "#918988"
    hints: "dark_gray"
    search_result: { fg: "#f557a0" bg: "#918988" }

    shape_and: { fg: "#a957ec" attr: "b" }
    shape_binary: { fg: "#a957ec" attr: "b" }
    shape_block: { fg: "#5ea2ec" attr: "b" }
    shape_bool: "#81eeb2"
    shape_custom: "#a9ee55"
    shape_datetime: { fg: "#5eeea0" attr: "b" }
    shape_directory: "#5eeea0"
    shape_external: "#5eeea0"
    shape_externalarg: { fg: "#a9ee55" attr: "b" }
    shape_filepath: "#5eeea0"
    shape_flag: { fg: "#5ea2ec" attr: "b" }
    shape_float: { fg: "#a957ec" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5eeea0" attr: "b" }
    shape_int: { fg: "#a957ec" attr: "b" }
    shape_internalcall: { fg: "#5eeea0" attr: "b" }
    shape_list: { fg: "#5eeea0" attr: "b" }
    shape_literal: "#5ea2ec"
    shape_match_pattern: "#a9ee55"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#81eeb2"
    shape_operator: "#f5a255"
    shape_or: { fg: "#a957ec" attr: "b" }
    shape_pipe: { fg: "#a957ec" attr: "b" }
    shape_range: { fg: "#f5a255" attr: "b" }
    shape_record: { fg: "#5eeea0" attr: "b" }
    shape_redirection: { fg: "#a957ec" attr: "b" }
    shape_signature: { fg: "#a9ee55" attr: "b" }
    shape_string: "#a9ee55"
    shape_string_interpolation: { fg: "#5eeea0" attr: "b" }
    shape_table: { fg: "#5ea2ec" attr: "b" }
    shape_variable: "#a957ec"

    background: "#012849"
    foreground: "#a9bed8"
    cursor: "#a9bed8"
}}