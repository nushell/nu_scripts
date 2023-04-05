export def main [] { return {
    separator: "#b7b8b9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#31a354" attr: "b" }
    empty: "#3182bd"
    bool: {|| if $in { "#80b1d3" } else { "light_gray" } }
    int: "#b7b8b9"
    filesize: {|e|
      if $e == 0b {
        "#b7b8b9"
      } else if $e < 1mb {
        "#80b1d3"
      } else {{ fg: "#3182bd" }}
    }
    duration: "#b7b8b9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e31a1c" attr: "b" }
      } else if $in < 6hr {
        "#e31a1c"
      } else if $in < 1day {
        "#dca060"
      } else if $in < 3day {
        "#31a354"
      } else if $in < 1wk {
        { fg: "#31a354" attr: "b" }
      } else if $in < 6wk {
        "#80b1d3"
      } else if $in < 52wk {
        "#3182bd"
      } else { "dark_gray" }
    }
    range: "#b7b8b9"
    float: "#b7b8b9"
    string: "#b7b8b9"
    nothing: "#b7b8b9"
    binary: "#b7b8b9"
    cellpath: "#b7b8b9"
    row_index: { fg: "#31a354" attr: "b" }
    record: "#b7b8b9"
    list: "#b7b8b9"
    block: "#b7b8b9"
    hints: "dark_gray"

    shape_and: { fg: "#756bb1" attr: "b" }
    shape_binary: { fg: "#756bb1" attr: "b" }
    shape_block: { fg: "#3182bd" attr: "b" }
    shape_bool: "#80b1d3"
    shape_custom: "#31a354"
    shape_datetime: { fg: "#80b1d3" attr: "b" }
    shape_directory: "#80b1d3"
    shape_external: "#80b1d3"
    shape_externalarg: { fg: "#31a354" attr: "b" }
    shape_filepath: "#80b1d3"
    shape_flag: { fg: "#3182bd" attr: "b" }
    shape_float: { fg: "#756bb1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#80b1d3" attr: "b" }
    shape_int: { fg: "#756bb1" attr: "b" }
    shape_internalcall: { fg: "#80b1d3" attr: "b" }
    shape_list: { fg: "#80b1d3" attr: "b" }
    shape_literal: "#3182bd"
    shape_match_pattern: "#31a354"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#80b1d3"
    shape_operator: "#dca060"
    shape_or: { fg: "#756bb1" attr: "b" }
    shape_pipe: { fg: "#756bb1" attr: "b" }
    shape_range: { fg: "#dca060" attr: "b" }
    shape_record: { fg: "#80b1d3" attr: "b" }
    shape_redirection: { fg: "#756bb1" attr: "b" }
    shape_signature: { fg: "#31a354" attr: "b" }
    shape_string: "#31a354"
    shape_string_interpolation: { fg: "#80b1d3" attr: "b" }
    shape_table: { fg: "#3182bd" attr: "b" }
    shape_variable: "#756bb1"

    background: "#0c0d0e"
    foreground: "#b7b8b9"
    cursor: "#b7b8b9"
}}