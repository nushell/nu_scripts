export def main [] { return {
    separator: "#33374c"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#668e3d" attr: "b" }
    empty: "#2d539e"
    bool: {|| if $in { "#327698" } else { "light_gray" } }
    int: "#33374c"
    filesize: {|e|
        if $e == 0b {
            "#33374c"
        } else if $e < 1mb {
            "#3f83a6"
        } else {{ fg: "#2d539e" }}
    }
    duration: "#33374c"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cc517a" attr: "b" }
        } else if $in < 6hr {
            "#cc517a"
        } else if $in < 1day {
            "#c57339"
        } else if $in < 3day {
            "#668e3d"
        } else if $in < 1wk {
            { fg: "#668e3d" attr: "b" }
        } else if $in < 6wk {
            "#3f83a6"
        } else if $in < 52wk {
            "#2d539e"
        } else { "dark_gray" }
    }
    range: "#33374c"
    float: "#33374c"
    string: "#33374c"
    nothing: "#33374c"
    binary: "#33374c"
    cellpath: "#33374c"
    row_index: { fg: "#668e3d" attr: "b" }
    record: "#33374c"
    list: "#33374c"
    block: "#33374c"
    hints: "dark_gray"
    search_result: { fg: "#cc517a" bg: "#33374c" }

    shape_and: { fg: "#7759b4" attr: "b" }
    shape_binary: { fg: "#7759b4" attr: "b" }
    shape_block: { fg: "#2d539e" attr: "b" }
    shape_bool: "#327698"
    shape_custom: "#668e3d"
    shape_datetime: { fg: "#3f83a6" attr: "b" }
    shape_directory: "#3f83a6"
    shape_external: "#3f83a6"
    shape_externalarg: { fg: "#668e3d" attr: "b" }
    shape_filepath: "#3f83a6"
    shape_flag: { fg: "#2d539e" attr: "b" }
    shape_float: { fg: "#7759b4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3f83a6" attr: "b" }
    shape_int: { fg: "#7759b4" attr: "b" }
    shape_internalcall: { fg: "#3f83a6" attr: "b" }
    shape_list: { fg: "#3f83a6" attr: "b" }
    shape_literal: "#2d539e"
    shape_match_pattern: "#668e3d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#327698"
    shape_operator: "#c57339"
    shape_or: { fg: "#7759b4" attr: "b" }
    shape_pipe: { fg: "#7759b4" attr: "b" }
    shape_range: { fg: "#c57339" attr: "b" }
    shape_record: { fg: "#3f83a6" attr: "b" }
    shape_redirection: { fg: "#7759b4" attr: "b" }
    shape_signature: { fg: "#668e3d" attr: "b" }
    shape_string: "#668e3d"
    shape_string_interpolation: { fg: "#3f83a6" attr: "b" }
    shape_table: { fg: "#2d539e" attr: "b" }
    shape_variable: "#7759b4"

    background: "#e8e9ec"
    foreground: "#33374c"
    cursor: "#33374c"
}}