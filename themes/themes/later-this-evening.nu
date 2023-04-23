export def main [] { return {
    separator: "#3c3d3d"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#afba67" attr: "b" }
    empty: "#a0bad6"
    bool: {|| if $in { "#5fc0ae" } else { "light_gray" } }
    int: "#3c3d3d"
    filesize: {|e|
      if $e == 0b {
        "#3c3d3d"
      } else if $e < 1mb {
        "#91bfb7"
      } else {{ fg: "#a0bad6" }}
    }
    duration: "#3c3d3d"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d45a60" attr: "b" }
      } else if $in < 6hr {
        "#d45a60"
      } else if $in < 1day {
        "#e5d289"
      } else if $in < 3day {
        "#afba67"
      } else if $in < 1wk {
        { fg: "#afba67" attr: "b" }
      } else if $in < 6wk {
        "#91bfb7"
      } else if $in < 52wk {
        "#a0bad6"
      } else { "dark_gray" }
    }
    range: "#3c3d3d"
    float: "#3c3d3d"
    string: "#3c3d3d"
    nothing: "#3c3d3d"
    binary: "#3c3d3d"
    cellpath: "#3c3d3d"
    row_index: { fg: "#afba67" attr: "b" }
    record: "#3c3d3d"
    list: "#3c3d3d"
    block: "#3c3d3d"
    hints: "dark_gray"

    shape_and: { fg: "#c092d6" attr: "b" }
    shape_binary: { fg: "#c092d6" attr: "b" }
    shape_block: { fg: "#a0bad6" attr: "b" }
    shape_bool: "#5fc0ae"
    shape_custom: "#afba67"
    shape_datetime: { fg: "#91bfb7" attr: "b" }
    shape_directory: "#91bfb7"
    shape_external: "#91bfb7"
    shape_externalarg: { fg: "#afba67" attr: "b" }
    shape_filepath: "#91bfb7"
    shape_flag: { fg: "#a0bad6" attr: "b" }
    shape_float: { fg: "#c092d6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#91bfb7" attr: "b" }
    shape_int: { fg: "#c092d6" attr: "b" }
    shape_internalcall: { fg: "#91bfb7" attr: "b" }
    shape_list: { fg: "#91bfb7" attr: "b" }
    shape_literal: "#a0bad6"
    shape_match_pattern: "#afba67"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5fc0ae"
    shape_operator: "#e5d289"
    shape_or: { fg: "#c092d6" attr: "b" }
    shape_pipe: { fg: "#c092d6" attr: "b" }
    shape_range: { fg: "#e5d289" attr: "b" }
    shape_record: { fg: "#91bfb7" attr: "b" }
    shape_redirection: { fg: "#c092d6" attr: "b" }
    shape_signature: { fg: "#afba67" attr: "b" }
    shape_string: "#afba67"
    shape_string_interpolation: { fg: "#91bfb7" attr: "b" }
    shape_table: { fg: "#a0bad6" attr: "b" }
    shape_variable: "#c092d6"

    background: "#222222"
    foreground: "#959595"
    cursor: "#959595"
}}