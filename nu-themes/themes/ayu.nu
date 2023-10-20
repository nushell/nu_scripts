export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b8cc52" attr: "b" }
    empty: "#36a3d9"
    bool: {|| if $in { "#c7fffc" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
        if $e == 0b {
            "#ffffff"
        } else if $e < 1mb {
            "#95e5cb"
        } else {{ fg: "#36a3d9" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff3333" attr: "b" }
        } else if $in < 6hr {
            "#ff3333"
        } else if $in < 1day {
            "#e6c446"
        } else if $in < 3day {
            "#b8cc52"
        } else if $in < 1wk {
            { fg: "#b8cc52" attr: "b" }
        } else if $in < 6wk {
            "#95e5cb"
        } else if $in < 52wk {
            "#36a3d9"
        } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#b8cc52" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"
    search_result: { fg: "#ff3333" bg: "#ffffff" }

    shape_and: { fg: "#f07078" attr: "b" }
    shape_binary: { fg: "#f07078" attr: "b" }
    shape_block: { fg: "#36a3d9" attr: "b" }
    shape_bool: "#c7fffc"
    shape_custom: "#b8cc52"
    shape_datetime: { fg: "#95e5cb" attr: "b" }
    shape_directory: "#95e5cb"
    shape_external: "#95e5cb"
    shape_externalarg: { fg: "#b8cc52" attr: "b" }
    shape_filepath: "#95e5cb"
    shape_flag: { fg: "#36a3d9" attr: "b" }
    shape_float: { fg: "#f07078" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#95e5cb" attr: "b" }
    shape_int: { fg: "#f07078" attr: "b" }
    shape_internalcall: { fg: "#95e5cb" attr: "b" }
    shape_list: { fg: "#95e5cb" attr: "b" }
    shape_literal: "#36a3d9"
    shape_match_pattern: "#b8cc52"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c7fffc"
    shape_operator: "#e6c446"
    shape_or: { fg: "#f07078" attr: "b" }
    shape_pipe: { fg: "#f07078" attr: "b" }
    shape_range: { fg: "#e6c446" attr: "b" }
    shape_record: { fg: "#95e5cb" attr: "b" }
    shape_redirection: { fg: "#f07078" attr: "b" }
    shape_signature: { fg: "#b8cc52" attr: "b" }
    shape_string: "#b8cc52"
    shape_string_interpolation: { fg: "#95e5cb" attr: "b" }
    shape_table: { fg: "#36a3d9" attr: "b" }
    shape_variable: "#f07078"

    background: "#0e1419"
    foreground: "#e5e1cf"
    cursor: "#f19618"
}}