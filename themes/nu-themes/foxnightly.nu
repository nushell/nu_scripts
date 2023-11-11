export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ff7de9" attr: "b" }
    empty: "#66a05b"
    bool: {|| if $in { "#c4a000" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#acacae"
        } else {{ fg: "#66a05b" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b98eff" attr: "b" }
        } else if $in < 6hr {
            "#b98eff"
        } else if $in < 1day {
            "#729fcf"
        } else if $in < 3day {
            "#ff7de9"
        } else if $in < 1wk {
            { fg: "#ff7de9" attr: "b" }
        } else if $in < 6wk {
            "#acacae"
        } else if $in < 52wk {
            "#66a05b"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#ff7de9" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#b98eff" bg: "#ffffff" }

    shape_and: { fg: "#75507b" attr: "b" }
    shape_binary: { fg: "#75507b" attr: "b" }
    shape_block: { fg: "#66a05b" attr: "b" }
    shape_bool: "#c4a000"
    shape_custom: "#ff7de9"
    shape_datetime: { fg: "#acacae" attr: "b" }
    shape_directory: "#acacae"
    shape_external: "#acacae"
    shape_externalarg: { fg: "#ff7de9" attr: "b" }
    shape_filepath: "#acacae"
    shape_flag: { fg: "#66a05b" attr: "b" }
    shape_float: { fg: "#75507b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#acacae" attr: "b" }
    shape_int: { fg: "#75507b" attr: "b" }
    shape_internalcall: { fg: "#acacae" attr: "b" }
    shape_list: { fg: "#acacae" attr: "b" }
    shape_literal: "#66a05b"
    shape_match_pattern: "#ff7de9"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c4a000"
    shape_operator: "#729fcf"
    shape_or: { fg: "#75507b" attr: "b" }
    shape_pipe: { fg: "#75507b" attr: "b" }
    shape_range: { fg: "#729fcf" attr: "b" }
    shape_record: { fg: "#acacae" attr: "b" }
    shape_redirection: { fg: "#75507b" attr: "b" }
    shape_signature: { fg: "#ff7de9" attr: "b" }
    shape_string: "#ff7de9"
    shape_string_interpolation: { fg: "#acacae" attr: "b" }
    shape_table: { fg: "#66a05b" attr: "b" }
    shape_variable: "#75507b"

    background: "#2a2a2e"
    foreground: "#d7d7db"
    cursor: "#d7d7db"
}}