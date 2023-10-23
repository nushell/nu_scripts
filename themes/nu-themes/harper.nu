export def main [] { return {
    separator: "#a8a49d"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7fb5e1" attr: "b" }
    empty: "#489e48"
    bool: {|| if $in { "#f5bfd7" } else { "light_gray" } }
    int: "#a8a49d"
    filesize: {|e|
        if $e == 0b {
            "#a8a49d"
        } else if $e < 1mb {
            "#f5bfd7"
        } else {{ fg: "#489e48" }}
    }
    duration: "#a8a49d"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f8b63f" attr: "b" }
        } else if $in < 6hr {
            "#f8b63f"
        } else if $in < 1day {
            "#d6da25"
        } else if $in < 3day {
            "#7fb5e1"
        } else if $in < 1wk {
            { fg: "#7fb5e1" attr: "b" }
        } else if $in < 6wk {
            "#f5bfd7"
        } else if $in < 52wk {
            "#489e48"
        } else { "dark_gray" }
    }
    range: "#a8a49d"
    float: "#a8a49d"
    string: "#a8a49d"
    nothing: "#a8a49d"
    binary: "#a8a49d"
    cellpath: "#a8a49d"
    row_index: { fg: "#7fb5e1" attr: "b" }
    record: "#a8a49d"
    list: "#a8a49d"
    block: "#a8a49d"
    hints: "dark_gray"
    search_result: { fg: "#f8b63f" bg: "#a8a49d" }

    shape_and: { fg: "#b296c6" attr: "b" }
    shape_binary: { fg: "#b296c6" attr: "b" }
    shape_block: { fg: "#489e48" attr: "b" }
    shape_bool: "#f5bfd7"
    shape_custom: "#7fb5e1"
    shape_datetime: { fg: "#f5bfd7" attr: "b" }
    shape_directory: "#f5bfd7"
    shape_external: "#f5bfd7"
    shape_externalarg: { fg: "#7fb5e1" attr: "b" }
    shape_filepath: "#f5bfd7"
    shape_flag: { fg: "#489e48" attr: "b" }
    shape_float: { fg: "#b296c6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#f5bfd7" attr: "b" }
    shape_int: { fg: "#b296c6" attr: "b" }
    shape_internalcall: { fg: "#f5bfd7" attr: "b" }
    shape_list: { fg: "#f5bfd7" attr: "b" }
    shape_literal: "#489e48"
    shape_match_pattern: "#7fb5e1"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#f5bfd7"
    shape_operator: "#d6da25"
    shape_or: { fg: "#b296c6" attr: "b" }
    shape_pipe: { fg: "#b296c6" attr: "b" }
    shape_range: { fg: "#d6da25" attr: "b" }
    shape_record: { fg: "#f5bfd7" attr: "b" }
    shape_redirection: { fg: "#b296c6" attr: "b" }
    shape_signature: { fg: "#7fb5e1" attr: "b" }
    shape_string: "#7fb5e1"
    shape_string_interpolation: { fg: "#f5bfd7" attr: "b" }
    shape_table: { fg: "#489e48" attr: "b" }
    shape_variable: "#b296c6"

    background: "#010101"
    foreground: "#a8a49d"
    cursor: "#a8a49d"
}}