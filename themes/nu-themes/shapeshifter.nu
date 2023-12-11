export def main [] { return {
    separator: "#102015"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#0ed839" attr: "b" }
    empty: "#3b48e3"
    bool: {|| if $in { "#23edda" } else { "light_gray" } }
    int: "#102015"
    filesize: {|e|
        if $e == 0b {
            "#102015"
        } else if $e < 1mb {
            "#23edda"
        } else {{ fg: "#3b48e3" }}
    }
    duration: "#102015"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e92f2f" attr: "b" }
        } else if $in < 6hr {
            "#e92f2f"
        } else if $in < 1day {
            "#dddd13"
        } else if $in < 3day {
            "#0ed839"
        } else if $in < 1wk {
            { fg: "#0ed839" attr: "b" }
        } else if $in < 6wk {
            "#23edda"
        } else if $in < 52wk {
            "#3b48e3"
        } else { "dark_gray" }
    }
    range: "#102015"
    float: "#102015"
    string: "#102015"
    nothing: "#102015"
    binary: "#102015"
    cellpath: "#102015"
    row_index: { fg: "#0ed839" attr: "b" }
    record: "#102015"
    list: "#102015"
    block: "#102015"
    hints: "dark_gray"
    search_result: { fg: "#e92f2f" bg: "#102015" }

    shape_and: { fg: "#f996e2" attr: "b" }
    shape_binary: { fg: "#f996e2" attr: "b" }
    shape_block: { fg: "#3b48e3" attr: "b" }
    shape_bool: "#23edda"
    shape_custom: "#0ed839"
    shape_datetime: { fg: "#23edda" attr: "b" }
    shape_directory: "#23edda"
    shape_external: "#23edda"
    shape_externalarg: { fg: "#0ed839" attr: "b" }
    shape_filepath: "#23edda"
    shape_flag: { fg: "#3b48e3" attr: "b" }
    shape_float: { fg: "#f996e2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#23edda" attr: "b" }
    shape_int: { fg: "#f996e2" attr: "b" }
    shape_internalcall: { fg: "#23edda" attr: "b" }
    shape_list: { fg: "#23edda" attr: "b" }
    shape_literal: "#3b48e3"
    shape_match_pattern: "#0ed839"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#23edda"
    shape_operator: "#dddd13"
    shape_or: { fg: "#f996e2" attr: "b" }
    shape_pipe: { fg: "#f996e2" attr: "b" }
    shape_range: { fg: "#dddd13" attr: "b" }
    shape_record: { fg: "#23edda" attr: "b" }
    shape_redirection: { fg: "#f996e2" attr: "b" }
    shape_signature: { fg: "#0ed839" attr: "b" }
    shape_string: "#0ed839"
    shape_string_interpolation: { fg: "#23edda" attr: "b" }
    shape_table: { fg: "#3b48e3" attr: "b" }
    shape_variable: "#f996e2"

    background: "#f9f9f9"
    foreground: "#102015"
    cursor: "#102015"
}}