export def main [] { return {
    separator: "#d3c6aa"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a7c080" attr: "b" }
    empty: "#7fbbb3"
    bool: {|| if $in { "#83c092" } else { "light_gray" } }
    int: "#d3c6aa"
    filesize: {|e|
        if $e == 0b {
            "#d3c6aa"
        } else if $e < 1mb {
            "#83c092"
        } else {{ fg: "#7fbbb3" }}
    }
    duration: "#d3c6aa"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#e67e80" attr: "b" }
        } else if $in < 6hr {
            "#e67e80"
        } else if $in < 1day {
            "#dbbc7f"
        } else if $in < 3day {
            "#a7c080"
        } else if $in < 1wk {
            { fg: "#a7c080" attr: "b" }
        } else if $in < 6wk {
            "#83c092"
        } else if $in < 52wk {
            "#7fbbb3"
        } else { "dark_gray" }
    }
    range: "#d3c6aa"
    float: "#d3c6aa"
    string: "#d3c6aa"
    nothing: "#d3c6aa"
    binary: "#d3c6aa"
    cellpath: "#d3c6aa"
    row_index: { fg: "#a7c080" attr: "b" }
    record: "#d3c6aa"
    list: "#d3c6aa"
    block: "#d3c6aa"
    hints: "dark_gray"
    search_result: { fg: "#e67e80" bg: "#d3c6aa" }

    shape_and: { fg: "#d699b6" attr: "b" }
    shape_binary: { fg: "#d699b6" attr: "b" }
    shape_block: { fg: "#7fbbb3" attr: "b" }
    shape_bool: "#83c092"
    shape_custom: "#a7c080"
    shape_datetime: { fg: "#83c092" attr: "b" }
    shape_directory: "#83c092"
    shape_external: "#83c092"
    shape_externalarg: { fg: "#a7c080" attr: "b" }
    shape_filepath: "#83c092"
    shape_flag: { fg: "#7fbbb3" attr: "b" }
    shape_float: { fg: "#d699b6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#83c092" attr: "b" }
    shape_int: { fg: "#d699b6" attr: "b" }
    shape_internalcall: { fg: "#83c092" attr: "b" }
    shape_list: { fg: "#83c092" attr: "b" }
    shape_literal: "#7fbbb3"
    shape_match_pattern: "#a7c080"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#83c092"
    shape_operator: "#dbbc7f"
    shape_or: { fg: "#d699b6" attr: "b" }
    shape_pipe: { fg: "#d699b6" attr: "b" }
    shape_range: { fg: "#dbbc7f" attr: "b" }
    shape_record: { fg: "#83c092" attr: "b" }
    shape_redirection: { fg: "#d699b6" attr: "b" }
    shape_signature: { fg: "#a7c080" attr: "b" }
    shape_string: "#a7c080"
    shape_string_interpolation: { fg: "#83c092" attr: "b" }
    shape_table: { fg: "#7fbbb3" attr: "b" }
    shape_variable: "#d699b6"

    background: "#2f383e"
    foreground: "#d3c6aa"
    cursor: "#d3c6aa"
}}