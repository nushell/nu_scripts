export def main [] { return {
    separator: "#526057"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#489963" attr: "b" }
    empty: "#478c90"
    bool: {|| if $in { "#1c9aa0" } else { "light_gray" } }
    int: "#526057"
    filesize: {|e|
      if $e == 0b {
        "#526057"
      } else if $e < 1mb {
        "#1c9aa0"
      } else {{ fg: "#478c90" }}
    }
    duration: "#526057"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b16139" attr: "b" }
      } else if $in < 6hr {
        "#b16139"
      } else if $in < 1day {
        "#a07e3b"
      } else if $in < 3day {
        "#489963"
      } else if $in < 1wk {
        { fg: "#489963" attr: "b" }
      } else if $in < 6wk {
        "#1c9aa0"
      } else if $in < 52wk {
        "#478c90"
      } else { "dark_gray" }
    }
    range: "#526057"
    float: "#526057"
    string: "#526057"
    nothing: "#526057"
    binary: "#526057"
    cellpath: "#526057"
    row_index: { fg: "#489963" attr: "b" }
    record: "#526057"
    list: "#526057"
    block: "#526057"
    hints: "dark_gray"

    shape_and: { fg: "#55859b" attr: "b" }
    shape_binary: { fg: "#55859b" attr: "b" }
    shape_block: { fg: "#478c90" attr: "b" }
    shape_bool: "#1c9aa0"
    shape_custom: "#489963"
    shape_datetime: { fg: "#1c9aa0" attr: "b" }
    shape_directory: "#1c9aa0"
    shape_external: "#1c9aa0"
    shape_externalarg: { fg: "#489963" attr: "b" }
    shape_filepath: "#1c9aa0"
    shape_flag: { fg: "#478c90" attr: "b" }
    shape_float: { fg: "#55859b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1c9aa0" attr: "b" }
    shape_int: { fg: "#55859b" attr: "b" }
    shape_internalcall: { fg: "#1c9aa0" attr: "b" }
    shape_list: { fg: "#1c9aa0" attr: "b" }
    shape_literal: "#478c90"
    shape_match_pattern: "#489963"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1c9aa0"
    shape_operator: "#a07e3b"
    shape_or: { fg: "#55859b" attr: "b" }
    shape_pipe: { fg: "#55859b" attr: "b" }
    shape_range: { fg: "#a07e3b" attr: "b" }
    shape_record: { fg: "#1c9aa0" attr: "b" }
    shape_redirection: { fg: "#55859b" attr: "b" }
    shape_signature: { fg: "#489963" attr: "b" }
    shape_string: "#489963"
    shape_string_interpolation: { fg: "#1c9aa0" attr: "b" }
    shape_table: { fg: "#478c90" attr: "b" }
    shape_variable: "#55859b"

    background: "#ecf4ee"
    foreground: "#526057"
    cursor: "#526057"
}}