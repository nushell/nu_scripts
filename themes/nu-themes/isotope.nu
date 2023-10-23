export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#33ff00" attr: "b" }
    empty: "#0066ff"
    bool: {|| if $in { "#00ffff" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
        if $e == 0b {
            "#d0d0d0"
        } else if $e < 1mb {
            "#00ffff"
        } else {{ fg: "#0066ff" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff0000" attr: "b" }
        } else if $in < 6hr {
            "#ff0000"
        } else if $in < 1day {
            "#ff0099"
        } else if $in < 3day {
            "#33ff00"
        } else if $in < 1wk {
            { fg: "#33ff00" attr: "b" }
        } else if $in < 6wk {
            "#00ffff"
        } else if $in < 52wk {
            "#0066ff"
        } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#33ff00" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"
    search_result: { fg: "#ff0000" bg: "#d0d0d0" }

    shape_and: { fg: "#cc00ff" attr: "b" }
    shape_binary: { fg: "#cc00ff" attr: "b" }
    shape_block: { fg: "#0066ff" attr: "b" }
    shape_bool: "#00ffff"
    shape_custom: "#33ff00"
    shape_datetime: { fg: "#00ffff" attr: "b" }
    shape_directory: "#00ffff"
    shape_external: "#00ffff"
    shape_externalarg: { fg: "#33ff00" attr: "b" }
    shape_filepath: "#00ffff"
    shape_flag: { fg: "#0066ff" attr: "b" }
    shape_float: { fg: "#cc00ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00ffff" attr: "b" }
    shape_int: { fg: "#cc00ff" attr: "b" }
    shape_internalcall: { fg: "#00ffff" attr: "b" }
    shape_list: { fg: "#00ffff" attr: "b" }
    shape_literal: "#0066ff"
    shape_match_pattern: "#33ff00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00ffff"
    shape_operator: "#ff0099"
    shape_or: { fg: "#cc00ff" attr: "b" }
    shape_pipe: { fg: "#cc00ff" attr: "b" }
    shape_range: { fg: "#ff0099" attr: "b" }
    shape_record: { fg: "#00ffff" attr: "b" }
    shape_redirection: { fg: "#cc00ff" attr: "b" }
    shape_signature: { fg: "#33ff00" attr: "b" }
    shape_string: "#33ff00"
    shape_string_interpolation: { fg: "#00ffff" attr: "b" }
    shape_table: { fg: "#0066ff" attr: "b" }
    shape_variable: "#cc00ff"

    background: "#000000"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}