export def main [] { return {
    separator: "#a0be99"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b9a9d7" attr: "b" }
    empty: "#ada883"
    bool: {|| if $in { "#ff9c9c" } else { "light_gray" } }
    int: "#a0be99"
    filesize: {|e|
        if $e == 0b {
            "#a0be99"
        } else if $e < 1mb {
            "#ff9c9c"
        } else {{ fg: "#ada883" }}
    }
    duration: "#a0be99"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#86b79b" attr: "b" }
        } else if $in < 6hr {
            "#86b79b"
        } else if $in < 1day {
            "#d4b34e"
        } else if $in < 3day {
            "#b9a9d7"
        } else if $in < 1wk {
            { fg: "#b9a9d7" attr: "b" }
        } else if $in < 6wk {
            "#ff9c9c"
        } else if $in < 52wk {
            "#ada883"
        } else { "dark_gray" }
    }
    range: "#a0be99"
    float: "#a0be99"
    string: "#a0be99"
    nothing: "#a0be99"
    binary: "#a0be99"
    cellpath: "#a0be99"
    row_index: { fg: "#b9a9d7" attr: "b" }
    record: "#a0be99"
    list: "#a0be99"
    block: "#a0be99"
    hints: "dark_gray"
    search_result: { fg: "#86b79b" bg: "#a0be99" }

    shape_and: { fg: "#9298e7" attr: "b" }
    shape_binary: { fg: "#9298e7" attr: "b" }
    shape_block: { fg: "#ada883" attr: "b" }
    shape_bool: "#ff9c9c"
    shape_custom: "#b9a9d7"
    shape_datetime: { fg: "#ff9c9c" attr: "b" }
    shape_directory: "#ff9c9c"
    shape_external: "#ff9c9c"
    shape_externalarg: { fg: "#b9a9d7" attr: "b" }
    shape_filepath: "#ff9c9c"
    shape_flag: { fg: "#ada883" attr: "b" }
    shape_float: { fg: "#9298e7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ff9c9c" attr: "b" }
    shape_int: { fg: "#9298e7" attr: "b" }
    shape_internalcall: { fg: "#ff9c9c" attr: "b" }
    shape_list: { fg: "#ff9c9c" attr: "b" }
    shape_literal: "#ada883"
    shape_match_pattern: "#b9a9d7"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ff9c9c"
    shape_operator: "#d4b34e"
    shape_or: { fg: "#9298e7" attr: "b" }
    shape_pipe: { fg: "#9298e7" attr: "b" }
    shape_range: { fg: "#d4b34e" attr: "b" }
    shape_record: { fg: "#ff9c9c" attr: "b" }
    shape_redirection: { fg: "#9298e7" attr: "b" }
    shape_signature: { fg: "#b9a9d7" attr: "b" }
    shape_string: "#b9a9d7"
    shape_string_interpolation: { fg: "#ff9c9c" attr: "b" }
    shape_table: { fg: "#ada883" attr: "b" }
    shape_variable: "#9298e7"

    background: "#44515d"
    foreground: "#ffb692"
    cursor: "#ffb692"
}}