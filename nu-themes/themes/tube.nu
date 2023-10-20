export def main [] { return {
    separator: "#d9d8d8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00853e" attr: "b" }
    empty: "#009ddc"
    bool: {|| if $in { "#85cebc" } else { "light_gray" } }
    int: "#d9d8d8"
    filesize: {|e|
        if $e == 0b {
            "#d9d8d8"
        } else if $e < 1mb {
            "#85cebc"
        } else {{ fg: "#009ddc" }}
    }
    duration: "#d9d8d8"
    date: {|| (date now) - $in |
        if $in < 1hr {
            { fg: "#ee2e24" attr: "b" }
        } else if $in < 6hr {
            "#ee2e24"
        } else if $in < 1day {
            "#ffd204"
        } else if $in < 3day {
            "#00853e"
        } else if $in < 1wk {
            { fg: "#00853e" attr: "b" }
        } else if $in < 6wk {
            "#85cebc"
        } else if $in < 52wk {
            "#009ddc"
        } else { "dark_gray" }
    }
    range: "#d9d8d8"
    float: "#d9d8d8"
    string: "#d9d8d8"
    nothing: "#d9d8d8"
    binary: "#d9d8d8"
    cellpath: "#d9d8d8"
    row_index: { fg: "#00853e" attr: "b" }
    record: "#d9d8d8"
    list: "#d9d8d8"
    block: "#d9d8d8"
    hints: "dark_gray"
    search_result: { fg: "#ee2e24" bg: "#d9d8d8" }

    shape_and: { fg: "#98005d" attr: "b" }
    shape_binary: { fg: "#98005d" attr: "b" }
    shape_block: { fg: "#009ddc" attr: "b" }
    shape_bool: "#85cebc"
    shape_custom: "#00853e"
    shape_datetime: { fg: "#85cebc" attr: "b" }
    shape_directory: "#85cebc"
    shape_external: "#85cebc"
    shape_externalarg: { fg: "#00853e" attr: "b" }
    shape_filepath: "#85cebc"
    shape_flag: { fg: "#009ddc" attr: "b" }
    shape_float: { fg: "#98005d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#85cebc" attr: "b" }
    shape_int: { fg: "#98005d" attr: "b" }
    shape_internalcall: { fg: "#85cebc" attr: "b" }
    shape_list: { fg: "#85cebc" attr: "b" }
    shape_literal: "#009ddc"
    shape_match_pattern: "#00853e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#85cebc"
    shape_operator: "#ffd204"
    shape_or: { fg: "#98005d" attr: "b" }
    shape_pipe: { fg: "#98005d" attr: "b" }
    shape_range: { fg: "#ffd204" attr: "b" }
    shape_record: { fg: "#85cebc" attr: "b" }
    shape_redirection: { fg: "#98005d" attr: "b" }
    shape_signature: { fg: "#00853e" attr: "b" }
    shape_string: "#00853e"
    shape_string_interpolation: { fg: "#85cebc" attr: "b" }
    shape_table: { fg: "#009ddc" attr: "b" }
    shape_variable: "#98005d"

    background: "#231f20"
    foreground: "#d9d8d8"
    cursor: "#d9d8d8"
}}