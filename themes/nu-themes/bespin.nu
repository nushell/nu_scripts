export def main [] { return {
    separator: "#8a8986"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#54be0d" attr: "b" }
    empty: "#5ea6ea"
    bool: {|| if $in { "#afc4db" } else { "light_gray" } }
    int: "#8a8986"
    filesize: {|e|
        if $e == 0b {
            "#8a8986"
        } else if $e < 1mb {
            "#afc4db"
        } else {{ fg: "#5ea6ea" }}
    }
    duration: "#8a8986"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cf6a4c" attr: "b" }
        } else if $in < 6hr {
            "#cf6a4c"
        } else if $in < 1day {
            "#f9ee98"
        } else if $in < 3day {
            "#54be0d"
        } else if $in < 1wk {
            { fg: "#54be0d" attr: "b" }
        } else if $in < 6wk {
            "#afc4db"
        } else if $in < 52wk {
            "#5ea6ea"
        } else { "dark_gray" }
    }
    range: "#8a8986"
    float: "#8a8986"
    string: "#8a8986"
    nothing: "#8a8986"
    binary: "#8a8986"
    cellpath: "#8a8986"
    row_index: { fg: "#54be0d" attr: "b" }
    record: "#8a8986"
    list: "#8a8986"
    block: "#8a8986"
    hints: "dark_gray"
    search_result: { fg: "#cf6a4c" bg: "#8a8986" }

    shape_and: { fg: "#9b859d" attr: "b" }
    shape_binary: { fg: "#9b859d" attr: "b" }
    shape_block: { fg: "#5ea6ea" attr: "b" }
    shape_bool: "#afc4db"
    shape_custom: "#54be0d"
    shape_datetime: { fg: "#afc4db" attr: "b" }
    shape_directory: "#afc4db"
    shape_external: "#afc4db"
    shape_externalarg: { fg: "#54be0d" attr: "b" }
    shape_filepath: "#afc4db"
    shape_flag: { fg: "#5ea6ea" attr: "b" }
    shape_float: { fg: "#9b859d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#afc4db" attr: "b" }
    shape_int: { fg: "#9b859d" attr: "b" }
    shape_internalcall: { fg: "#afc4db" attr: "b" }
    shape_list: { fg: "#afc4db" attr: "b" }
    shape_literal: "#5ea6ea"
    shape_match_pattern: "#54be0d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#afc4db"
    shape_operator: "#f9ee98"
    shape_or: { fg: "#9b859d" attr: "b" }
    shape_pipe: { fg: "#9b859d" attr: "b" }
    shape_range: { fg: "#f9ee98" attr: "b" }
    shape_record: { fg: "#afc4db" attr: "b" }
    shape_redirection: { fg: "#9b859d" attr: "b" }
    shape_signature: { fg: "#54be0d" attr: "b" }
    shape_string: "#54be0d"
    shape_string_interpolation: { fg: "#afc4db" attr: "b" }
    shape_table: { fg: "#5ea6ea" attr: "b" }
    shape_variable: "#9b859d"

    background: "#28211c"
    foreground: "#8a8986"
    cursor: "#8a8986"
}}