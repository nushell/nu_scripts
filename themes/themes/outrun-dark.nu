export def main [] { return {
    separator: "#d0d0fa"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#59f176" attr: "b" }
    empty: "#66b0ff"
    bool: {|| if $in { "#0ef0f0" } else { "light_gray" } }
    int: "#d0d0fa"
    filesize: {|e|
      if $e == 0b {
        "#d0d0fa"
      } else if $e < 1mb {
        "#0ef0f0"
      } else {{ fg: "#66b0ff" }}
    }
    duration: "#d0d0fa"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff4242" attr: "b" }
      } else if $in < 6hr {
        "#ff4242"
      } else if $in < 1day {
        "#f3e877"
      } else if $in < 3day {
        "#59f176"
      } else if $in < 1wk {
        { fg: "#59f176" attr: "b" }
      } else if $in < 6wk {
        "#0ef0f0"
      } else if $in < 52wk {
        "#66b0ff"
      } else { "dark_gray" }
    }
    range: "#d0d0fa"
    float: "#d0d0fa"
    string: "#d0d0fa"
    nothing: "#d0d0fa"
    binary: "#d0d0fa"
    cellpath: "#d0d0fa"
    row_index: { fg: "#59f176" attr: "b" }
    record: "#d0d0fa"
    list: "#d0d0fa"
    block: "#d0d0fa"
    hints: "dark_gray"

    shape_and: { fg: "#f10596" attr: "b" }
    shape_binary: { fg: "#f10596" attr: "b" }
    shape_block: { fg: "#66b0ff" attr: "b" }
    shape_bool: "#0ef0f0"
    shape_custom: "#59f176"
    shape_datetime: { fg: "#0ef0f0" attr: "b" }
    shape_directory: "#0ef0f0"
    shape_external: "#0ef0f0"
    shape_externalarg: { fg: "#59f176" attr: "b" }
    shape_filepath: "#0ef0f0"
    shape_flag: { fg: "#66b0ff" attr: "b" }
    shape_float: { fg: "#f10596" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0ef0f0" attr: "b" }
    shape_int: { fg: "#f10596" attr: "b" }
    shape_internalcall: { fg: "#0ef0f0" attr: "b" }
    shape_list: { fg: "#0ef0f0" attr: "b" }
    shape_literal: "#66b0ff"
    shape_match_pattern: "#59f176"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#0ef0f0"
    shape_operator: "#f3e877"
    shape_or: { fg: "#f10596" attr: "b" }
    shape_pipe: { fg: "#f10596" attr: "b" }
    shape_range: { fg: "#f3e877" attr: "b" }
    shape_record: { fg: "#0ef0f0" attr: "b" }
    shape_redirection: { fg: "#f10596" attr: "b" }
    shape_signature: { fg: "#59f176" attr: "b" }
    shape_string: "#59f176"
    shape_string_interpolation: { fg: "#0ef0f0" attr: "b" }
    shape_table: { fg: "#66b0ff" attr: "b" }
    shape_variable: "#f10596"

    background: "#00002a"
    foreground: "#d0d0fa"
    cursor: "#d0d0fa"
}}