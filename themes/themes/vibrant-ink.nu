export def main [] { return {
    separator: "#f5f5f5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ccff04" attr: "b" }
    empty: "#44b4cc"
    bool: {|| if $in { "#00ffff" } else { "light_gray" } }
    int: "#f5f5f5"
    filesize: {|e|
        if $e == 0b {
            "#f5f5f5"
        } else if $e < 1mb {
            "#44b4cc"
        } else {{ fg: "#44b4cc" }}
    }
    duration: "#f5f5f5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff6600" attr: "b" }
        } else if $in < 6hr {
            "#ff6600"
        } else if $in < 1day {
            "#ffcc00"
        } else if $in < 3day {
            "#ccff04"
        } else if $in < 1wk {
            { fg: "#ccff04" attr: "b" }
        } else if $in < 6wk {
            "#44b4cc"
        } else if $in < 52wk {
            "#44b4cc"
        } else { "dark_gray" }
    }
    range: "#f5f5f5"
    float: "#f5f5f5"
    string: "#f5f5f5"
    nothing: "#f5f5f5"
    binary: "#f5f5f5"
    cellpath: "#f5f5f5"
    row_index: { fg: "#ccff04" attr: "b" }
    record: "#f5f5f5"
    list: "#f5f5f5"
    block: "#f5f5f5"
    hints: "dark_gray"
    search_result: { fg: "#ff6600" bg: "#f5f5f5" }

    shape_and: { fg: "#9933cc" attr: "b" }
    shape_binary: { fg: "#9933cc" attr: "b" }
    shape_block: { fg: "#44b4cc" attr: "b" }
    shape_bool: "#00ffff"
    shape_custom: "#ccff04"
    shape_datetime: { fg: "#44b4cc" attr: "b" }
    shape_directory: "#44b4cc"
    shape_external: "#44b4cc"
    shape_externalarg: { fg: "#ccff04" attr: "b" }
    shape_filepath: "#44b4cc"
    shape_flag: { fg: "#44b4cc" attr: "b" }
    shape_float: { fg: "#9933cc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#44b4cc" attr: "b" }
    shape_int: { fg: "#9933cc" attr: "b" }
    shape_internalcall: { fg: "#44b4cc" attr: "b" }
    shape_list: { fg: "#44b4cc" attr: "b" }
    shape_literal: "#44b4cc"
    shape_match_pattern: "#ccff04"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00ffff"
    shape_operator: "#ffcc00"
    shape_or: { fg: "#9933cc" attr: "b" }
    shape_pipe: { fg: "#9933cc" attr: "b" }
    shape_range: { fg: "#ffcc00" attr: "b" }
    shape_record: { fg: "#44b4cc" attr: "b" }
    shape_redirection: { fg: "#9933cc" attr: "b" }
    shape_signature: { fg: "#ccff04" attr: "b" }
    shape_string: "#ccff04"
    shape_string_interpolation: { fg: "#44b4cc" attr: "b" }
    shape_table: { fg: "#44b4cc" attr: "b" }
    shape_variable: "#9933cc"

    background: "#000000"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}