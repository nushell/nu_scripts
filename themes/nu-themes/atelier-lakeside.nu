export def main [] { return {
    separator: "#7ea2b4"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#568c3b" attr: "b" }
    empty: "#257fad"
    bool: {|| if $in { "#2d8f6f" } else { "light_gray" } }
    int: "#7ea2b4"
    filesize: {|e|
        if $e == 0b {
            "#7ea2b4"
        } else if $e < 1mb {
            "#2d8f6f"
        } else {{ fg: "#257fad" }}
    }
    duration: "#7ea2b4"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d22d72" attr: "b" }
        } else if $in < 6hr {
            "#d22d72"
        } else if $in < 1day {
            "#8a8a0f"
        } else if $in < 3day {
            "#568c3b"
        } else if $in < 1wk {
            { fg: "#568c3b" attr: "b" }
        } else if $in < 6wk {
            "#2d8f6f"
        } else if $in < 52wk {
            "#257fad"
        } else { "dark_gray" }
    }
    range: "#7ea2b4"
    float: "#7ea2b4"
    string: "#7ea2b4"
    nothing: "#7ea2b4"
    binary: "#7ea2b4"
    cellpath: "#7ea2b4"
    row_index: { fg: "#568c3b" attr: "b" }
    record: "#7ea2b4"
    list: "#7ea2b4"
    block: "#7ea2b4"
    hints: "dark_gray"
    search_result: { fg: "#d22d72" bg: "#7ea2b4" }

    shape_and: { fg: "#6b6bb8" attr: "b" }
    shape_binary: { fg: "#6b6bb8" attr: "b" }
    shape_block: { fg: "#257fad" attr: "b" }
    shape_bool: "#2d8f6f"
    shape_custom: "#568c3b"
    shape_datetime: { fg: "#2d8f6f" attr: "b" }
    shape_directory: "#2d8f6f"
    shape_external: "#2d8f6f"
    shape_externalarg: { fg: "#568c3b" attr: "b" }
    shape_filepath: "#2d8f6f"
    shape_flag: { fg: "#257fad" attr: "b" }
    shape_float: { fg: "#6b6bb8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2d8f6f" attr: "b" }
    shape_int: { fg: "#6b6bb8" attr: "b" }
    shape_internalcall: { fg: "#2d8f6f" attr: "b" }
    shape_list: { fg: "#2d8f6f" attr: "b" }
    shape_literal: "#257fad"
    shape_match_pattern: "#568c3b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2d8f6f"
    shape_operator: "#8a8a0f"
    shape_or: { fg: "#6b6bb8" attr: "b" }
    shape_pipe: { fg: "#6b6bb8" attr: "b" }
    shape_range: { fg: "#8a8a0f" attr: "b" }
    shape_record: { fg: "#2d8f6f" attr: "b" }
    shape_redirection: { fg: "#6b6bb8" attr: "b" }
    shape_signature: { fg: "#568c3b" attr: "b" }
    shape_string: "#568c3b"
    shape_string_interpolation: { fg: "#2d8f6f" attr: "b" }
    shape_table: { fg: "#257fad" attr: "b" }
    shape_variable: "#6b6bb8"

    background: "#161b1d"
    foreground: "#7ea2b4"
    cursor: "#7ea2b4"
}}