export def main [] { return {
    separator: "#ff3600"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#ff3600" attr: "b" }
    empty: "#ff3600"
    bool: {|| if $in { "#ff3600" } else { "light_gray" } }
    int: "#ff3600"
    filesize: {|e|
      if $e == 0b {
        "#ff3600"
      } else if $e < 1mb {
        "#ff3600"
      } else {{ fg: "#ff3600" }}
    }
    duration: "#ff3600"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff3600" attr: "b" }
      } else if $in < 6hr {
        "#ff3600"
      } else if $in < 1day {
        "#ff3600"
      } else if $in < 3day {
        "#ff3600"
      } else if $in < 1wk {
        { fg: "#ff3600" attr: "b" }
      } else if $in < 6wk {
        "#ff3600"
      } else if $in < 52wk {
        "#ff3600"
      } else { "dark_gray" }
    }
    range: "#ff3600"
    float: "#ff3600"
    string: "#ff3600"
    nothing: "#ff3600"
    binary: "#ff3600"
    cellpath: "#ff3600"
    row_index: { fg: "#ff3600" attr: "b" }
    record: "#ff3600"
    list: "#ff3600"
    block: "#ff3600"
    hints: "dark_gray"

    shape_and: { fg: "#ff3600" attr: "b" }
    shape_binary: { fg: "#ff3600" attr: "b" }
    shape_block: { fg: "#ff3600" attr: "b" }
    shape_bool: "#ff3600"
    shape_custom: "#ff3600"
    shape_datetime: { fg: "#ff3600" attr: "b" }
    shape_directory: "#ff3600"
    shape_external: "#ff3600"
    shape_externalarg: { fg: "#ff3600" attr: "b" }
    shape_filepath: "#ff3600"
    shape_flag: { fg: "#ff3600" attr: "b" }
    shape_float: { fg: "#ff3600" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ff3600" attr: "b" }
    shape_int: { fg: "#ff3600" attr: "b" }
    shape_internalcall: { fg: "#ff3600" attr: "b" }
    shape_list: { fg: "#ff3600" attr: "b" }
    shape_literal: "#ff3600"
    shape_match_pattern: "#ff3600"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ff3600"
    shape_operator: "#ff3600"
    shape_or: { fg: "#ff3600" attr: "b" }
    shape_pipe: { fg: "#ff3600" attr: "b" }
    shape_range: { fg: "#ff3600" attr: "b" }
    shape_record: { fg: "#ff3600" attr: "b" }
    shape_redirection: { fg: "#ff3600" attr: "b" }
    shape_signature: { fg: "#ff3600" attr: "b" }
    shape_string: "#ff3600"
    shape_string_interpolation: { fg: "#ff3600" attr: "b" }
    shape_table: { fg: "#ff3600" attr: "b" }
    shape_variable: "#ff3600"

    background: "#2b0c00"
    foreground: "#ff3600"
    cursor: "#ff3600"
}}