export def main [] { return {
    separator: "#cccccc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#55cc55" attr: "b" }
    empty: "#5555cc"
    bool: {|| if $in { "#55ffff" } else { "light_gray" } }
    int: "#cccccc"
    filesize: {|e|
      if $e == 0b {
        "#cccccc"
      } else if $e < 1mb {
        "#7acaca"
      } else {{ fg: "#5555cc" }}
    }
    duration: "#cccccc"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cc5555" attr: "b" }
      } else if $in < 6hr {
        "#cc5555"
      } else if $in < 1day {
        "#cdcd55"
      } else if $in < 3day {
        "#55cc55"
      } else if $in < 1wk {
        { fg: "#55cc55" attr: "b" }
      } else if $in < 6wk {
        "#7acaca"
      } else if $in < 52wk {
        "#5555cc"
      } else { "dark_gray" }
    }
    range: "#cccccc"
    float: "#cccccc"
    string: "#cccccc"
    nothing: "#cccccc"
    binary: "#cccccc"
    cellpath: "#cccccc"
    row_index: { fg: "#55cc55" attr: "b" }
    record: "#cccccc"
    list: "#cccccc"
    block: "#cccccc"
    hints: "dark_gray"

    shape_and: { fg: "#cc55cc" attr: "b" }
    shape_binary: { fg: "#cc55cc" attr: "b" }
    shape_block: { fg: "#5555cc" attr: "b" }
    shape_bool: "#55ffff"
    shape_custom: "#55cc55"
    shape_datetime: { fg: "#7acaca" attr: "b" }
    shape_directory: "#7acaca"
    shape_external: "#7acaca"
    shape_externalarg: { fg: "#55cc55" attr: "b" }
    shape_filepath: "#7acaca"
    shape_flag: { fg: "#5555cc" attr: "b" }
    shape_float: { fg: "#cc55cc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7acaca" attr: "b" }
    shape_int: { fg: "#cc55cc" attr: "b" }
    shape_internalcall: { fg: "#7acaca" attr: "b" }
    shape_list: { fg: "#7acaca" attr: "b" }
    shape_literal: "#5555cc"
    shape_match_pattern: "#55cc55"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#55ffff"
    shape_operator: "#cdcd55"
    shape_or: { fg: "#cc55cc" attr: "b" }
    shape_pipe: { fg: "#cc55cc" attr: "b" }
    shape_range: { fg: "#cdcd55" attr: "b" }
    shape_record: { fg: "#7acaca" attr: "b" }
    shape_redirection: { fg: "#cc55cc" attr: "b" }
    shape_signature: { fg: "#55cc55" attr: "b" }
    shape_string: "#55cc55"
    shape_string_interpolation: { fg: "#7acaca" attr: "b" }
    shape_table: { fg: "#5555cc" attr: "b" }
    shape_variable: "#cc55cc"

    background: "#000000"
    foreground: "#b3b3b3"
    cursor: "#b3b3b3"
}}