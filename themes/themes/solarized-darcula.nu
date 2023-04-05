export def main [] { return {
    separator: "#d2d8d9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#629655" attr: "b" }
    empty: "#2075c7"
    bool: {|| if $in { "#15968d" } else { "light_gray" } }
    int: "#d2d8d9"
    filesize: {|e|
      if $e == 0b {
        "#d2d8d9"
      } else if $e < 1mb {
        "#15968d"
      } else {{ fg: "#2075c7" }}
    }
    duration: "#d2d8d9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f24840" attr: "b" }
      } else if $in < 6hr {
        "#f24840"
      } else if $in < 1day {
        "#b68800"
      } else if $in < 3day {
        "#629655"
      } else if $in < 1wk {
        { fg: "#629655" attr: "b" }
      } else if $in < 6wk {
        "#15968d"
      } else if $in < 52wk {
        "#2075c7"
      } else { "dark_gray" }
    }
    range: "#d2d8d9"
    float: "#d2d8d9"
    string: "#d2d8d9"
    nothing: "#d2d8d9"
    binary: "#d2d8d9"
    cellpath: "#d2d8d9"
    row_index: { fg: "#629655" attr: "b" }
    record: "#d2d8d9"
    list: "#d2d8d9"
    block: "#d2d8d9"
    hints: "dark_gray"

    shape_and: { fg: "#797fd4" attr: "b" }
    shape_binary: { fg: "#797fd4" attr: "b" }
    shape_block: { fg: "#2075c7" attr: "b" }
    shape_bool: "#15968d"
    shape_custom: "#629655"
    shape_datetime: { fg: "#15968d" attr: "b" }
    shape_directory: "#15968d"
    shape_external: "#15968d"
    shape_externalarg: { fg: "#629655" attr: "b" }
    shape_filepath: "#15968d"
    shape_flag: { fg: "#2075c7" attr: "b" }
    shape_float: { fg: "#797fd4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#15968d" attr: "b" }
    shape_int: { fg: "#797fd4" attr: "b" }
    shape_internalcall: { fg: "#15968d" attr: "b" }
    shape_list: { fg: "#15968d" attr: "b" }
    shape_literal: "#2075c7"
    shape_match_pattern: "#629655"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#15968d"
    shape_operator: "#b68800"
    shape_or: { fg: "#797fd4" attr: "b" }
    shape_pipe: { fg: "#797fd4" attr: "b" }
    shape_range: { fg: "#b68800" attr: "b" }
    shape_record: { fg: "#15968d" attr: "b" }
    shape_redirection: { fg: "#797fd4" attr: "b" }
    shape_signature: { fg: "#629655" attr: "b" }
    shape_string: "#629655"
    shape_string_interpolation: { fg: "#15968d" attr: "b" }
    shape_table: { fg: "#2075c7" attr: "b" }
    shape_variable: "#797fd4"

    background: "#3d3f41"
    foreground: "#d2d8d9"
    cursor: "#d2d8d9"
}}