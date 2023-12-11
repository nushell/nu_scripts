export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#83a471" attr: "b" }
    empty: "#8eccdd"
    bool: {|| if $in { "#7c9cae" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
        if $e == 0b {
            "#cccccc"
        } else if $e < 1mb {
            "#7c9cae"
        } else {{ fg: "#8eccdd" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d88568" attr: "b" }
        } else if $in < 6hr {
            "#d88568"
        } else if $in < 1day {
            "#b99353"
        } else if $in < 3day {
            "#83a471"
        } else if $in < 1wk {
            { fg: "#83a471" attr: "b" }
        } else if $in < 6wk {
            "#7c9cae"
        } else if $in < 52wk {
            "#8eccdd"
        } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#83a471" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"
    search_result: { fg: "#d88568" bg: "#cccccc" }

    shape_and: { fg: "#b98eb2" attr: "b" }
    shape_binary: { fg: "#b98eb2" attr: "b" }
    shape_block: { fg: "#8eccdd" attr: "b" }
    shape_bool: "#7c9cae"
    shape_custom: "#83a471"
    shape_datetime: { fg: "#7c9cae" attr: "b" }
    shape_directory: "#7c9cae"
    shape_external: "#7c9cae"
    shape_externalarg: { fg: "#83a471" attr: "b" }
    shape_filepath: "#7c9cae"
    shape_flag: { fg: "#8eccdd" attr: "b" }
    shape_float: { fg: "#b98eb2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7c9cae" attr: "b" }
    shape_int: { fg: "#b98eb2" attr: "b" }
    shape_internalcall: { fg: "#7c9cae" attr: "b" }
    shape_list: { fg: "#7c9cae" attr: "b" }
    shape_literal: "#8eccdd"
    shape_match_pattern: "#83a471"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7c9cae"
    shape_operator: "#b99353"
    shape_or: { fg: "#b98eb2" attr: "b" }
    shape_pipe: { fg: "#b98eb2" attr: "b" }
    shape_range: { fg: "#b99353" attr: "b" }
    shape_record: { fg: "#7c9cae" attr: "b" }
    shape_redirection: { fg: "#b98eb2" attr: "b" }
    shape_signature: { fg: "#83a471" attr: "b" }
    shape_string: "#83a471"
    shape_string_interpolation: { fg: "#7c9cae" attr: "b" }
    shape_table: { fg: "#8eccdd" attr: "b" }
    shape_variable: "#b98eb2"

    background: "#1a1a1a"
    foreground: "#cccccc"
    cursor: "#cccccc"
}}