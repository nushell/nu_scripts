export def main [] { return {
    separator: "#a3a3a3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#67b11d" attr: "b" }
    empty: "#4f97d7"
    bool: {|| if $in { "#2d9574" } else { "light_gray" } }
    int: "#a3a3a3"
    filesize: {|e|
      if $e == 0b {
        "#a3a3a3"
      } else if $e < 1mb {
        "#2d9574"
      } else {{ fg: "#4f97d7" }}
    }
    duration: "#a3a3a3"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f2241f" attr: "b" }
      } else if $in < 6hr {
        "#f2241f"
      } else if $in < 1day {
        "#b1951d"
      } else if $in < 3day {
        "#67b11d"
      } else if $in < 1wk {
        { fg: "#67b11d" attr: "b" }
      } else if $in < 6wk {
        "#2d9574"
      } else if $in < 52wk {
        "#4f97d7"
      } else { "dark_gray" }
    }
    range: "#a3a3a3"
    float: "#a3a3a3"
    string: "#a3a3a3"
    nothing: "#a3a3a3"
    binary: "#a3a3a3"
    cellpath: "#a3a3a3"
    row_index: { fg: "#67b11d" attr: "b" }
    record: "#a3a3a3"
    list: "#a3a3a3"
    block: "#a3a3a3"
    hints: "dark_gray"

    shape_and: { fg: "#a31db1" attr: "b" }
    shape_binary: { fg: "#a31db1" attr: "b" }
    shape_block: { fg: "#4f97d7" attr: "b" }
    shape_bool: "#2d9574"
    shape_custom: "#67b11d"
    shape_datetime: { fg: "#2d9574" attr: "b" }
    shape_directory: "#2d9574"
    shape_external: "#2d9574"
    shape_externalarg: { fg: "#67b11d" attr: "b" }
    shape_filepath: "#2d9574"
    shape_flag: { fg: "#4f97d7" attr: "b" }
    shape_float: { fg: "#a31db1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2d9574" attr: "b" }
    shape_int: { fg: "#a31db1" attr: "b" }
    shape_internalcall: { fg: "#2d9574" attr: "b" }
    shape_list: { fg: "#2d9574" attr: "b" }
    shape_literal: "#4f97d7"
    shape_match_pattern: "#67b11d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2d9574"
    shape_operator: "#b1951d"
    shape_or: { fg: "#a31db1" attr: "b" }
    shape_pipe: { fg: "#a31db1" attr: "b" }
    shape_range: { fg: "#b1951d" attr: "b" }
    shape_record: { fg: "#2d9574" attr: "b" }
    shape_redirection: { fg: "#a31db1" attr: "b" }
    shape_signature: { fg: "#67b11d" attr: "b" }
    shape_string: "#67b11d"
    shape_string_interpolation: { fg: "#2d9574" attr: "b" }
    shape_table: { fg: "#4f97d7" attr: "b" }
    shape_variable: "#a31db1"

    background: "#1f2022"
    foreground: "#a3a3a3"
    cursor: "#a3a3a3"
}}