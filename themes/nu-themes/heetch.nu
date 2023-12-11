export def main [] { return {
    separator: "#bdb6c5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#c33678" attr: "b" }
    empty: "#bd0152"
    bool: {|| if $in { "#f80059" } else { "light_gray" } }
    int: "#bdb6c5"
    filesize: {|e|
        if $e == 0b {
            "#bdb6c5"
        } else if $e < 1mb {
            "#f80059"
        } else {{ fg: "#bd0152" }}
    }
    duration: "#bdb6c5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#27d9d5" attr: "b" }
        } else if $in < 6hr {
            "#27d9d5"
        } else if $in < 1day {
            "#8f6c97"
        } else if $in < 3day {
            "#c33678"
        } else if $in < 1wk {
            { fg: "#c33678" attr: "b" }
        } else if $in < 6wk {
            "#f80059"
        } else if $in < 52wk {
            "#bd0152"
        } else { "dark_gray" }
    }
    range: "#bdb6c5"
    float: "#bdb6c5"
    string: "#bdb6c5"
    nothing: "#bdb6c5"
    binary: "#bdb6c5"
    cellpath: "#bdb6c5"
    row_index: { fg: "#c33678" attr: "b" }
    record: "#bdb6c5"
    list: "#bdb6c5"
    block: "#bdb6c5"
    hints: "dark_gray"
    search_result: { fg: "#27d9d5" bg: "#bdb6c5" }

    shape_and: { fg: "#82034c" attr: "b" }
    shape_binary: { fg: "#82034c" attr: "b" }
    shape_block: { fg: "#bd0152" attr: "b" }
    shape_bool: "#f80059"
    shape_custom: "#c33678"
    shape_datetime: { fg: "#f80059" attr: "b" }
    shape_directory: "#f80059"
    shape_external: "#f80059"
    shape_externalarg: { fg: "#c33678" attr: "b" }
    shape_filepath: "#f80059"
    shape_flag: { fg: "#bd0152" attr: "b" }
    shape_float: { fg: "#82034c" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#f80059" attr: "b" }
    shape_int: { fg: "#82034c" attr: "b" }
    shape_internalcall: { fg: "#f80059" attr: "b" }
    shape_list: { fg: "#f80059" attr: "b" }
    shape_literal: "#bd0152"
    shape_match_pattern: "#c33678"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#f80059"
    shape_operator: "#8f6c97"
    shape_or: { fg: "#82034c" attr: "b" }
    shape_pipe: { fg: "#82034c" attr: "b" }
    shape_range: { fg: "#8f6c97" attr: "b" }
    shape_record: { fg: "#f80059" attr: "b" }
    shape_redirection: { fg: "#82034c" attr: "b" }
    shape_signature: { fg: "#c33678" attr: "b" }
    shape_string: "#c33678"
    shape_string_interpolation: { fg: "#f80059" attr: "b" }
    shape_table: { fg: "#bd0152" attr: "b" }
    shape_variable: "#82034c"

    background: "#190134"
    foreground: "#bdb6c5"
    cursor: "#bdb6c5"
}}