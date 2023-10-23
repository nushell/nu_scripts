export def main [] { return {
    separator: "#f2f2f2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00dd6f" attr: "b" }
    empty: "#6f00dd"
    bool: {|| if $in { "#74b9ff" } else { "light_gray" } }
    int: "#f2f2f2"
    filesize: {|e|
        if $e == 0b {
            "#f2f2f2"
        } else if $e < 1mb {
            "#006fdd"
        } else {{ fg: "#6f00dd" }}
    }
    duration: "#f2f2f2"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#dd6f00" attr: "b" }
        } else if $in < 6hr {
            "#dd6f00"
        } else if $in < 1day {
            "#6fdd00"
        } else if $in < 3day {
            "#00dd6f"
        } else if $in < 1wk {
            { fg: "#00dd6f" attr: "b" }
        } else if $in < 6wk {
            "#006fdd"
        } else if $in < 52wk {
            "#6f00dd"
        } else { "dark_gray" }
    }
    range: "#f2f2f2"
    float: "#f2f2f2"
    string: "#f2f2f2"
    nothing: "#f2f2f2"
    binary: "#f2f2f2"
    cellpath: "#f2f2f2"
    row_index: { fg: "#00dd6f" attr: "b" }
    record: "#f2f2f2"
    list: "#f2f2f2"
    block: "#f2f2f2"
    hints: "dark_gray"
    search_result: { fg: "#dd6f00" bg: "#f2f2f2" }

    shape_and: { fg: "#dd006f" attr: "b" }
    shape_binary: { fg: "#dd006f" attr: "b" }
    shape_block: { fg: "#6f00dd" attr: "b" }
    shape_bool: "#74b9ff"
    shape_custom: "#00dd6f"
    shape_datetime: { fg: "#006fdd" attr: "b" }
    shape_directory: "#006fdd"
    shape_external: "#006fdd"
    shape_externalarg: { fg: "#00dd6f" attr: "b" }
    shape_filepath: "#006fdd"
    shape_flag: { fg: "#6f00dd" attr: "b" }
    shape_float: { fg: "#dd006f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#006fdd" attr: "b" }
    shape_int: { fg: "#dd006f" attr: "b" }
    shape_internalcall: { fg: "#006fdd" attr: "b" }
    shape_list: { fg: "#006fdd" attr: "b" }
    shape_literal: "#6f00dd"
    shape_match_pattern: "#00dd6f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#74b9ff"
    shape_operator: "#6fdd00"
    shape_or: { fg: "#dd006f" attr: "b" }
    shape_pipe: { fg: "#dd006f" attr: "b" }
    shape_range: { fg: "#6fdd00" attr: "b" }
    shape_record: { fg: "#006fdd" attr: "b" }
    shape_redirection: { fg: "#dd006f" attr: "b" }
    shape_signature: { fg: "#00dd6f" attr: "b" }
    shape_string: "#00dd6f"
    shape_string_interpolation: { fg: "#006fdd" attr: "b" }
    shape_table: { fg: "#6f00dd" attr: "b" }
    shape_variable: "#dd006f"

    background: "#758480"
    foreground: "#23476a"
    cursor: "#23476a"
}}