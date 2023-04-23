export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#3e953a" attr: "b" }
    empty: "#2f5af3"
    bool: {|| if $in { "#3e953a" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#3e953a"
      } else {{ fg: "#2f5af3" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#de3d35" attr: "b" }
      } else if $in < 6hr {
        "#de3d35"
      } else if $in < 1day {
        "#d2b67b"
      } else if $in < 3day {
        "#3e953a"
      } else if $in < 1wk {
        { fg: "#3e953a" attr: "b" }
      } else if $in < 6wk {
        "#3e953a"
      } else if $in < 52wk {
        "#2f5af3"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#3e953a" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#950095" attr: "b" }
    shape_binary: { fg: "#950095" attr: "b" }
    shape_block: { fg: "#2f5af3" attr: "b" }
    shape_bool: "#3e953a"
    shape_custom: "#3e953a"
    shape_datetime: { fg: "#3e953a" attr: "b" }
    shape_directory: "#3e953a"
    shape_external: "#3e953a"
    shape_externalarg: { fg: "#3e953a" attr: "b" }
    shape_filepath: "#3e953a"
    shape_flag: { fg: "#2f5af3" attr: "b" }
    shape_float: { fg: "#950095" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3e953a" attr: "b" }
    shape_int: { fg: "#950095" attr: "b" }
    shape_internalcall: { fg: "#3e953a" attr: "b" }
    shape_list: { fg: "#3e953a" attr: "b" }
    shape_literal: "#2f5af3"
    shape_match_pattern: "#3e953a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3e953a"
    shape_operator: "#d2b67b"
    shape_or: { fg: "#950095" attr: "b" }
    shape_pipe: { fg: "#950095" attr: "b" }
    shape_range: { fg: "#d2b67b" attr: "b" }
    shape_record: { fg: "#3e953a" attr: "b" }
    shape_redirection: { fg: "#950095" attr: "b" }
    shape_signature: { fg: "#3e953a" attr: "b" }
    shape_string: "#3e953a"
    shape_string_interpolation: { fg: "#3e953a" attr: "b" }
    shape_table: { fg: "#2f5af3" attr: "b" }
    shape_variable: "#950095"

    background: "#f8f8f8"
    foreground: "#2a2b33"
    cursor: "#bbbbbb"
}}