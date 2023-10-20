export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#009600" attr: "b" }
    empty: "#0000cc"
    bool: {|| if $in { "#0087cc" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
        if $e == 0b {
            "#cccccc"
        } else if $e < 1mb {
            "#0087cc"
        } else {{ fg: "#0000cc" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cc0000" attr: "b" }
        } else if $in < 6hr {
            "#cc0000"
        } else if $in < 1day {
            "#d06b00"
        } else if $in < 3day {
            "#009600"
        } else if $in < 1wk {
            { fg: "#009600" attr: "b" }
        } else if $in < 6wk {
            "#0087cc"
        } else if $in < 52wk {
            "#0000cc"
        } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#009600" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"
    search_result: { fg: "#cc0000" bg: "#cccccc" }

    shape_and: { fg: "#cc00cc" attr: "b" }
    shape_binary: { fg: "#cc00cc" attr: "b" }
    shape_block: { fg: "#0000cc" attr: "b" }
    shape_bool: "#0087cc"
    shape_custom: "#009600"
    shape_datetime: { fg: "#0087cc" attr: "b" }
    shape_directory: "#0087cc"
    shape_external: "#0087cc"
    shape_externalarg: { fg: "#009600" attr: "b" }
    shape_filepath: "#0087cc"
    shape_flag: { fg: "#0000cc" attr: "b" }
    shape_float: { fg: "#cc00cc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0087cc" attr: "b" }
    shape_int: { fg: "#cc00cc" attr: "b" }
    shape_internalcall: { fg: "#0087cc" attr: "b" }
    shape_list: { fg: "#0087cc" attr: "b" }
    shape_literal: "#0000cc"
    shape_match_pattern: "#009600"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#0087cc"
    shape_operator: "#d06b00"
    shape_or: { fg: "#cc00cc" attr: "b" }
    shape_pipe: { fg: "#cc00cc" attr: "b" }
    shape_range: { fg: "#d06b00" attr: "b" }
    shape_record: { fg: "#0087cc" attr: "b" }
    shape_redirection: { fg: "#cc00cc" attr: "b" }
    shape_signature: { fg: "#009600" attr: "b" }
    shape_string: "#009600"
    shape_string_interpolation: { fg: "#0087cc" attr: "b" }
    shape_table: { fg: "#0000cc" attr: "b" }
    shape_variable: "#cc00cc"

    background: "#dfdbc3"
    foreground: "#3b2322"
    cursor: "#3b2322"
}}