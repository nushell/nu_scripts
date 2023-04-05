export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00bb00" attr: "b" }
    empty: "#0000a3"
    bool: {|| if $in { "#55ffff" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#00bbbb"
      } else {{ fg: "#0000a3" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#bb0000" attr: "b" }
      } else if $in < 6hr {
        "#bb0000"
      } else if $in < 1day {
        "#e7b000"
      } else if $in < 3day {
        "#00bb00"
      } else if $in < 1wk {
        { fg: "#00bb00" attr: "b" }
      } else if $in < 6wk {
        "#00bbbb"
      } else if $in < 52wk {
        "#0000a3"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#00bb00" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#950062" attr: "b" }
    shape_binary: { fg: "#950062" attr: "b" }
    shape_block: { fg: "#0000a3" attr: "b" }
    shape_bool: "#55ffff"
    shape_custom: "#00bb00"
    shape_datetime: { fg: "#00bbbb" attr: "b" }
    shape_directory: "#00bbbb"
    shape_external: "#00bbbb"
    shape_externalarg: { fg: "#00bb00" attr: "b" }
    shape_filepath: "#00bbbb"
    shape_flag: { fg: "#0000a3" attr: "b" }
    shape_float: { fg: "#950062" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00bbbb" attr: "b" }
    shape_int: { fg: "#950062" attr: "b" }
    shape_internalcall: { fg: "#00bbbb" attr: "b" }
    shape_list: { fg: "#00bbbb" attr: "b" }
    shape_literal: "#0000a3"
    shape_match_pattern: "#00bb00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#55ffff"
    shape_operator: "#e7b000"
    shape_or: { fg: "#950062" attr: "b" }
    shape_pipe: { fg: "#950062" attr: "b" }
    shape_range: { fg: "#e7b000" attr: "b" }
    shape_record: { fg: "#00bbbb" attr: "b" }
    shape_redirection: { fg: "#950062" attr: "b" }
    shape_signature: { fg: "#00bb00" attr: "b" }
    shape_string: "#00bb00"
    shape_string_interpolation: { fg: "#00bbbb" attr: "b" }
    shape_table: { fg: "#0000a3" attr: "b" }
    shape_variable: "#950062"

    background: "#13773d"
    foreground: "#fff0a5"
    cursor: "#fff0a5"
}}