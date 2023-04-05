export def main [] { return {
    separator: "#b0b0b0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8eb33b" attr: "b" }
    empty: "#72b3cc"
    bool: {|| if $in { "#77dfd8" } else { "light_gray" } }
    int: "#b0b0b0"
    filesize: {|e|
      if $e == 0b {
        "#b0b0b0"
      } else if $e < 1mb {
        "#218693"
      } else {{ fg: "#72b3cc" }}
    }
    duration: "#b0b0b0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c75646" attr: "b" }
      } else if $in < 6hr {
        "#c75646"
      } else if $in < 1day {
        "#d0b03c"
      } else if $in < 3day {
        "#8eb33b"
      } else if $in < 1wk {
        { fg: "#8eb33b" attr: "b" }
      } else if $in < 6wk {
        "#218693"
      } else if $in < 52wk {
        "#72b3cc"
      } else { "dark_gray" }
    }
    range: "#b0b0b0"
    float: "#b0b0b0"
    string: "#b0b0b0"
    nothing: "#b0b0b0"
    binary: "#b0b0b0"
    cellpath: "#b0b0b0"
    row_index: { fg: "#8eb33b" attr: "b" }
    record: "#b0b0b0"
    list: "#b0b0b0"
    block: "#b0b0b0"
    hints: "dark_gray"

    shape_and: { fg: "#c8a0d1" attr: "b" }
    shape_binary: { fg: "#c8a0d1" attr: "b" }
    shape_block: { fg: "#72b3cc" attr: "b" }
    shape_bool: "#77dfd8"
    shape_custom: "#8eb33b"
    shape_datetime: { fg: "#218693" attr: "b" }
    shape_directory: "#218693"
    shape_external: "#218693"
    shape_externalarg: { fg: "#8eb33b" attr: "b" }
    shape_filepath: "#218693"
    shape_flag: { fg: "#72b3cc" attr: "b" }
    shape_float: { fg: "#c8a0d1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#218693" attr: "b" }
    shape_int: { fg: "#c8a0d1" attr: "b" }
    shape_internalcall: { fg: "#218693" attr: "b" }
    shape_list: { fg: "#218693" attr: "b" }
    shape_literal: "#72b3cc"
    shape_match_pattern: "#8eb33b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#77dfd8"
    shape_operator: "#d0b03c"
    shape_or: { fg: "#c8a0d1" attr: "b" }
    shape_pipe: { fg: "#c8a0d1" attr: "b" }
    shape_range: { fg: "#d0b03c" attr: "b" }
    shape_record: { fg: "#218693" attr: "b" }
    shape_redirection: { fg: "#c8a0d1" attr: "b" }
    shape_signature: { fg: "#8eb33b" attr: "b" }
    shape_string: "#8eb33b"
    shape_string_interpolation: { fg: "#218693" attr: "b" }
    shape_table: { fg: "#72b3cc" attr: "b" }
    shape_variable: "#c8a0d1"

    background: "#242424"
    foreground: "#f7f7f7"
    cursor: "#f7f7f7"
}}