export def main [] { return {
    separator: "#939599"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#df0002" attr: "b" }
    empty: "#790ead"
    bool: {|| if $in { "#00a0be" } else { "light_gray" } }
    int: "#939599"
    filesize: {|e|
        if $e == 0b {
            "#939599"
        } else if $e < 1mb {
            "#00a0be"
        } else {{ fg: "#790ead" }}
    }
    duration: "#939599"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#b21889" attr: "b" }
        } else if $in < 6hr {
            "#b21889"
        } else if $in < 1day {
            "#438288"
        } else if $in < 3day {
            "#df0002"
        } else if $in < 1wk {
            { fg: "#df0002" attr: "b" }
        } else if $in < 6wk {
            "#00a0be"
        } else if $in < 52wk {
            "#790ead"
        } else { "dark_gray" }
    }
    range: "#939599"
    float: "#939599"
    string: "#939599"
    nothing: "#939599"
    binary: "#939599"
    cellpath: "#939599"
    row_index: { fg: "#df0002" attr: "b" }
    record: "#939599"
    list: "#939599"
    block: "#939599"
    hints: "dark_gray"
    search_result: { fg: "#b21889" bg: "#939599" }

    shape_and: { fg: "#b21889" attr: "b" }
    shape_binary: { fg: "#b21889" attr: "b" }
    shape_block: { fg: "#790ead" attr: "b" }
    shape_bool: "#00a0be"
    shape_custom: "#df0002"
    shape_datetime: { fg: "#00a0be" attr: "b" }
    shape_directory: "#00a0be"
    shape_external: "#00a0be"
    shape_externalarg: { fg: "#df0002" attr: "b" }
    shape_filepath: "#00a0be"
    shape_flag: { fg: "#790ead" attr: "b" }
    shape_float: { fg: "#b21889" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00a0be" attr: "b" }
    shape_int: { fg: "#b21889" attr: "b" }
    shape_internalcall: { fg: "#00a0be" attr: "b" }
    shape_list: { fg: "#00a0be" attr: "b" }
    shape_literal: "#790ead"
    shape_match_pattern: "#df0002"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00a0be"
    shape_operator: "#438288"
    shape_or: { fg: "#b21889" attr: "b" }
    shape_pipe: { fg: "#b21889" attr: "b" }
    shape_range: { fg: "#438288" attr: "b" }
    shape_record: { fg: "#00a0be" attr: "b" }
    shape_redirection: { fg: "#b21889" attr: "b" }
    shape_signature: { fg: "#df0002" attr: "b" }
    shape_string: "#df0002"
    shape_string_interpolation: { fg: "#00a0be" attr: "b" }
    shape_table: { fg: "#790ead" attr: "b" }
    shape_variable: "#b21889"

    background: "#282b35"
    foreground: "#939599"
    cursor: "#939599"
}}