export def main [] { return {
    separator: "#dcdccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5f7f5f" attr: "b" }
    empty: "#7cb8bb"
    bool: {|| if $in { "#93e0e3" } else { "light_gray" } }
    int: "#dcdccc"
    filesize: {|e|
        if $e == 0b {
            "#dcdccc"
        } else if $e < 1mb {
            "#93e0e3"
        } else {{ fg: "#7cb8bb" }}
    }
    duration: "#dcdccc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#dca3a3" attr: "b" }
        } else if $in < 6hr {
            "#dca3a3"
        } else if $in < 1day {
            "#e0cf9f"
        } else if $in < 3day {
            "#5f7f5f"
        } else if $in < 1wk {
            { fg: "#5f7f5f" attr: "b" }
        } else if $in < 6wk {
            "#93e0e3"
        } else if $in < 52wk {
            "#7cb8bb"
        } else { "dark_gray" }
    }
    range: "#dcdccc"
    float: "#dcdccc"
    string: "#dcdccc"
    nothing: "#dcdccc"
    binary: "#dcdccc"
    cellpath: "#dcdccc"
    row_index: { fg: "#5f7f5f" attr: "b" }
    record: "#dcdccc"
    list: "#dcdccc"
    block: "#dcdccc"
    hints: "dark_gray"
    search_result: { fg: "#dca3a3" bg: "#dcdccc" }

    shape_and: { fg: "#dc8cc3" attr: "b" }
    shape_binary: { fg: "#dc8cc3" attr: "b" }
    shape_block: { fg: "#7cb8bb" attr: "b" }
    shape_bool: "#93e0e3"
    shape_custom: "#5f7f5f"
    shape_datetime: { fg: "#93e0e3" attr: "b" }
    shape_directory: "#93e0e3"
    shape_external: "#93e0e3"
    shape_externalarg: { fg: "#5f7f5f" attr: "b" }
    shape_filepath: "#93e0e3"
    shape_flag: { fg: "#7cb8bb" attr: "b" }
    shape_float: { fg: "#dc8cc3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#93e0e3" attr: "b" }
    shape_int: { fg: "#dc8cc3" attr: "b" }
    shape_internalcall: { fg: "#93e0e3" attr: "b" }
    shape_list: { fg: "#93e0e3" attr: "b" }
    shape_literal: "#7cb8bb"
    shape_match_pattern: "#5f7f5f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#93e0e3"
    shape_operator: "#e0cf9f"
    shape_or: { fg: "#dc8cc3" attr: "b" }
    shape_pipe: { fg: "#dc8cc3" attr: "b" }
    shape_range: { fg: "#e0cf9f" attr: "b" }
    shape_record: { fg: "#93e0e3" attr: "b" }
    shape_redirection: { fg: "#dc8cc3" attr: "b" }
    shape_signature: { fg: "#5f7f5f" attr: "b" }
    shape_string: "#5f7f5f"
    shape_string_interpolation: { fg: "#93e0e3" attr: "b" }
    shape_table: { fg: "#7cb8bb" attr: "b" }
    shape_variable: "#dc8cc3"

    background: "#383838"
    foreground: "#dcdccc"
    cursor: "#dcdccc"
}}