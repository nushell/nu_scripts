export def main [] { return {
    separator: "#5e6687"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ac9739" attr: "b" }
    empty: "#3d8fd1"
    bool: {|| if $in { "#22a2c9" } else { "light_gray" } }
    int: "#5e6687"
    filesize: {|e|
        if $e == 0b {
            "#5e6687"
        } else if $e < 1mb {
            "#22a2c9"
        } else {{ fg: "#3d8fd1" }}
    }
    duration: "#5e6687"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c94922" attr: "b" }
        } else if $in < 6hr {
            "#c94922"
        } else if $in < 1day {
            "#c08b30"
        } else if $in < 3day {
            "#ac9739"
        } else if $in < 1wk {
            { fg: "#ac9739" attr: "b" }
        } else if $in < 6wk {
            "#22a2c9"
        } else if $in < 52wk {
            "#3d8fd1"
        } else { "dark_gray" }
    }
    range: "#5e6687"
    float: "#5e6687"
    string: "#5e6687"
    nothing: "#5e6687"
    binary: "#5e6687"
    cellpath: "#5e6687"
    row_index: { fg: "#ac9739" attr: "b" }
    record: "#5e6687"
    list: "#5e6687"
    block: "#5e6687"
    hints: "dark_gray"
    search_result: { fg: "#c94922" bg: "#5e6687" }

    shape_and: { fg: "#6679cc" attr: "b" }
    shape_binary: { fg: "#6679cc" attr: "b" }
    shape_block: { fg: "#3d8fd1" attr: "b" }
    shape_bool: "#22a2c9"
    shape_custom: "#ac9739"
    shape_datetime: { fg: "#22a2c9" attr: "b" }
    shape_directory: "#22a2c9"
    shape_external: "#22a2c9"
    shape_externalarg: { fg: "#ac9739" attr: "b" }
    shape_filepath: "#22a2c9"
    shape_flag: { fg: "#3d8fd1" attr: "b" }
    shape_float: { fg: "#6679cc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#22a2c9" attr: "b" }
    shape_int: { fg: "#6679cc" attr: "b" }
    shape_internalcall: { fg: "#22a2c9" attr: "b" }
    shape_list: { fg: "#22a2c9" attr: "b" }
    shape_literal: "#3d8fd1"
    shape_match_pattern: "#ac9739"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#22a2c9"
    shape_operator: "#c08b30"
    shape_or: { fg: "#6679cc" attr: "b" }
    shape_pipe: { fg: "#6679cc" attr: "b" }
    shape_range: { fg: "#c08b30" attr: "b" }
    shape_record: { fg: "#22a2c9" attr: "b" }
    shape_redirection: { fg: "#6679cc" attr: "b" }
    shape_signature: { fg: "#ac9739" attr: "b" }
    shape_string: "#ac9739"
    shape_string_interpolation: { fg: "#22a2c9" attr: "b" }
    shape_table: { fg: "#3d8fd1" attr: "b" }
    shape_variable: "#6679cc"

    background: "#f5f7ff"
    foreground: "#5e6687"
    cursor: "#5e6687"
}}