export def main [] { return {
    separator: "#535c65"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4d7f43" attr: "b" }
    empty: "#2b7ab2"
    bool: {|| if $in { "#008483" } else { "light_gray" } }
    int: "#535c65"
    filesize: {|e|
        if $e == 0b {
            "#535c65"
        } else if $e < 1mb {
            "#008483"
        } else {{ fg: "#2b7ab2" }}
    }
    duration: "#535c65"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ae5865" attr: "b" }
        } else if $in < 6hr {
            "#ae5865"
        } else if $in < 1day {
            "#906c33"
        } else if $in < 3day {
            "#4d7f43"
        } else if $in < 1wk {
            { fg: "#4d7f43" attr: "b" }
        } else if $in < 6wk {
            "#008483"
        } else if $in < 52wk {
            "#2b7ab2"
        } else { "dark_gray" }
    }
    range: "#535c65"
    float: "#535c65"
    string: "#535c65"
    nothing: "#535c65"
    binary: "#535c65"
    cellpath: "#535c65"
    row_index: { fg: "#4d7f43" attr: "b" }
    record: "#535c65"
    list: "#535c65"
    block: "#535c65"
    hints: "dark_gray"
    search_result: { fg: "#ae5865" bg: "#535c65" }

    shape_and: { fg: "#8f63a2" attr: "b" }
    shape_binary: { fg: "#8f63a2" attr: "b" }
    shape_block: { fg: "#2b7ab2" attr: "b" }
    shape_bool: "#008483"
    shape_custom: "#4d7f43"
    shape_datetime: { fg: "#008483" attr: "b" }
    shape_directory: "#008483"
    shape_external: "#008483"
    shape_externalarg: { fg: "#4d7f43" attr: "b" }
    shape_filepath: "#008483"
    shape_flag: { fg: "#2b7ab2" attr: "b" }
    shape_float: { fg: "#8f63a2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#008483" attr: "b" }
    shape_int: { fg: "#8f63a2" attr: "b" }
    shape_internalcall: { fg: "#008483" attr: "b" }
    shape_list: { fg: "#008483" attr: "b" }
    shape_literal: "#2b7ab2"
    shape_match_pattern: "#4d7f43"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#008483"
    shape_operator: "#906c33"
    shape_or: { fg: "#8f63a2" attr: "b" }
    shape_pipe: { fg: "#8f63a2" attr: "b" }
    shape_range: { fg: "#906c33" attr: "b" }
    shape_record: { fg: "#008483" attr: "b" }
    shape_redirection: { fg: "#8f63a2" attr: "b" }
    shape_signature: { fg: "#4d7f43" attr: "b" }
    shape_string: "#4d7f43"
    shape_string_interpolation: { fg: "#008483" attr: "b" }
    shape_table: { fg: "#2b7ab2" attr: "b" }
    shape_variable: "#8f63a2"

    background: "#fbffff"
    foreground: "#535c65"
    cursor: "#434951"
}}