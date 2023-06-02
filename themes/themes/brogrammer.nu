export def main [] { return {
    separator: "#4e5ab7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#f3bd09" attr: "b" }
    empty: "#5350b9"
    bool: {|| if $in { "#1081d6" } else { "light_gray" } }
    int: "#4e5ab7"
    filesize: {|e|
        if $e == 0b {
            "#4e5ab7"
        } else if $e < 1mb {
            "#1081d6"
        } else {{ fg: "#5350b9" }}
    }
    duration: "#4e5ab7"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#d6dbe5" attr: "b" }
        } else if $in < 6hr {
            "#d6dbe5"
        } else if $in < 1day {
            "#1dd361"
        } else if $in < 3day {
            "#f3bd09"
        } else if $in < 1wk {
            { fg: "#f3bd09" attr: "b" }
        } else if $in < 6wk {
            "#1081d6"
        } else if $in < 52wk {
            "#5350b9"
        } else { "dark_gray" }
    }
    range: "#4e5ab7"
    float: "#4e5ab7"
    string: "#4e5ab7"
    nothing: "#4e5ab7"
    binary: "#4e5ab7"
    cellpath: "#4e5ab7"
    row_index: { fg: "#f3bd09" attr: "b" }
    record: "#4e5ab7"
    list: "#4e5ab7"
    block: "#4e5ab7"
    hints: "dark_gray"
    search_result: { fg: "#d6dbe5" bg: "#4e5ab7" }

    shape_and: { fg: "#0f7ddb" attr: "b" }
    shape_binary: { fg: "#0f7ddb" attr: "b" }
    shape_block: { fg: "#5350b9" attr: "b" }
    shape_bool: "#1081d6"
    shape_custom: "#f3bd09"
    shape_datetime: { fg: "#1081d6" attr: "b" }
    shape_directory: "#1081d6"
    shape_external: "#1081d6"
    shape_externalarg: { fg: "#f3bd09" attr: "b" }
    shape_filepath: "#1081d6"
    shape_flag: { fg: "#5350b9" attr: "b" }
    shape_float: { fg: "#0f7ddb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1081d6" attr: "b" }
    shape_int: { fg: "#0f7ddb" attr: "b" }
    shape_internalcall: { fg: "#1081d6" attr: "b" }
    shape_list: { fg: "#1081d6" attr: "b" }
    shape_literal: "#5350b9"
    shape_match_pattern: "#f3bd09"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1081d6"
    shape_operator: "#1dd361"
    shape_or: { fg: "#0f7ddb" attr: "b" }
    shape_pipe: { fg: "#0f7ddb" attr: "b" }
    shape_range: { fg: "#1dd361" attr: "b" }
    shape_record: { fg: "#1081d6" attr: "b" }
    shape_redirection: { fg: "#0f7ddb" attr: "b" }
    shape_signature: { fg: "#f3bd09" attr: "b" }
    shape_string: "#f3bd09"
    shape_string_interpolation: { fg: "#1081d6" attr: "b" }
    shape_table: { fg: "#5350b9" attr: "b" }
    shape_variable: "#0f7ddb"

    background: "#1f1f1f"
    foreground: "#4e5ab7"
    cursor: "#4e5ab7"
}}