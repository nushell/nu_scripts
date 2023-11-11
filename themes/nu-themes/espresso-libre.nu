export def main [] { return {
    separator: "#d3d7cf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#1a921c" attr: "b" }
    empty: "#0066ff"
    bool: {|| if $in { "#34e2e2" } else { "light_gray" } }
    int: "#d3d7cf"
    filesize: {|e|
        if $e == 0b {
            "#d3d7cf"
        } else if $e < 1mb {
            "#06989a"
        } else {{ fg: "#0066ff" }}
    }
    duration: "#d3d7cf"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#cc0000" attr: "b" }
        } else if $in < 6hr {
            "#cc0000"
        } else if $in < 1day {
            "#f0e53a"
        } else if $in < 3day {
            "#1a921c"
        } else if $in < 1wk {
            { fg: "#1a921c" attr: "b" }
        } else if $in < 6wk {
            "#06989a"
        } else if $in < 52wk {
            "#0066ff"
        } else { "dark_gray" }
    }
    range: "#d3d7cf"
    float: "#d3d7cf"
    string: "#d3d7cf"
    nothing: "#d3d7cf"
    binary: "#d3d7cf"
    cellpath: "#d3d7cf"
    row_index: { fg: "#1a921c" attr: "b" }
    record: "#d3d7cf"
    list: "#d3d7cf"
    block: "#d3d7cf"
    hints: "dark_gray"
    search_result: { fg: "#cc0000" bg: "#d3d7cf" }

    shape_and: { fg: "#c5656b" attr: "b" }
    shape_binary: { fg: "#c5656b" attr: "b" }
    shape_block: { fg: "#0066ff" attr: "b" }
    shape_bool: "#34e2e2"
    shape_custom: "#1a921c"
    shape_datetime: { fg: "#06989a" attr: "b" }
    shape_directory: "#06989a"
    shape_external: "#06989a"
    shape_externalarg: { fg: "#1a921c" attr: "b" }
    shape_filepath: "#06989a"
    shape_flag: { fg: "#0066ff" attr: "b" }
    shape_float: { fg: "#c5656b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#06989a" attr: "b" }
    shape_int: { fg: "#c5656b" attr: "b" }
    shape_internalcall: { fg: "#06989a" attr: "b" }
    shape_list: { fg: "#06989a" attr: "b" }
    shape_literal: "#0066ff"
    shape_match_pattern: "#1a921c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#34e2e2"
    shape_operator: "#f0e53a"
    shape_or: { fg: "#c5656b" attr: "b" }
    shape_pipe: { fg: "#c5656b" attr: "b" }
    shape_range: { fg: "#f0e53a" attr: "b" }
    shape_record: { fg: "#06989a" attr: "b" }
    shape_redirection: { fg: "#c5656b" attr: "b" }
    shape_signature: { fg: "#1a921c" attr: "b" }
    shape_string: "#1a921c"
    shape_string_interpolation: { fg: "#06989a" attr: "b" }
    shape_table: { fg: "#0066ff" attr: "b" }
    shape_variable: "#c5656b"

    background: "#2a211c"
    foreground: "#b8a898"
    cursor: "#b8a898"
}}