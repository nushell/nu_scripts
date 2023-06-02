export def main [] { return {
    separator: "#f2f2f2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6ab017" attr: "b" }
    empty: "#004f9e"
    bool: {|| if $in { "#4bb8fd" } else { "light_gray" } }
    int: "#f2f2f2"
    filesize: {|e|
        if $e == 0b {
            "#f2f2f2"
        } else if $e < 1mb {
            "#2aa7e7"
        } else {{ fg: "#004f9e" }}
    }
    duration: "#f2f2f2"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e1321a" attr: "b" }
        } else if $in < 6hr {
            "#e1321a"
        } else if $in < 1day {
            "#ffc005"
        } else if $in < 3day {
            "#6ab017"
        } else if $in < 1wk {
            { fg: "#6ab017" attr: "b" }
        } else if $in < 6wk {
            "#2aa7e7"
        } else if $in < 52wk {
            "#004f9e"
        } else { "dark_gray" }
    }
    range: "#f2f2f2"
    float: "#f2f2f2"
    string: "#f2f2f2"
    nothing: "#f2f2f2"
    binary: "#f2f2f2"
    cellpath: "#f2f2f2"
    row_index: { fg: "#6ab017" attr: "b" }
    record: "#f2f2f2"
    list: "#f2f2f2"
    block: "#f2f2f2"
    hints: "dark_gray"
    search_result: { fg: "#e1321a" bg: "#f2f2f2" }

    shape_and: { fg: "#ec0048" attr: "b" }
    shape_binary: { fg: "#ec0048" attr: "b" }
    shape_block: { fg: "#004f9e" attr: "b" }
    shape_bool: "#4bb8fd"
    shape_custom: "#6ab017"
    shape_datetime: { fg: "#2aa7e7" attr: "b" }
    shape_directory: "#2aa7e7"
    shape_external: "#2aa7e7"
    shape_externalarg: { fg: "#6ab017" attr: "b" }
    shape_filepath: "#2aa7e7"
    shape_flag: { fg: "#004f9e" attr: "b" }
    shape_float: { fg: "#ec0048" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2aa7e7" attr: "b" }
    shape_int: { fg: "#ec0048" attr: "b" }
    shape_internalcall: { fg: "#2aa7e7" attr: "b" }
    shape_list: { fg: "#2aa7e7" attr: "b" }
    shape_literal: "#004f9e"
    shape_match_pattern: "#6ab017"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4bb8fd"
    shape_operator: "#ffc005"
    shape_or: { fg: "#ec0048" attr: "b" }
    shape_pipe: { fg: "#ec0048" attr: "b" }
    shape_range: { fg: "#ffc005" attr: "b" }
    shape_record: { fg: "#2aa7e7" attr: "b" }
    shape_redirection: { fg: "#ec0048" attr: "b" }
    shape_signature: { fg: "#6ab017" attr: "b" }
    shape_string: "#6ab017"
    shape_string_interpolation: { fg: "#2aa7e7" attr: "b" }
    shape_table: { fg: "#004f9e" attr: "b" }
    shape_variable: "#ec0048"

    background: "#101010"
    foreground: "#f2f2f2"
    cursor: "#f2f2f2"
}}