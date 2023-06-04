export def main [] { return {
    separator: "#5f574f"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00e756" attr: "b" }
    empty: "#83769c"
    bool: {|| if $in { "#29adff" } else { "light_gray" } }
    int: "#5f574f"
    filesize: {|e|
        if $e == 0b {
            "#5f574f"
        } else if $e < 1mb {
            "#29adff"
        } else {{ fg: "#83769c" }}
    }
    duration: "#5f574f"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ff004d" attr: "b" }
        } else if $in < 6hr {
            "#ff004d"
        } else if $in < 1day {
            "#fff024"
        } else if $in < 3day {
            "#00e756"
        } else if $in < 1wk {
            { fg: "#00e756" attr: "b" }
        } else if $in < 6wk {
            "#29adff"
        } else if $in < 52wk {
            "#83769c"
        } else { "dark_gray" }
    }
    range: "#5f574f"
    float: "#5f574f"
    string: "#5f574f"
    nothing: "#5f574f"
    binary: "#5f574f"
    cellpath: "#5f574f"
    row_index: { fg: "#00e756" attr: "b" }
    record: "#5f574f"
    list: "#5f574f"
    block: "#5f574f"
    hints: "dark_gray"
    search_result: { fg: "#ff004d" bg: "#5f574f" }

    shape_and: { fg: "#ff77a8" attr: "b" }
    shape_binary: { fg: "#ff77a8" attr: "b" }
    shape_block: { fg: "#83769c" attr: "b" }
    shape_bool: "#29adff"
    shape_custom: "#00e756"
    shape_datetime: { fg: "#29adff" attr: "b" }
    shape_directory: "#29adff"
    shape_external: "#29adff"
    shape_externalarg: { fg: "#00e756" attr: "b" }
    shape_filepath: "#29adff"
    shape_flag: { fg: "#83769c" attr: "b" }
    shape_float: { fg: "#ff77a8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#29adff" attr: "b" }
    shape_int: { fg: "#ff77a8" attr: "b" }
    shape_internalcall: { fg: "#29adff" attr: "b" }
    shape_list: { fg: "#29adff" attr: "b" }
    shape_literal: "#83769c"
    shape_match_pattern: "#00e756"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#29adff"
    shape_operator: "#fff024"
    shape_or: { fg: "#ff77a8" attr: "b" }
    shape_pipe: { fg: "#ff77a8" attr: "b" }
    shape_range: { fg: "#fff024" attr: "b" }
    shape_record: { fg: "#29adff" attr: "b" }
    shape_redirection: { fg: "#ff77a8" attr: "b" }
    shape_signature: { fg: "#00e756" attr: "b" }
    shape_string: "#00e756"
    shape_string_interpolation: { fg: "#29adff" attr: "b" }
    shape_table: { fg: "#83769c" attr: "b" }
    shape_variable: "#ff77a8"

    background: "#000000"
    foreground: "#5f574f"
    cursor: "#5f574f"
}}