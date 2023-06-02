export def main [] { return {
    separator: "#999999"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#739100" attr: "b" }
    empty: "#538091"
    bool: {|| if $in { "#85b2aa" } else { "light_gray" } }
    int: "#999999"
    filesize: {|e|
        if $e == 0b {
            "#999999"
        } else if $e < 1mb {
            "#538091"
        } else {{ fg: "#538091" }}
    }
    duration: "#999999"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff0055" attr: "b" }
        } else if $in < 6hr {
            "#ff0055"
        } else if $in < 1day {
            "#503d15"
        } else if $in < 3day {
            "#739100"
        } else if $in < 1wk {
            { fg: "#739100" attr: "b" }
        } else if $in < 6wk {
            "#538091"
        } else if $in < 52wk {
            "#538091"
        } else { "dark_gray" }
    }
    range: "#999999"
    float: "#999999"
    string: "#999999"
    nothing: "#999999"
    binary: "#999999"
    cellpath: "#999999"
    row_index: { fg: "#739100" attr: "b" }
    record: "#999999"
    list: "#999999"
    block: "#999999"
    hints: "dark_gray"
    search_result: { fg: "#ff0055" bg: "#999999" }

    shape_and: { fg: "#5b345e" attr: "b" }
    shape_binary: { fg: "#5b345e" attr: "b" }
    shape_block: { fg: "#538091" attr: "b" }
    shape_bool: "#85b2aa"
    shape_custom: "#739100"
    shape_datetime: { fg: "#538091" attr: "b" }
    shape_directory: "#538091"
    shape_external: "#538091"
    shape_externalarg: { fg: "#739100" attr: "b" }
    shape_filepath: "#538091"
    shape_flag: { fg: "#538091" attr: "b" }
    shape_float: { fg: "#5b345e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#538091" attr: "b" }
    shape_int: { fg: "#5b345e" attr: "b" }
    shape_internalcall: { fg: "#538091" attr: "b" }
    shape_list: { fg: "#538091" attr: "b" }
    shape_literal: "#538091"
    shape_match_pattern: "#739100"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#85b2aa"
    shape_operator: "#503d15"
    shape_or: { fg: "#5b345e" attr: "b" }
    shape_pipe: { fg: "#5b345e" attr: "b" }
    shape_range: { fg: "#503d15" attr: "b" }
    shape_record: { fg: "#538091" attr: "b" }
    shape_redirection: { fg: "#5b345e" attr: "b" }
    shape_signature: { fg: "#739100" attr: "b" }
    shape_string: "#739100"
    shape_string_interpolation: { fg: "#538091" attr: "b" }
    shape_table: { fg: "#538091" attr: "b" }
    shape_variable: "#5b345e"

    background: "#efefef"
    foreground: "#444444"
    cursor: "#ff0054"
}}