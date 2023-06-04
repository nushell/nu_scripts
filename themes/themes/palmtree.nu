export def main [] { return {
    separator: "#fdfdfd"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5adecd" attr: "b" }
    empty: "#8897f4"
    bool: {|| if $in { "#3fdcee" } else { "light_gray" } }
    int: "#fdfdfd"
    filesize: {|e|
        if $e == 0b {
            "#fdfdfd"
        } else if $e < 1mb {
            "#79e6f3"
        } else {{ fg: "#8897f4" }}
    }
    duration: "#fdfdfd"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f37f97" attr: "b" }
        } else if $in < 6hr {
            "#f37f97"
        } else if $in < 1day {
            "#f2a272"
        } else if $in < 3day {
            "#5adecd"
        } else if $in < 1wk {
            { fg: "#5adecd" attr: "b" }
        } else if $in < 6wk {
            "#79e6f3"
        } else if $in < 52wk {
            "#8897f4"
        } else { "dark_gray" }
    }
    range: "#fdfdfd"
    float: "#fdfdfd"
    string: "#fdfdfd"
    nothing: "#fdfdfd"
    binary: "#fdfdfd"
    cellpath: "#fdfdfd"
    row_index: { fg: "#5adecd" attr: "b" }
    record: "#fdfdfd"
    list: "#fdfdfd"
    block: "#fdfdfd"
    hints: "dark_gray"
    search_result: { fg: "#f37f97" bg: "#fdfdfd" }

    shape_and: { fg: "#c574dd" attr: "b" }
    shape_binary: { fg: "#c574dd" attr: "b" }
    shape_block: { fg: "#8897f4" attr: "b" }
    shape_bool: "#3fdcee"
    shape_custom: "#5adecd"
    shape_datetime: { fg: "#79e6f3" attr: "b" }
    shape_directory: "#79e6f3"
    shape_external: "#79e6f3"
    shape_externalarg: { fg: "#5adecd" attr: "b" }
    shape_filepath: "#79e6f3"
    shape_flag: { fg: "#8897f4" attr: "b" }
    shape_float: { fg: "#c574dd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#79e6f3" attr: "b" }
    shape_int: { fg: "#c574dd" attr: "b" }
    shape_internalcall: { fg: "#79e6f3" attr: "b" }
    shape_list: { fg: "#79e6f3" attr: "b" }
    shape_literal: "#8897f4"
    shape_match_pattern: "#5adecd"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3fdcee"
    shape_operator: "#f2a272"
    shape_or: { fg: "#c574dd" attr: "b" }
    shape_pipe: { fg: "#c574dd" attr: "b" }
    shape_range: { fg: "#f2a272" attr: "b" }
    shape_record: { fg: "#79e6f3" attr: "b" }
    shape_redirection: { fg: "#c574dd" attr: "b" }
    shape_signature: { fg: "#5adecd" attr: "b" }
    shape_string: "#5adecd"
    shape_string_interpolation: { fg: "#79e6f3" attr: "b" }
    shape_table: { fg: "#8897f4" attr: "b" }
    shape_variable: "#c574dd"

    background: "#282a36"
    foreground: "#b043d1"
    cursor: "#3fdcee"
}}