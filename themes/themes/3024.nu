export def main [] { return {
    separator: "#a5a2a2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#01a252" attr: "b" }
    empty: "#01a0e4"
    bool: {|| if $in { "#b5e4f4" } else { "light_gray" } }
    int: "#a5a2a2"
    filesize: {|e|
      if $e == 0b {
        "#a5a2a2"
      } else if $e < 1mb {
        "#b5e4f4"
      } else {{ fg: "#01a0e4" }}
    }
    duration: "#a5a2a2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#db2d20" attr: "b" }
      } else if $in < 6hr {
        "#db2d20"
      } else if $in < 1day {
        "#fded02"
      } else if $in < 3day {
        "#01a252"
      } else if $in < 1wk {
        { fg: "#01a252" attr: "b" }
      } else if $in < 6wk {
        "#b5e4f4"
      } else if $in < 52wk {
        "#01a0e4"
      } else { "dark_gray" }
    }
    range: "#a5a2a2"
    float: "#a5a2a2"
    string: "#a5a2a2"
    nothing: "#a5a2a2"
    binary: "#a5a2a2"
    cellpath: "#a5a2a2"
    row_index: { fg: "#01a252" attr: "b" }
    record: "#a5a2a2"
    list: "#a5a2a2"
    block: "#a5a2a2"
    hints: "dark_gray"

    shape_and: { fg: "#a16a94" attr: "b" }
    shape_binary: { fg: "#a16a94" attr: "b" }
    shape_block: { fg: "#01a0e4" attr: "b" }
    shape_bool: "#b5e4f4"
    shape_custom: "#01a252"
    shape_datetime: { fg: "#b5e4f4" attr: "b" }
    shape_directory: "#b5e4f4"
    shape_external: "#b5e4f4"
    shape_externalarg: { fg: "#01a252" attr: "b" }
    shape_filepath: "#b5e4f4"
    shape_flag: { fg: "#01a0e4" attr: "b" }
    shape_float: { fg: "#a16a94" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#b5e4f4" attr: "b" }
    shape_int: { fg: "#a16a94" attr: "b" }
    shape_internalcall: { fg: "#b5e4f4" attr: "b" }
    shape_list: { fg: "#b5e4f4" attr: "b" }
    shape_literal: "#01a0e4"
    shape_match_pattern: "#01a252"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b5e4f4"
    shape_operator: "#fded02"
    shape_or: { fg: "#a16a94" attr: "b" }
    shape_pipe: { fg: "#a16a94" attr: "b" }
    shape_range: { fg: "#fded02" attr: "b" }
    shape_record: { fg: "#b5e4f4" attr: "b" }
    shape_redirection: { fg: "#a16a94" attr: "b" }
    shape_signature: { fg: "#01a252" attr: "b" }
    shape_string: "#01a252"
    shape_string_interpolation: { fg: "#b5e4f4" attr: "b" }
    shape_table: { fg: "#01a0e4" attr: "b" }
    shape_variable: "#a16a94"

    background: "#090300"
    foreground: "#a5a2a2"
    cursor: "#a5a2a2"
}}