export def main [] { return {
    separator: "#f2f2f2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a6e32d" attr: "b" }
    empty: "#c48dff"
    bool: {|| if $in { "#55ffff" } else { "light_gray" } }
    int: "#f2f2f2"
    filesize: {|e|
      if $e == 0b {
        "#f2f2f2"
      } else if $e < 1mb {
        "#67d9f0"
      } else {{ fg: "#c48dff" }}
    }
    duration: "#f2f2f2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e52222" attr: "b" }
      } else if $in < 6hr {
        "#e52222"
      } else if $in < 1day {
        "#fc951e"
      } else if $in < 3day {
        "#a6e32d"
      } else if $in < 1wk {
        { fg: "#a6e32d" attr: "b" }
      } else if $in < 6wk {
        "#67d9f0"
      } else if $in < 52wk {
        "#c48dff"
      } else { "dark_gray" }
    }
    range: "#f2f2f2"
    float: "#f2f2f2"
    string: "#f2f2f2"
    nothing: "#f2f2f2"
    binary: "#f2f2f2"
    cellpath: "#f2f2f2"
    row_index: { fg: "#a6e32d" attr: "b" }
    record: "#f2f2f2"
    list: "#f2f2f2"
    block: "#f2f2f2"
    hints: "dark_gray"

    shape_and: { fg: "#fa2573" attr: "b" }
    shape_binary: { fg: "#fa2573" attr: "b" }
    shape_block: { fg: "#c48dff" attr: "b" }
    shape_bool: "#55ffff"
    shape_custom: "#a6e32d"
    shape_datetime: { fg: "#67d9f0" attr: "b" }
    shape_directory: "#67d9f0"
    shape_external: "#67d9f0"
    shape_externalarg: { fg: "#a6e32d" attr: "b" }
    shape_filepath: "#67d9f0"
    shape_flag: { fg: "#c48dff" attr: "b" }
    shape_float: { fg: "#fa2573" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#67d9f0" attr: "b" }
    shape_int: { fg: "#fa2573" attr: "b" }
    shape_internalcall: { fg: "#67d9f0" attr: "b" }
    shape_list: { fg: "#67d9f0" attr: "b" }
    shape_literal: "#c48dff"
    shape_match_pattern: "#a6e32d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#55ffff"
    shape_operator: "#fc951e"
    shape_or: { fg: "#fa2573" attr: "b" }
    shape_pipe: { fg: "#fa2573" attr: "b" }
    shape_range: { fg: "#fc951e" attr: "b" }
    shape_record: { fg: "#67d9f0" attr: "b" }
    shape_redirection: { fg: "#fa2573" attr: "b" }
    shape_signature: { fg: "#a6e32d" attr: "b" }
    shape_string: "#a6e32d"
    shape_string_interpolation: { fg: "#67d9f0" attr: "b" }
    shape_table: { fg: "#c48dff" attr: "b" }
    shape_variable: "#fa2573"

    background: "#000000"
    foreground: "#bbbbbb"
    cursor: "#bbbbbb"
}}