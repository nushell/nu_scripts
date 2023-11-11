export def main [] { return {
    separator: "#4d4d4c"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#718c00" attr: "b" }
    empty: "#4271ae"
    bool: {|| if $in { "#3e999f" } else { "light_gray" } }
    int: "#4d4d4c"
    filesize: {|e|
        if $e == 0b {
            "#4d4d4c"
        } else if $e < 1mb {
            "#3e999f"
        } else {{ fg: "#4271ae" }}
    }
    duration: "#4d4d4c"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c82829" attr: "b" }
        } else if $in < 6hr {
            "#c82829"
        } else if $in < 1day {
            "#eab700"
        } else if $in < 3day {
            "#718c00"
        } else if $in < 1wk {
            { fg: "#718c00" attr: "b" }
        } else if $in < 6wk {
            "#3e999f"
        } else if $in < 52wk {
            "#4271ae"
        } else { "dark_gray" }
    }
    range: "#4d4d4c"
    float: "#4d4d4c"
    string: "#4d4d4c"
    nothing: "#4d4d4c"
    binary: "#4d4d4c"
    cellpath: "#4d4d4c"
    row_index: { fg: "#718c00" attr: "b" }
    record: "#4d4d4c"
    list: "#4d4d4c"
    block: "#4d4d4c"
    hints: "dark_gray"
    search_result: { fg: "#c82829" bg: "#4d4d4c" }

    shape_and: { fg: "#8959a8" attr: "b" }
    shape_binary: { fg: "#8959a8" attr: "b" }
    shape_block: { fg: "#4271ae" attr: "b" }
    shape_bool: "#3e999f"
    shape_custom: "#718c00"
    shape_datetime: { fg: "#3e999f" attr: "b" }
    shape_directory: "#3e999f"
    shape_external: "#3e999f"
    shape_externalarg: { fg: "#718c00" attr: "b" }
    shape_filepath: "#3e999f"
    shape_flag: { fg: "#4271ae" attr: "b" }
    shape_float: { fg: "#8959a8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3e999f" attr: "b" }
    shape_int: { fg: "#8959a8" attr: "b" }
    shape_internalcall: { fg: "#3e999f" attr: "b" }
    shape_list: { fg: "#3e999f" attr: "b" }
    shape_literal: "#4271ae"
    shape_match_pattern: "#718c00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3e999f"
    shape_operator: "#eab700"
    shape_or: { fg: "#8959a8" attr: "b" }
    shape_pipe: { fg: "#8959a8" attr: "b" }
    shape_range: { fg: "#eab700" attr: "b" }
    shape_record: { fg: "#3e999f" attr: "b" }
    shape_redirection: { fg: "#8959a8" attr: "b" }
    shape_signature: { fg: "#718c00" attr: "b" }
    shape_string: "#718c00"
    shape_string_interpolation: { fg: "#3e999f" attr: "b" }
    shape_table: { fg: "#4271ae" attr: "b" }
    shape_variable: "#8959a8"

    background: "#ffffff"
    foreground: "#4d4d4c"
    cursor: "#4d4d4c"
}}