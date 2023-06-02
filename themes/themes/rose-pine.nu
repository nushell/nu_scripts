export def main [] { return {
    separator: "#e0def4"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ebbcba" attr: "b" }
    empty: "#9ccfd8"
    bool: {|| if $in { "#31748f" } else { "light_gray" } }
    int: "#e0def4"
    filesize: {|e|
        if $e == 0b {
            "#e0def4"
        } else if $e < 1mb {
            "#31748f"
        } else {{ fg: "#9ccfd8" }}
    }
    duration: "#e0def4"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e2e1e7" attr: "b" }
        } else if $in < 6hr {
            "#e2e1e7"
        } else if $in < 1day {
            "#f6c177"
        } else if $in < 3day {
            "#ebbcba"
        } else if $in < 1wk {
            { fg: "#ebbcba" attr: "b" }
        } else if $in < 6wk {
            "#31748f"
        } else if $in < 52wk {
            "#9ccfd8"
        } else { "dark_gray" }
    }
    range: "#e0def4"
    float: "#e0def4"
    string: "#e0def4"
    nothing: "#e0def4"
    binary: "#e0def4"
    cellpath: "#e0def4"
    row_index: { fg: "#ebbcba" attr: "b" }
    record: "#e0def4"
    list: "#e0def4"
    block: "#e0def4"
    hints: "dark_gray"
    search_result: { fg: "#e2e1e7" bg: "#e0def4" }

    shape_and: { fg: "#c4a7e7" attr: "b" }
    shape_binary: { fg: "#c4a7e7" attr: "b" }
    shape_block: { fg: "#9ccfd8" attr: "b" }
    shape_bool: "#31748f"
    shape_custom: "#ebbcba"
    shape_datetime: { fg: "#31748f" attr: "b" }
    shape_directory: "#31748f"
    shape_external: "#31748f"
    shape_externalarg: { fg: "#ebbcba" attr: "b" }
    shape_filepath: "#31748f"
    shape_flag: { fg: "#9ccfd8" attr: "b" }
    shape_float: { fg: "#c4a7e7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#31748f" attr: "b" }
    shape_int: { fg: "#c4a7e7" attr: "b" }
    shape_internalcall: { fg: "#31748f" attr: "b" }
    shape_list: { fg: "#31748f" attr: "b" }
    shape_literal: "#9ccfd8"
    shape_match_pattern: "#ebbcba"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#31748f"
    shape_operator: "#f6c177"
    shape_or: { fg: "#c4a7e7" attr: "b" }
    shape_pipe: { fg: "#c4a7e7" attr: "b" }
    shape_range: { fg: "#f6c177" attr: "b" }
    shape_record: { fg: "#31748f" attr: "b" }
    shape_redirection: { fg: "#c4a7e7" attr: "b" }
    shape_signature: { fg: "#ebbcba" attr: "b" }
    shape_string: "#ebbcba"
    shape_string_interpolation: { fg: "#31748f" attr: "b" }
    shape_table: { fg: "#9ccfd8" attr: "b" }
    shape_variable: "#c4a7e7"

    background: "#191724"
    foreground: "#e0def4"
    cursor: "#e0def4"
}}