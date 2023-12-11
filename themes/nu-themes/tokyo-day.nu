export def main [] { return {
    separator: "#6172b0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#587539" attr: "b" }
    empty: "#2e7de9"
    bool: {|| if $in { "#007197" } else { "light_gray" } }
    int: "#6172b0"
    filesize: {|e|
        if $e == 0b {
            "#6172b0"
        } else if $e < 1mb {
            "#007197"
        } else {{ fg: "#2e7de9" }}
    }
    duration: "#6172b0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f52a65" attr: "b" }
        } else if $in < 6hr {
            "#f52a65"
        } else if $in < 1day {
            "#8c6c3e"
        } else if $in < 3day {
            "#587539"
        } else if $in < 1wk {
            { fg: "#587539" attr: "b" }
        } else if $in < 6wk {
            "#007197"
        } else if $in < 52wk {
            "#2e7de9"
        } else { "dark_gray" }
    }
    range: "#6172b0"
    float: "#6172b0"
    string: "#6172b0"
    nothing: "#6172b0"
    binary: "#6172b0"
    cellpath: "#6172b0"
    row_index: { fg: "#587539" attr: "b" }
    record: "#6172b0"
    list: "#6172b0"
    block: "#6172b0"
    hints: "dark_gray"
    search_result: { fg: "#f52a65" bg: "#6172b0" }

    shape_and: { fg: "#9854f1" attr: "b" }
    shape_binary: { fg: "#9854f1" attr: "b" }
    shape_block: { fg: "#2e7de9" attr: "b" }
    shape_bool: "#007197"
    shape_custom: "#587539"
    shape_datetime: { fg: "#007197" attr: "b" }
    shape_directory: "#007197"
    shape_external: "#007197"
    shape_externalarg: { fg: "#587539" attr: "b" }
    shape_filepath: "#007197"
    shape_flag: { fg: "#2e7de9" attr: "b" }
    shape_float: { fg: "#9854f1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#007197" attr: "b" }
    shape_int: { fg: "#9854f1" attr: "b" }
    shape_internalcall: { fg: "#007197" attr: "b" }
    shape_list: { fg: "#007197" attr: "b" }
    shape_literal: "#2e7de9"
    shape_match_pattern: "#587539"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#007197"
    shape_operator: "#8c6c3e"
    shape_or: { fg: "#9854f1" attr: "b" }
    shape_pipe: { fg: "#9854f1" attr: "b" }
    shape_range: { fg: "#8c6c3e" attr: "b" }
    shape_record: { fg: "#007197" attr: "b" }
    shape_redirection: { fg: "#9854f1" attr: "b" }
    shape_signature: { fg: "#587539" attr: "b" }
    shape_string: "#587539"
    shape_string_interpolation: { fg: "#007197" attr: "b" }
    shape_table: { fg: "#2e7de9" attr: "b" }
    shape_variable: "#9854f1"

    background: "#e1e2e7"
    foreground: "#3760bf"
    cursor: "#3760bf"
}}