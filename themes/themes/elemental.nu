export def main [] { return {
    separator: "#807974"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#479a43" attr: "b" }
    empty: "#497f7d"
    bool: {|| if $in { "#59d599" } else { "light_gray" } }
    int: "#807974"
    filesize: {|e|
        if $e == 0b {
            "#807974"
        } else if $e < 1mb {
            "#387f58"
        } else {{ fg: "#497f7d" }}
    }
    duration: "#807974"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#98290f" attr: "b" }
        } else if $in < 6hr {
            "#98290f"
        } else if $in < 1day {
            "#7f7111"
        } else if $in < 3day {
            "#479a43"
        } else if $in < 1wk {
            { fg: "#479a43" attr: "b" }
        } else if $in < 6wk {
            "#387f58"
        } else if $in < 52wk {
            "#497f7d"
        } else { "dark_gray" }
    }
    range: "#807974"
    float: "#807974"
    string: "#807974"
    nothing: "#807974"
    binary: "#807974"
    cellpath: "#807974"
    row_index: { fg: "#479a43" attr: "b" }
    record: "#807974"
    list: "#807974"
    block: "#807974"
    hints: "dark_gray"
    search_result: { fg: "#98290f" bg: "#807974" }

    shape_and: { fg: "#7f4e2f" attr: "b" }
    shape_binary: { fg: "#7f4e2f" attr: "b" }
    shape_block: { fg: "#497f7d" attr: "b" }
    shape_bool: "#59d599"
    shape_custom: "#479a43"
    shape_datetime: { fg: "#387f58" attr: "b" }
    shape_directory: "#387f58"
    shape_external: "#387f58"
    shape_externalarg: { fg: "#479a43" attr: "b" }
    shape_filepath: "#387f58"
    shape_flag: { fg: "#497f7d" attr: "b" }
    shape_float: { fg: "#7f4e2f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#387f58" attr: "b" }
    shape_int: { fg: "#7f4e2f" attr: "b" }
    shape_internalcall: { fg: "#387f58" attr: "b" }
    shape_list: { fg: "#387f58" attr: "b" }
    shape_literal: "#497f7d"
    shape_match_pattern: "#479a43"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#59d599"
    shape_operator: "#7f7111"
    shape_or: { fg: "#7f4e2f" attr: "b" }
    shape_pipe: { fg: "#7f4e2f" attr: "b" }
    shape_range: { fg: "#7f7111" attr: "b" }
    shape_record: { fg: "#387f58" attr: "b" }
    shape_redirection: { fg: "#7f4e2f" attr: "b" }
    shape_signature: { fg: "#479a43" attr: "b" }
    shape_string: "#479a43"
    shape_string_interpolation: { fg: "#387f58" attr: "b" }
    shape_table: { fg: "#497f7d" attr: "b" }
    shape_variable: "#7f4e2f"

    background: "#22211d"
    foreground: "#807a74"
    cursor: "#807a74"
}}