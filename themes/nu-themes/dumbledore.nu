export def main [] { return {
    separator: "#850000"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#3e7c54" attr: "b" }
    empty: "#415baf"
    bool: {|| if $in { "#25de50" } else { "light_gray" } }
    int: "#850000"
    filesize: {|e|
        if $e == 0b {
            "#850000"
        } else if $e < 1mb {
            "#008aff"
        } else {{ fg: "#415baf" }}
    }
    duration: "#850000"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ae0000" attr: "b" }
        } else if $in < 6hr {
            "#ae0000"
        } else if $in < 1day {
            "#f0c75e"
        } else if $in < 3day {
            "#3e7c54"
        } else if $in < 1wk {
            { fg: "#3e7c54" attr: "b" }
        } else if $in < 6wk {
            "#008aff"
        } else if $in < 52wk {
            "#415baf"
        } else { "dark_gray" }
    }
    range: "#850000"
    float: "#850000"
    string: "#850000"
    nothing: "#850000"
    binary: "#850000"
    cellpath: "#850000"
    row_index: { fg: "#3e7c54" attr: "b" }
    record: "#850000"
    list: "#850000"
    block: "#850000"
    hints: "dark_gray"
    search_result: { fg: "#ae0000" bg: "#850000" }

    shape_and: { fg: "#9445ae" attr: "b" }
    shape_binary: { fg: "#9445ae" attr: "b" }
    shape_block: { fg: "#415baf" attr: "b" }
    shape_bool: "#25de50"
    shape_custom: "#3e7c54"
    shape_datetime: { fg: "#008aff" attr: "b" }
    shape_directory: "#008aff"
    shape_external: "#008aff"
    shape_externalarg: { fg: "#3e7c54" attr: "b" }
    shape_filepath: "#008aff"
    shape_flag: { fg: "#415baf" attr: "b" }
    shape_float: { fg: "#9445ae" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#008aff" attr: "b" }
    shape_int: { fg: "#9445ae" attr: "b" }
    shape_internalcall: { fg: "#008aff" attr: "b" }
    shape_list: { fg: "#008aff" attr: "b" }
    shape_literal: "#415baf"
    shape_match_pattern: "#3e7c54"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#25de50"
    shape_operator: "#f0c75e"
    shape_or: { fg: "#9445ae" attr: "b" }
    shape_pipe: { fg: "#9445ae" attr: "b" }
    shape_range: { fg: "#f0c75e" attr: "b" }
    shape_record: { fg: "#008aff" attr: "b" }
    shape_redirection: { fg: "#9445ae" attr: "b" }
    shape_signature: { fg: "#3e7c54" attr: "b" }
    shape_string: "#3e7c54"
    shape_string_interpolation: { fg: "#008aff" attr: "b" }
    shape_table: { fg: "#415baf" attr: "b" }
    shape_variable: "#9445ae"

    background: "#422553"
    foreground: "#c4c8c5"
    cursor: "#c4c8c5"
}}