export def main [] { return {
    separator: "#c7ccd1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#95c7ae" attr: "b" }
    empty: "#ae95c7"
    bool: {|| if $in { "#95aec7" } else { "light_gray" } }
    int: "#c7ccd1"
    filesize: {|e|
        if $e == 0b {
            "#c7ccd1"
        } else if $e < 1mb {
            "#95aec7"
        } else {{ fg: "#ae95c7" }}
    }
    duration: "#c7ccd1"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#c7ae95" attr: "b" }
        } else if $in < 6hr {
            "#c7ae95"
        } else if $in < 1day {
            "#aec795"
        } else if $in < 3day {
            "#95c7ae"
        } else if $in < 1wk {
            { fg: "#95c7ae" attr: "b" }
        } else if $in < 6wk {
            "#95aec7"
        } else if $in < 52wk {
            "#ae95c7"
        } else { "dark_gray" }
    }
    range: "#c7ccd1"
    float: "#c7ccd1"
    string: "#c7ccd1"
    nothing: "#c7ccd1"
    binary: "#c7ccd1"
    cellpath: "#c7ccd1"
    row_index: { fg: "#95c7ae" attr: "b" }
    record: "#c7ccd1"
    list: "#c7ccd1"
    block: "#c7ccd1"
    hints: "dark_gray"
    search_result: { fg: "#c7ae95" bg: "#c7ccd1" }

    shape_and: { fg: "#c795ae" attr: "b" }
    shape_binary: { fg: "#c795ae" attr: "b" }
    shape_block: { fg: "#ae95c7" attr: "b" }
    shape_bool: "#95aec7"
    shape_custom: "#95c7ae"
    shape_datetime: { fg: "#95aec7" attr: "b" }
    shape_directory: "#95aec7"
    shape_external: "#95aec7"
    shape_externalarg: { fg: "#95c7ae" attr: "b" }
    shape_filepath: "#95aec7"
    shape_flag: { fg: "#ae95c7" attr: "b" }
    shape_float: { fg: "#c795ae" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#95aec7" attr: "b" }
    shape_int: { fg: "#c795ae" attr: "b" }
    shape_internalcall: { fg: "#95aec7" attr: "b" }
    shape_list: { fg: "#95aec7" attr: "b" }
    shape_literal: "#ae95c7"
    shape_match_pattern: "#95c7ae"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#95aec7"
    shape_operator: "#aec795"
    shape_or: { fg: "#c795ae" attr: "b" }
    shape_pipe: { fg: "#c795ae" attr: "b" }
    shape_range: { fg: "#aec795" attr: "b" }
    shape_record: { fg: "#95aec7" attr: "b" }
    shape_redirection: { fg: "#c795ae" attr: "b" }
    shape_signature: { fg: "#95c7ae" attr: "b" }
    shape_string: "#95c7ae"
    shape_string_interpolation: { fg: "#95aec7" attr: "b" }
    shape_table: { fg: "#ae95c7" attr: "b" }
    shape_variable: "#c795ae"

    background: "#1c2023"
    foreground: "#c7ccd1"
    cursor: "#c7ccd1"
}}