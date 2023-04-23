export def main [] { return {
    separator: "#cbcccb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a5e055" attr: "b" }
    empty: "#496487"
    bool: {|| if $in { "#86eafe" } else { "light_gray" } }
    int: "#cbcccb"
    filesize: {|e|
      if $e == 0b {
        "#cbcccb"
      } else if $e < 1mb {
        "#86e9fe"
      } else {{ fg: "#496487" }}
    }
    duration: "#cbcccb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff1b00" attr: "b" }
      } else if $in < 6hr {
        "#ff1b00"
      } else if $in < 1day {
        "#fbe74a"
      } else if $in < 3day {
        "#a5e055"
      } else if $in < 1wk {
        { fg: "#a5e055" attr: "b" }
      } else if $in < 6wk {
        "#86e9fe"
      } else if $in < 52wk {
        "#496487"
      } else { "dark_gray" }
    }
    range: "#cbcccb"
    float: "#cbcccb"
    string: "#cbcccb"
    nothing: "#cbcccb"
    binary: "#cbcccb"
    cellpath: "#cbcccb"
    row_index: { fg: "#a5e055" attr: "b" }
    record: "#cbcccb"
    list: "#cbcccb"
    block: "#cbcccb"
    hints: "dark_gray"

    shape_and: { fg: "#fd5ff1" attr: "b" }
    shape_binary: { fg: "#fd5ff1" attr: "b" }
    shape_block: { fg: "#496487" attr: "b" }
    shape_bool: "#86eafe"
    shape_custom: "#a5e055"
    shape_datetime: { fg: "#86e9fe" attr: "b" }
    shape_directory: "#86e9fe"
    shape_external: "#86e9fe"
    shape_externalarg: { fg: "#a5e055" attr: "b" }
    shape_filepath: "#86e9fe"
    shape_flag: { fg: "#496487" attr: "b" }
    shape_float: { fg: "#fd5ff1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#86e9fe" attr: "b" }
    shape_int: { fg: "#fd5ff1" attr: "b" }
    shape_internalcall: { fg: "#86e9fe" attr: "b" }
    shape_list: { fg: "#86e9fe" attr: "b" }
    shape_literal: "#496487"
    shape_match_pattern: "#a5e055"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#86eafe"
    shape_operator: "#fbe74a"
    shape_or: { fg: "#fd5ff1" attr: "b" }
    shape_pipe: { fg: "#fd5ff1" attr: "b" }
    shape_range: { fg: "#fbe74a" attr: "b" }
    shape_record: { fg: "#86e9fe" attr: "b" }
    shape_redirection: { fg: "#fd5ff1" attr: "b" }
    shape_signature: { fg: "#a5e055" attr: "b" }
    shape_string: "#a5e055"
    shape_string_interpolation: { fg: "#86e9fe" attr: "b" }
    shape_table: { fg: "#496487" attr: "b" }
    shape_variable: "#fd5ff1"

    background: "#000000"
    foreground: "#dbdbdb"
    cursor: "#dbdbdb"
}}