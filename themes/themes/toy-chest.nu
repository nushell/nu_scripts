export def main [] { return {
    separator: "#23d183"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#1a9172" attr: "b" }
    empty: "#325d96"
    bool: {|| if $in { "#42c3ae" } else { "light_gray" } }
    int: "#23d183"
    filesize: {|e|
        if $e == 0b {
            "#23d183"
        } else if $e < 1mb {
            "#35a08f"
        } else {{ fg: "#325d96" }}
    }
    duration: "#23d183"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#be2d26" attr: "b" }
        } else if $in < 6hr {
            "#be2d26"
        } else if $in < 1day {
            "#db8e27"
        } else if $in < 3day {
            "#1a9172"
        } else if $in < 1wk {
            { fg: "#1a9172" attr: "b" }
        } else if $in < 6wk {
            "#35a08f"
        } else if $in < 52wk {
            "#325d96"
        } else { "dark_gray" }
    }
    range: "#23d183"
    float: "#23d183"
    string: "#23d183"
    nothing: "#23d183"
    binary: "#23d183"
    cellpath: "#23d183"
    row_index: { fg: "#1a9172" attr: "b" }
    record: "#23d183"
    list: "#23d183"
    block: "#23d183"
    hints: "dark_gray"
    search_result: { fg: "#be2d26" bg: "#23d183" }

    shape_and: { fg: "#8a5edc" attr: "b" }
    shape_binary: { fg: "#8a5edc" attr: "b" }
    shape_block: { fg: "#325d96" attr: "b" }
    shape_bool: "#42c3ae"
    shape_custom: "#1a9172"
    shape_datetime: { fg: "#35a08f" attr: "b" }
    shape_directory: "#35a08f"
    shape_external: "#35a08f"
    shape_externalarg: { fg: "#1a9172" attr: "b" }
    shape_filepath: "#35a08f"
    shape_flag: { fg: "#325d96" attr: "b" }
    shape_float: { fg: "#8a5edc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#35a08f" attr: "b" }
    shape_int: { fg: "#8a5edc" attr: "b" }
    shape_internalcall: { fg: "#35a08f" attr: "b" }
    shape_list: { fg: "#35a08f" attr: "b" }
    shape_literal: "#325d96"
    shape_match_pattern: "#1a9172"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#42c3ae"
    shape_operator: "#db8e27"
    shape_or: { fg: "#8a5edc" attr: "b" }
    shape_pipe: { fg: "#8a5edc" attr: "b" }
    shape_range: { fg: "#db8e27" attr: "b" }
    shape_record: { fg: "#35a08f" attr: "b" }
    shape_redirection: { fg: "#8a5edc" attr: "b" }
    shape_signature: { fg: "#1a9172" attr: "b" }
    shape_string: "#1a9172"
    shape_string_interpolation: { fg: "#35a08f" attr: "b" }
    shape_table: { fg: "#325d96" attr: "b" }
    shape_variable: "#8a5edc"

    background: "#24364b"
    foreground: "#31d07b"
    cursor: "#31d07b"
}}