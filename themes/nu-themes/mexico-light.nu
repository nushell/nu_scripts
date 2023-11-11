export def main [] { return {
    separator: "#383838"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#538947" attr: "b" }
    empty: "#7cafc2"
    bool: {|| if $in { "#4b8093" } else { "light_gray" } }
    int: "#383838"
    filesize: {|e|
        if $e == 0b {
            "#383838"
        } else if $e < 1mb {
            "#4b8093"
        } else {{ fg: "#7cafc2" }}
    }
    duration: "#383838"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ab4642" attr: "b" }
        } else if $in < 6hr {
            "#ab4642"
        } else if $in < 1day {
            "#f79a0e"
        } else if $in < 3day {
            "#538947"
        } else if $in < 1wk {
            { fg: "#538947" attr: "b" }
        } else if $in < 6wk {
            "#4b8093"
        } else if $in < 52wk {
            "#7cafc2"
        } else { "dark_gray" }
    }
    range: "#383838"
    float: "#383838"
    string: "#383838"
    nothing: "#383838"
    binary: "#383838"
    cellpath: "#383838"
    row_index: { fg: "#538947" attr: "b" }
    record: "#383838"
    list: "#383838"
    block: "#383838"
    hints: "dark_gray"
    search_result: { fg: "#ab4642" bg: "#383838" }

    shape_and: { fg: "#96609e" attr: "b" }
    shape_binary: { fg: "#96609e" attr: "b" }
    shape_block: { fg: "#7cafc2" attr: "b" }
    shape_bool: "#4b8093"
    shape_custom: "#538947"
    shape_datetime: { fg: "#4b8093" attr: "b" }
    shape_directory: "#4b8093"
    shape_external: "#4b8093"
    shape_externalarg: { fg: "#538947" attr: "b" }
    shape_filepath: "#4b8093"
    shape_flag: { fg: "#7cafc2" attr: "b" }
    shape_float: { fg: "#96609e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#4b8093" attr: "b" }
    shape_int: { fg: "#96609e" attr: "b" }
    shape_internalcall: { fg: "#4b8093" attr: "b" }
    shape_list: { fg: "#4b8093" attr: "b" }
    shape_literal: "#7cafc2"
    shape_match_pattern: "#538947"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4b8093"
    shape_operator: "#f79a0e"
    shape_or: { fg: "#96609e" attr: "b" }
    shape_pipe: { fg: "#96609e" attr: "b" }
    shape_range: { fg: "#f79a0e" attr: "b" }
    shape_record: { fg: "#4b8093" attr: "b" }
    shape_redirection: { fg: "#96609e" attr: "b" }
    shape_signature: { fg: "#538947" attr: "b" }
    shape_string: "#538947"
    shape_string_interpolation: { fg: "#4b8093" attr: "b" }
    shape_table: { fg: "#7cafc2" attr: "b" }
    shape_variable: "#96609e"

    background: "#f8f8f8"
    foreground: "#383838"
    cursor: "#383838"
}}