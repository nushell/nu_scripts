export def main [] { return {
    separator: "#eeedee"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#afd383" attr: "b" }
    empty: "#7d90a4"
    bool: {|| if $in { "#dfdffd" } else { "light_gray" } }
    int: "#eeedee"
    filesize: {|e|
        if $e == 0b {
            "#eeedee"
        } else if $e < 1mb {
            "#85a6a5"
        } else {{ fg: "#7d90a4" }}
    }
    duration: "#eeedee"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#af4b57" attr: "b" }
        } else if $in < 6hr {
            "#af4b57"
        } else if $in < 1day {
            "#e5c079"
        } else if $in < 3day {
            "#afd383"
        } else if $in < 1wk {
            { fg: "#afd383" attr: "b" }
        } else if $in < 6wk {
            "#85a6a5"
        } else if $in < 52wk {
            "#7d90a4"
        } else { "dark_gray" }
    }
    range: "#eeedee"
    float: "#eeedee"
    string: "#eeedee"
    nothing: "#eeedee"
    binary: "#eeedee"
    cellpath: "#eeedee"
    row_index: { fg: "#afd383" attr: "b" }
    record: "#eeedee"
    list: "#eeedee"
    block: "#eeedee"
    hints: "dark_gray"
    search_result: { fg: "#af4b57" bg: "#eeedee" }

    shape_and: { fg: "#a4799d" attr: "b" }
    shape_binary: { fg: "#a4799d" attr: "b" }
    shape_block: { fg: "#7d90a4" attr: "b" }
    shape_bool: "#dfdffd"
    shape_custom: "#afd383"
    shape_datetime: { fg: "#85a6a5" attr: "b" }
    shape_directory: "#85a6a5"
    shape_external: "#85a6a5"
    shape_externalarg: { fg: "#afd383" attr: "b" }
    shape_filepath: "#85a6a5"
    shape_flag: { fg: "#7d90a4" attr: "b" }
    shape_float: { fg: "#a4799d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#85a6a5" attr: "b" }
    shape_int: { fg: "#a4799d" attr: "b" }
    shape_internalcall: { fg: "#85a6a5" attr: "b" }
    shape_list: { fg: "#85a6a5" attr: "b" }
    shape_literal: "#7d90a4"
    shape_match_pattern: "#afd383"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#dfdffd"
    shape_operator: "#e5c079"
    shape_or: { fg: "#a4799d" attr: "b" }
    shape_pipe: { fg: "#a4799d" attr: "b" }
    shape_range: { fg: "#e5c079" attr: "b" }
    shape_record: { fg: "#85a6a5" attr: "b" }
    shape_redirection: { fg: "#a4799d" attr: "b" }
    shape_signature: { fg: "#afd383" attr: "b" }
    shape_string: "#afd383"
    shape_string_interpolation: { fg: "#85a6a5" attr: "b" }
    shape_table: { fg: "#7d90a4" attr: "b" }
    shape_variable: "#a4799d"

    background: "#1c1f27"
    foreground: "#979cac"
    cursor: "#979cac"
}}