export def main [] { return {
    separator: "#d9d9d9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#10a778" attr: "b" }
    empty: "#008ec4"
    bool: {|| if $in { "#4fb8cc" } else { "light_gray" } }
    int: "#d9d9d9"
    filesize: {|e|
        if $e == 0b {
            "#d9d9d9"
        } else if $e < 1mb {
            "#20a5ba"
        } else {{ fg: "#008ec4" }}
    }
    duration: "#d9d9d9"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c30771" attr: "b" }
        } else if $in < 6hr {
            "#c30771"
        } else if $in < 1day {
            "#a89c14"
        } else if $in < 3day {
            "#10a778"
        } else if $in < 1wk {
            { fg: "#10a778" attr: "b" }
        } else if $in < 6wk {
            "#20a5ba"
        } else if $in < 52wk {
            "#008ec4"
        } else { "dark_gray" }
    }
    range: "#d9d9d9"
    float: "#d9d9d9"
    string: "#d9d9d9"
    nothing: "#d9d9d9"
    binary: "#d9d9d9"
    cellpath: "#d9d9d9"
    row_index: { fg: "#10a778" attr: "b" }
    record: "#d9d9d9"
    list: "#d9d9d9"
    block: "#d9d9d9"
    hints: "dark_gray"
    search_result: { fg: "#c30771" bg: "#d9d9d9" }

    shape_and: { fg: "#523c79" attr: "b" }
    shape_binary: { fg: "#523c79" attr: "b" }
    shape_block: { fg: "#008ec4" attr: "b" }
    shape_bool: "#4fb8cc"
    shape_custom: "#10a778"
    shape_datetime: { fg: "#20a5ba" attr: "b" }
    shape_directory: "#20a5ba"
    shape_external: "#20a5ba"
    shape_externalarg: { fg: "#10a778" attr: "b" }
    shape_filepath: "#20a5ba"
    shape_flag: { fg: "#008ec4" attr: "b" }
    shape_float: { fg: "#523c79" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#20a5ba" attr: "b" }
    shape_int: { fg: "#523c79" attr: "b" }
    shape_internalcall: { fg: "#20a5ba" attr: "b" }
    shape_list: { fg: "#20a5ba" attr: "b" }
    shape_literal: "#008ec4"
    shape_match_pattern: "#10a778"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4fb8cc"
    shape_operator: "#a89c14"
    shape_or: { fg: "#523c79" attr: "b" }
    shape_pipe: { fg: "#523c79" attr: "b" }
    shape_range: { fg: "#a89c14" attr: "b" }
    shape_record: { fg: "#20a5ba" attr: "b" }
    shape_redirection: { fg: "#523c79" attr: "b" }
    shape_signature: { fg: "#10a778" attr: "b" }
    shape_string: "#10a778"
    shape_string_interpolation: { fg: "#20a5ba" attr: "b" }
    shape_table: { fg: "#008ec4" attr: "b" }
    shape_variable: "#523c79"

    background: "#f1f1f1"
    foreground: "#424242"
    cursor: "#424242"
}}