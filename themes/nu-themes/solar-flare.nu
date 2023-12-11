export def main [] { return {
    separator: "#A6AFB8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7CC844" attr: "b" }
    empty: "#33B5E1"
    bool: {|| if $in { "#52CBB0" } else { "light_gray" } }
    int: "#A6AFB8"
    filesize: {|e|
        if $e == 0b {
            "#A6AFB8"
        } else if $e < 1mb {
            "#52CBB0"
        } else {{ fg: "#33B5E1" }}
    }
    duration: "#A6AFB8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#EF5253" attr: "b" }
        } else if $in < 6hr {
            "#EF5253"
        } else if $in < 1day {
            "#E4B51C"
        } else if $in < 3day {
            "#7CC844"
        } else if $in < 1wk {
            { fg: "#7CC844" attr: "b" }
        } else if $in < 6wk {
            "#52CBB0"
        } else if $in < 52wk {
            "#33B5E1"
        } else { "dark_gray" }
    }
    range: "#A6AFB8"
    float: "#A6AFB8"
    string: "#A6AFB8"
    nothing: "#A6AFB8"
    binary: "#A6AFB8"
    cellpath: "#A6AFB8"
    row_index: { fg: "#7CC844" attr: "b" }
    record: "#A6AFB8"
    list: "#A6AFB8"
    block: "#A6AFB8"
    hints: "dark_gray"
    search_result: { fg: "#EF5253" bg: "#A6AFB8" }

    shape_and: { fg: "#A363D5" attr: "b" }
    shape_binary: { fg: "#A363D5" attr: "b" }
    shape_block: { fg: "#33B5E1" attr: "b" }
    shape_bool: "#52CBB0"
    shape_custom: "#7CC844"
    shape_datetime: { fg: "#52CBB0" attr: "b" }
    shape_directory: "#52CBB0"
    shape_external: "#52CBB0"
    shape_externalarg: { fg: "#7CC844" attr: "b" }
    shape_filepath: "#52CBB0"
    shape_flag: { fg: "#33B5E1" attr: "b" }
    shape_float: { fg: "#A363D5" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#52CBB0" attr: "b" }
    shape_int: { fg: "#A363D5" attr: "b" }
    shape_internalcall: { fg: "#52CBB0" attr: "b" }
    shape_list: { fg: "#52CBB0" attr: "b" }
    shape_literal: "#33B5E1"
    shape_match_pattern: "#7CC844"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#52CBB0"
    shape_operator: "#E4B51C"
    shape_or: { fg: "#A363D5" attr: "b" }
    shape_pipe: { fg: "#A363D5" attr: "b" }
    shape_range: { fg: "#E4B51C" attr: "b" }
    shape_record: { fg: "#52CBB0" attr: "b" }
    shape_redirection: { fg: "#A363D5" attr: "b" }
    shape_signature: { fg: "#7CC844" attr: "b" }
    shape_string: "#7CC844"
    shape_string_interpolation: { fg: "#52CBB0" attr: "b" }
    shape_table: { fg: "#33B5E1" attr: "b" }
    shape_variable: "#A363D5"

    background: "#18262F"
    foreground: "#A6AFB8"
    cursor: "#A6AFB8"
}}