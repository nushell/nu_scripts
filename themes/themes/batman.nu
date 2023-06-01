export def main [] { return {
    separator: "#c5c5be"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#c8be46" attr: "b" }
    empty: "#737074"
    bool: {|| if $in { "#a2a2a5" } else { "light_gray" } }
    int: "#c5c5be"
    filesize: {|e|
        if $e == 0b {
            "#c5c5be"
        } else if $e < 1mb {
            "#615f5e"
        } else {{ fg: "#737074" }}
    }
    duration: "#c5c5be"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e6db43" attr: "b" }
        } else if $in < 6hr {
            "#e6db43"
        } else if $in < 1day {
            "#f3fd21"
        } else if $in < 3day {
            "#c8be46"
        } else if $in < 1wk {
            { fg: "#c8be46" attr: "b" }
        } else if $in < 6wk {
            "#615f5e"
        } else if $in < 52wk {
            "#737074"
        } else { "dark_gray" }
    }
    range: "#c5c5be"
    float: "#c5c5be"
    string: "#c5c5be"
    nothing: "#c5c5be"
    binary: "#c5c5be"
    cellpath: "#c5c5be"
    row_index: { fg: "#c8be46" attr: "b" }
    record: "#c5c5be"
    list: "#c5c5be"
    block: "#c5c5be"
    hints: "dark_gray"
    search_result: { fg: "#e6db43" bg: "#c5c5be" }

    shape_and: { fg: "#737271" attr: "b" }
    shape_binary: { fg: "#737271" attr: "b" }
    shape_block: { fg: "#737074" attr: "b" }
    shape_bool: "#a2a2a5"
    shape_custom: "#c8be46"
    shape_datetime: { fg: "#615f5e" attr: "b" }
    shape_directory: "#615f5e"
    shape_external: "#615f5e"
    shape_externalarg: { fg: "#c8be46" attr: "b" }
    shape_filepath: "#615f5e"
    shape_flag: { fg: "#737074" attr: "b" }
    shape_float: { fg: "#737271" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#615f5e" attr: "b" }
    shape_int: { fg: "#737271" attr: "b" }
    shape_internalcall: { fg: "#615f5e" attr: "b" }
    shape_list: { fg: "#615f5e" attr: "b" }
    shape_literal: "#737074"
    shape_match_pattern: "#c8be46"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a2a2a5"
    shape_operator: "#f3fd21"
    shape_or: { fg: "#737271" attr: "b" }
    shape_pipe: { fg: "#737271" attr: "b" }
    shape_range: { fg: "#f3fd21" attr: "b" }
    shape_record: { fg: "#615f5e" attr: "b" }
    shape_redirection: { fg: "#737271" attr: "b" }
    shape_signature: { fg: "#c8be46" attr: "b" }
    shape_string: "#c8be46"
    shape_string_interpolation: { fg: "#615f5e" attr: "b" }
    shape_table: { fg: "#737074" attr: "b" }
    shape_variable: "#737271"

    background: "#1b1d1e"
    foreground: "#6e6e6e"
    cursor: "#fcee0b"
}}