export def main [] { return {
    separator: "#ffd300"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ffd300" attr: "b" }
    empty: "#ffd300"
    bool: {|| if $in { "#ffd300" } else { "light_gray" } }
    int: "#ffd300"
    filesize: {|e|
      if $e == 0b {
        "#ffd300"
      } else if $e < 1mb {
        "#ffd300"
      } else {{ fg: "#ffd300" }}
    }
    duration: "#ffd300"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ffd300" attr: "b" }
      } else if $in < 6hr {
        "#ffd300"
      } else if $in < 1day {
        "#ffd300"
      } else if $in < 3day {
        "#ffd300"
      } else if $in < 1wk {
        { fg: "#ffd300" attr: "b" }
      } else if $in < 6wk {
        "#ffd300"
      } else if $in < 52wk {
        "#ffd300"
      } else { "dark_gray" }
    }
    range: "#ffd300"
    float: "#ffd300"
    string: "#ffd300"
    nothing: "#ffd300"
    binary: "#ffd300"
    cellpath: "#ffd300"
    row_index: { fg: "#ffd300" attr: "b" }
    record: "#ffd300"
    list: "#ffd300"
    block: "#ffd300"
    hints: "dark_gray"

    shape_and: { fg: "#ffd300" attr: "b" }
    shape_binary: { fg: "#ffd300" attr: "b" }
    shape_block: { fg: "#ffd300" attr: "b" }
    shape_bool: "#ffd300"
    shape_custom: "#ffd300"
    shape_datetime: { fg: "#ffd300" attr: "b" }
    shape_directory: "#ffd300"
    shape_external: "#ffd300"
    shape_externalarg: { fg: "#ffd300" attr: "b" }
    shape_filepath: "#ffd300"
    shape_flag: { fg: "#ffd300" attr: "b" }
    shape_float: { fg: "#ffd300" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ffd300" attr: "b" }
    shape_int: { fg: "#ffd300" attr: "b" }
    shape_internalcall: { fg: "#ffd300" attr: "b" }
    shape_list: { fg: "#ffd300" attr: "b" }
    shape_literal: "#ffd300"
    shape_match_pattern: "#ffd300"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ffd300"
    shape_operator: "#ffd300"
    shape_or: { fg: "#ffd300" attr: "b" }
    shape_pipe: { fg: "#ffd300" attr: "b" }
    shape_range: { fg: "#ffd300" attr: "b" }
    shape_record: { fg: "#ffd300" attr: "b" }
    shape_redirection: { fg: "#ffd300" attr: "b" }
    shape_signature: { fg: "#ffd300" attr: "b" }
    shape_string: "#ffd300"
    shape_string_interpolation: { fg: "#ffd300" attr: "b" }
    shape_table: { fg: "#ffd300" attr: "b" }
    shape_variable: "#ffd300"

    background: "#2b2400"
    foreground: "#ffd300"
    cursor: "#ffd300"
}}