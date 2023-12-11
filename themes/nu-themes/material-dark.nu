export def main [] { return {
    separator: "#eeeeee"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#457b23" attr: "b" }
    empty: "#134eb2"
    bool: {|| if $in { "#26bad1" } else { "light_gray" } }
    int: "#eeeeee"
    filesize: {|e|
        if $e == 0b {
            "#eeeeee"
        } else if $e < 1mb {
            "#0e707c"
        } else {{ fg: "#134eb2" }}
    }
    duration: "#eeeeee"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b7141e" attr: "b" }
        } else if $in < 6hr {
            "#b7141e"
        } else if $in < 1day {
            "#f5971d"
        } else if $in < 3day {
            "#457b23"
        } else if $in < 1wk {
            { fg: "#457b23" attr: "b" }
        } else if $in < 6wk {
            "#0e707c"
        } else if $in < 52wk {
            "#134eb2"
        } else { "dark_gray" }
    }
    range: "#eeeeee"
    float: "#eeeeee"
    string: "#eeeeee"
    nothing: "#eeeeee"
    binary: "#eeeeee"
    cellpath: "#eeeeee"
    row_index: { fg: "#457b23" attr: "b" }
    record: "#eeeeee"
    list: "#eeeeee"
    block: "#eeeeee"
    hints: "dark_gray"
    search_result: { fg: "#b7141e" bg: "#eeeeee" }

    shape_and: { fg: "#550087" attr: "b" }
    shape_binary: { fg: "#550087" attr: "b" }
    shape_block: { fg: "#134eb2" attr: "b" }
    shape_bool: "#26bad1"
    shape_custom: "#457b23"
    shape_datetime: { fg: "#0e707c" attr: "b" }
    shape_directory: "#0e707c"
    shape_external: "#0e707c"
    shape_externalarg: { fg: "#457b23" attr: "b" }
    shape_filepath: "#0e707c"
    shape_flag: { fg: "#134eb2" attr: "b" }
    shape_float: { fg: "#550087" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0e707c" attr: "b" }
    shape_int: { fg: "#550087" attr: "b" }
    shape_internalcall: { fg: "#0e707c" attr: "b" }
    shape_list: { fg: "#0e707c" attr: "b" }
    shape_literal: "#134eb2"
    shape_match_pattern: "#457b23"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#26bad1"
    shape_operator: "#f5971d"
    shape_or: { fg: "#550087" attr: "b" }
    shape_pipe: { fg: "#550087" attr: "b" }
    shape_range: { fg: "#f5971d" attr: "b" }
    shape_record: { fg: "#0e707c" attr: "b" }
    shape_redirection: { fg: "#550087" attr: "b" }
    shape_signature: { fg: "#457b23" attr: "b" }
    shape_string: "#457b23"
    shape_string_interpolation: { fg: "#0e707c" attr: "b" }
    shape_table: { fg: "#134eb2" attr: "b" }
    shape_variable: "#550087"

    background: "#222221"
    foreground: "#e4e4e4"
    cursor: "#16aec9"
}}