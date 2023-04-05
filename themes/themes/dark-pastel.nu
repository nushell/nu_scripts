export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#55ff55" attr: "b" }
    empty: "#5555ff"
    bool: {|| if $in { "#55ffff" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#55ffff"
      } else {{ fg: "#5555ff" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff5555" attr: "b" }
      } else if $in < 6hr {
        "#ff5555"
      } else if $in < 1day {
        "#ffff55"
      } else if $in < 3day {
        "#55ff55"
      } else if $in < 1wk {
        { fg: "#55ff55" attr: "b" }
      } else if $in < 6wk {
        "#55ffff"
      } else if $in < 52wk {
        "#5555ff"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#55ff55" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#ff55ff" attr: "b" }
    shape_binary: { fg: "#ff55ff" attr: "b" }
    shape_block: { fg: "#5555ff" attr: "b" }
    shape_bool: "#55ffff"
    shape_custom: "#55ff55"
    shape_datetime: { fg: "#55ffff" attr: "b" }
    shape_directory: "#55ffff"
    shape_external: "#55ffff"
    shape_externalarg: { fg: "#55ff55" attr: "b" }
    shape_filepath: "#55ffff"
    shape_flag: { fg: "#5555ff" attr: "b" }
    shape_float: { fg: "#ff55ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#55ffff" attr: "b" }
    shape_int: { fg: "#ff55ff" attr: "b" }
    shape_internalcall: { fg: "#55ffff" attr: "b" }
    shape_list: { fg: "#55ffff" attr: "b" }
    shape_literal: "#5555ff"
    shape_match_pattern: "#55ff55"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#55ffff"
    shape_operator: "#ffff55"
    shape_or: { fg: "#ff55ff" attr: "b" }
    shape_pipe: { fg: "#ff55ff" attr: "b" }
    shape_range: { fg: "#ffff55" attr: "b" }
    shape_record: { fg: "#55ffff" attr: "b" }
    shape_redirection: { fg: "#ff55ff" attr: "b" }
    shape_signature: { fg: "#55ff55" attr: "b" }
    shape_string: "#55ff55"
    shape_string_interpolation: { fg: "#55ffff" attr: "b" }
    shape_table: { fg: "#5555ff" attr: "b" }
    shape_variable: "#ff55ff"

    background: "#000000"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}