export def main [] { return {
    separator: "#858893"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#72ccae" attr: "b" }
    empty: "#58b6ca"
    bool: {|| if $in { "#c0b7f9" } else { "light_gray" } }
    int: "#858893"
    filesize: {|e|
        if $e == 0b {
            "#858893"
        } else if $e < 1mb {
            "#8d84c6"
        } else {{ fg: "#58b6ca" }}
    }
    duration: "#858893"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#bb4f6c" attr: "b" }
        } else if $in < 6hr {
            "#bb4f6c"
        } else if $in < 1day {
            "#c65e3d"
        } else if $in < 3day {
            "#72ccae"
        } else if $in < 1wk {
            { fg: "#72ccae" attr: "b" }
        } else if $in < 6wk {
            "#8d84c6"
        } else if $in < 52wk {
            "#58b6ca"
        } else { "dark_gray" }
    }
    range: "#858893"
    float: "#858893"
    string: "#858893"
    nothing: "#858893"
    binary: "#858893"
    cellpath: "#858893"
    row_index: { fg: "#72ccae" attr: "b" }
    record: "#858893"
    list: "#858893"
    block: "#858893"
    hints: "dark_gray"
    search_result: { fg: "#bb4f6c" bg: "#858893" }

    shape_and: { fg: "#6488c4" attr: "b" }
    shape_binary: { fg: "#6488c4" attr: "b" }
    shape_block: { fg: "#58b6ca" attr: "b" }
    shape_bool: "#c0b7f9"
    shape_custom: "#72ccae"
    shape_datetime: { fg: "#8d84c6" attr: "b" }
    shape_directory: "#8d84c6"
    shape_external: "#8d84c6"
    shape_externalarg: { fg: "#72ccae" attr: "b" }
    shape_filepath: "#8d84c6"
    shape_flag: { fg: "#58b6ca" attr: "b" }
    shape_float: { fg: "#6488c4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8d84c6" attr: "b" }
    shape_int: { fg: "#6488c4" attr: "b" }
    shape_internalcall: { fg: "#8d84c6" attr: "b" }
    shape_list: { fg: "#8d84c6" attr: "b" }
    shape_literal: "#58b6ca"
    shape_match_pattern: "#72ccae"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c0b7f9"
    shape_operator: "#c65e3d"
    shape_or: { fg: "#6488c4" attr: "b" }
    shape_pipe: { fg: "#6488c4" attr: "b" }
    shape_range: { fg: "#c65e3d" attr: "b" }
    shape_record: { fg: "#8d84c6" attr: "b" }
    shape_redirection: { fg: "#6488c4" attr: "b" }
    shape_signature: { fg: "#72ccae" attr: "b" }
    shape_string: "#72ccae"
    shape_string_interpolation: { fg: "#8d84c6" attr: "b" }
    shape_table: { fg: "#58b6ca" attr: "b" }
    shape_variable: "#6488c4"

    background: "#0d101b"
    foreground: "#ebeef9"
    cursor: "#ebeef9"
}}