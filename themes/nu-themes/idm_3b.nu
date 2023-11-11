export def main [] { return {
    separator: "#606060"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#70d0a0" attr: "b" }
    empty: "#408aca"
    bool: {|| if $in { "#caa0f0" } else { "light_gray" } }
    int: "#606060"
    filesize: {|e|
        if $e == 0b {
            "#606060"
        } else if $e < 1mb {
            "#a070e0"
        } else {{ fg: "#408aca" }}
    }
    duration: "#606060"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b04060" attr: "b" }
        } else if $in < 6hr {
            "#b04060"
        } else if $in < 1day {
            "#ffb060"
        } else if $in < 3day {
            "#70d0a0"
        } else if $in < 1wk {
            { fg: "#70d0a0" attr: "b" }
        } else if $in < 6wk {
            "#a070e0"
        } else if $in < 52wk {
            "#408aca"
        } else { "dark_gray" }
    }
    range: "#606060"
    float: "#606060"
    string: "#606060"
    nothing: "#606060"
    binary: "#606060"
    cellpath: "#606060"
    row_index: { fg: "#70d0a0" attr: "b" }
    record: "#606060"
    list: "#606060"
    block: "#606060"
    hints: "dark_gray"
    search_result: { fg: "#b04060" bg: "#606060" }

    shape_and: { fg: "#ba5aba" attr: "b" }
    shape_binary: { fg: "#ba5aba" attr: "b" }
    shape_block: { fg: "#408aca" attr: "b" }
    shape_bool: "#caa0f0"
    shape_custom: "#70d0a0"
    shape_datetime: { fg: "#a070e0" attr: "b" }
    shape_directory: "#a070e0"
    shape_external: "#a070e0"
    shape_externalarg: { fg: "#70d0a0" attr: "b" }
    shape_filepath: "#a070e0"
    shape_flag: { fg: "#408aca" attr: "b" }
    shape_float: { fg: "#ba5aba" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#a070e0" attr: "b" }
    shape_int: { fg: "#ba5aba" attr: "b" }
    shape_internalcall: { fg: "#a070e0" attr: "b" }
    shape_list: { fg: "#a070e0" attr: "b" }
    shape_literal: "#408aca"
    shape_match_pattern: "#70d0a0"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#caa0f0"
    shape_operator: "#ffb060"
    shape_or: { fg: "#ba5aba" attr: "b" }
    shape_pipe: { fg: "#ba5aba" attr: "b" }
    shape_range: { fg: "#ffb060" attr: "b" }
    shape_record: { fg: "#a070e0" attr: "b" }
    shape_redirection: { fg: "#ba5aba" attr: "b" }
    shape_signature: { fg: "#70d0a0" attr: "b" }
    shape_string: "#70d0a0"
    shape_string_interpolation: { fg: "#a070e0" attr: "b" }
    shape_table: { fg: "#408aca" attr: "b" }
    shape_variable: "#ba5aba"

    background: "#200a28"
    foreground: "#ffcada"
    cursor: "#ffa0a0"
}}