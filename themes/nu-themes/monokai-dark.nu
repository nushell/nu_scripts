export def main [] { return {
    separator: "#f9f8f5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a6e22e" attr: "b" }
    empty: "#66d9ef"
    bool: {|| if $in { "#2aa198" } else { "light_gray" } }
    int: "#f9f8f5"
    filesize: {|e|
        if $e == 0b {
            "#f9f8f5"
        } else if $e < 1mb {
            "#2aa198"
        } else {{ fg: "#66d9ef" }}
    }
    duration: "#f9f8f5"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#f92672" attr: "b" }
        } else if $in < 6hr {
            "#f92672"
        } else if $in < 1day {
            "#f4bf75"
        } else if $in < 3day {
            "#a6e22e"
        } else if $in < 1wk {
            { fg: "#a6e22e" attr: "b" }
        } else if $in < 6wk {
            "#2aa198"
        } else if $in < 52wk {
            "#66d9ef"
        } else { "dark_gray" }
    }
    range: "#f9f8f5"
    float: "#f9f8f5"
    string: "#f9f8f5"
    nothing: "#f9f8f5"
    binary: "#f9f8f5"
    cellpath: "#f9f8f5"
    row_index: { fg: "#a6e22e" attr: "b" }
    record: "#f9f8f5"
    list: "#f9f8f5"
    block: "#f9f8f5"
    hints: "dark_gray"
    search_result: { fg: "#f92672" bg: "#f9f8f5" }

    shape_and: { fg: "#ae81ff" attr: "b" }
    shape_binary: { fg: "#ae81ff" attr: "b" }
    shape_block: { fg: "#66d9ef" attr: "b" }
    shape_bool: "#2aa198"
    shape_custom: "#a6e22e"
    shape_datetime: { fg: "#2aa198" attr: "b" }
    shape_directory: "#2aa198"
    shape_external: "#2aa198"
    shape_externalarg: { fg: "#a6e22e" attr: "b" }
    shape_filepath: "#2aa198"
    shape_flag: { fg: "#66d9ef" attr: "b" }
    shape_float: { fg: "#ae81ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2aa198" attr: "b" }
    shape_int: { fg: "#ae81ff" attr: "b" }
    shape_internalcall: { fg: "#2aa198" attr: "b" }
    shape_list: { fg: "#2aa198" attr: "b" }
    shape_literal: "#66d9ef"
    shape_match_pattern: "#a6e22e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2aa198"
    shape_operator: "#f4bf75"
    shape_or: { fg: "#ae81ff" attr: "b" }
    shape_pipe: { fg: "#ae81ff" attr: "b" }
    shape_range: { fg: "#f4bf75" attr: "b" }
    shape_record: { fg: "#2aa198" attr: "b" }
    shape_redirection: { fg: "#ae81ff" attr: "b" }
    shape_signature: { fg: "#a6e22e" attr: "b" }
    shape_string: "#a6e22e"
    shape_string_interpolation: { fg: "#2aa198" attr: "b" }
    shape_table: { fg: "#66d9ef" attr: "b" }
    shape_variable: "#ae81ff"

    background: "#272822"
    foreground: "#f8f8f2"
    cursor: "#f8f8f2"
}}