export def main [] { return {
    separator: "#80cbc4"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#91b859" attr: "b" }
    empty: "#6182b8"
    bool: {|| if $in { "#39adb5" } else { "light_gray" } }
    int: "#80cbc4"
    filesize: {|e|
        if $e == 0b {
            "#80cbc4"
        } else if $e < 1mb {
            "#39adb5"
        } else {{ fg: "#6182b8" }}
    }
    duration: "#80cbc4"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff5370" attr: "b" }
        } else if $in < 6hr {
            "#ff5370"
        } else if $in < 1day {
            "#ffb62c"
        } else if $in < 3day {
            "#91b859"
        } else if $in < 1wk {
            { fg: "#91b859" attr: "b" }
        } else if $in < 6wk {
            "#39adb5"
        } else if $in < 52wk {
            "#6182b8"
        } else { "dark_gray" }
    }
    range: "#80cbc4"
    float: "#80cbc4"
    string: "#80cbc4"
    nothing: "#80cbc4"
    binary: "#80cbc4"
    cellpath: "#80cbc4"
    row_index: { fg: "#91b859" attr: "b" }
    record: "#80cbc4"
    list: "#80cbc4"
    block: "#80cbc4"
    hints: "dark_gray"
    search_result: { fg: "#ff5370" bg: "#80cbc4" }

    shape_and: { fg: "#7c4dff" attr: "b" }
    shape_binary: { fg: "#7c4dff" attr: "b" }
    shape_block: { fg: "#6182b8" attr: "b" }
    shape_bool: "#39adb5"
    shape_custom: "#91b859"
    shape_datetime: { fg: "#39adb5" attr: "b" }
    shape_directory: "#39adb5"
    shape_external: "#39adb5"
    shape_externalarg: { fg: "#91b859" attr: "b" }
    shape_filepath: "#39adb5"
    shape_flag: { fg: "#6182b8" attr: "b" }
    shape_float: { fg: "#7c4dff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#39adb5" attr: "b" }
    shape_int: { fg: "#7c4dff" attr: "b" }
    shape_internalcall: { fg: "#39adb5" attr: "b" }
    shape_list: { fg: "#39adb5" attr: "b" }
    shape_literal: "#6182b8"
    shape_match_pattern: "#91b859"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#39adb5"
    shape_operator: "#ffb62c"
    shape_or: { fg: "#7c4dff" attr: "b" }
    shape_pipe: { fg: "#7c4dff" attr: "b" }
    shape_range: { fg: "#ffb62c" attr: "b" }
    shape_record: { fg: "#39adb5" attr: "b" }
    shape_redirection: { fg: "#7c4dff" attr: "b" }
    shape_signature: { fg: "#91b859" attr: "b" }
    shape_string: "#91b859"
    shape_string_interpolation: { fg: "#39adb5" attr: "b" }
    shape_table: { fg: "#6182b8" attr: "b" }
    shape_variable: "#7c4dff"

    background: "#fafafa"
    foreground: "#80cbc4"
    cursor: "#80cbc4"
}}