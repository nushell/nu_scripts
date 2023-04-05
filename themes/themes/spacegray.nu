export def main [] { return {
    separator: "#b3b8c3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#87b379" attr: "b" }
    empty: "#7d8fa4"
    bool: {|| if $in { "#85a7a5" } else { "light_gray" } }
    int: "#b3b8c3"
    filesize: {|e|
      if $e == 0b {
        "#b3b8c3"
      } else if $e < 1mb {
        "#85a7a5"
      } else {{ fg: "#7d8fa4" }}
    }
    duration: "#b3b8c3"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b04b57" attr: "b" }
      } else if $in < 6hr {
        "#b04b57"
      } else if $in < 1day {
        "#e5c179"
      } else if $in < 3day {
        "#87b379"
      } else if $in < 1wk {
        { fg: "#87b379" attr: "b" }
      } else if $in < 6wk {
        "#85a7a5"
      } else if $in < 52wk {
        "#7d8fa4"
      } else { "dark_gray" }
    }
    range: "#b3b8c3"
    float: "#b3b8c3"
    string: "#b3b8c3"
    nothing: "#b3b8c3"
    binary: "#b3b8c3"
    cellpath: "#b3b8c3"
    row_index: { fg: "#87b379" attr: "b" }
    record: "#b3b8c3"
    list: "#b3b8c3"
    block: "#b3b8c3"
    hints: "dark_gray"

    shape_and: { fg: "#a47996" attr: "b" }
    shape_binary: { fg: "#a47996" attr: "b" }
    shape_block: { fg: "#7d8fa4" attr: "b" }
    shape_bool: "#85a7a5"
    shape_custom: "#87b379"
    shape_datetime: { fg: "#85a7a5" attr: "b" }
    shape_directory: "#85a7a5"
    shape_external: "#85a7a5"
    shape_externalarg: { fg: "#87b379" attr: "b" }
    shape_filepath: "#85a7a5"
    shape_flag: { fg: "#7d8fa4" attr: "b" }
    shape_float: { fg: "#a47996" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#85a7a5" attr: "b" }
    shape_int: { fg: "#a47996" attr: "b" }
    shape_internalcall: { fg: "#85a7a5" attr: "b" }
    shape_list: { fg: "#85a7a5" attr: "b" }
    shape_literal: "#7d8fa4"
    shape_match_pattern: "#87b379"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#85a7a5"
    shape_operator: "#e5c179"
    shape_or: { fg: "#a47996" attr: "b" }
    shape_pipe: { fg: "#a47996" attr: "b" }
    shape_range: { fg: "#e5c179" attr: "b" }
    shape_record: { fg: "#85a7a5" attr: "b" }
    shape_redirection: { fg: "#a47996" attr: "b" }
    shape_signature: { fg: "#87b379" attr: "b" }
    shape_string: "#87b379"
    shape_string_interpolation: { fg: "#85a7a5" attr: "b" }
    shape_table: { fg: "#7d8fa4" attr: "b" }
    shape_variable: "#a47996"

    background: "#20242d"
    foreground: "#b3b8c3"
    cursor: "#b3b8c3"
}}