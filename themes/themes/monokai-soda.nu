export def main [] { return {
    separator: "#c4c5b5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#98e024" attr: "b" }
    empty: "#9d65ff"
    bool: {|| if $in { "#58d1eb" } else { "light_gray" } }
    int: "#c4c5b5"
    filesize: {|e|
        if $e == 0b {
            "#c4c5b5"
        } else if $e < 1mb {
            "#58d1eb"
        } else {{ fg: "#9d65ff" }}
    }
    duration: "#c4c5b5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f4005f" attr: "b" }
        } else if $in < 6hr {
            "#f4005f"
        } else if $in < 1day {
            "#fa8419"
        } else if $in < 3day {
            "#98e024"
        } else if $in < 1wk {
            { fg: "#98e024" attr: "b" }
        } else if $in < 6wk {
            "#58d1eb"
        } else if $in < 52wk {
            "#9d65ff"
        } else { "dark_gray" }
    }
    range: "#c4c5b5"
    float: "#c4c5b5"
    string: "#c4c5b5"
    nothing: "#c4c5b5"
    binary: "#c4c5b5"
    cellpath: "#c4c5b5"
    row_index: { fg: "#98e024" attr: "b" }
    record: "#c4c5b5"
    list: "#c4c5b5"
    block: "#c4c5b5"
    hints: "dark_gray"
    search_result: { fg: "#f4005f" bg: "#c4c5b5" }

    shape_and: { fg: "#f4005f" attr: "b" }
    shape_binary: { fg: "#f4005f" attr: "b" }
    shape_block: { fg: "#9d65ff" attr: "b" }
    shape_bool: "#58d1eb"
    shape_custom: "#98e024"
    shape_datetime: { fg: "#58d1eb" attr: "b" }
    shape_directory: "#58d1eb"
    shape_external: "#58d1eb"
    shape_externalarg: { fg: "#98e024" attr: "b" }
    shape_filepath: "#58d1eb"
    shape_flag: { fg: "#9d65ff" attr: "b" }
    shape_float: { fg: "#f4005f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#58d1eb" attr: "b" }
    shape_int: { fg: "#f4005f" attr: "b" }
    shape_internalcall: { fg: "#58d1eb" attr: "b" }
    shape_list: { fg: "#58d1eb" attr: "b" }
    shape_literal: "#9d65ff"
    shape_match_pattern: "#98e024"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#58d1eb"
    shape_operator: "#fa8419"
    shape_or: { fg: "#f4005f" attr: "b" }
    shape_pipe: { fg: "#f4005f" attr: "b" }
    shape_range: { fg: "#fa8419" attr: "b" }
    shape_record: { fg: "#58d1eb" attr: "b" }
    shape_redirection: { fg: "#f4005f" attr: "b" }
    shape_signature: { fg: "#98e024" attr: "b" }
    shape_string: "#98e024"
    shape_string_interpolation: { fg: "#58d1eb" attr: "b" }
    shape_table: { fg: "#9d65ff" attr: "b" }
    shape_variable: "#f4005f"

    background: "#1a1a1a"
    foreground: "#c4c5b5"
    cursor: "#c4c5b5"
}}