export def main [] { return {
    separator: "#d5d5d5"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#88b92d" attr: "b" }
    empty: "#1e8bac"
    bool: {|| if $in { "#1ba595" } else { "light_gray" } }
    int: "#d5d5d5"
    filesize: {|e|
      if $e == 0b {
        "#d5d5d5"
      } else if $e < 1mb {
        "#1ba595"
      } else {{ fg: "#1e8bac" }}
    }
    duration: "#d5d5d5"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d72638" attr: "b" }
      } else if $in < 6hr {
        "#d72638"
      } else if $in < 1day {
        "#f19d1a"
      } else if $in < 3day {
        "#88b92d"
      } else if $in < 1wk {
        { fg: "#88b92d" attr: "b" }
      } else if $in < 6wk {
        "#1ba595"
      } else if $in < 52wk {
        "#1e8bac"
      } else { "dark_gray" }
    }
    range: "#d5d5d5"
    float: "#d5d5d5"
    string: "#d5d5d5"
    nothing: "#d5d5d5"
    binary: "#d5d5d5"
    cellpath: "#d5d5d5"
    row_index: { fg: "#88b92d" attr: "b" }
    record: "#d5d5d5"
    list: "#d5d5d5"
    block: "#d5d5d5"
    hints: "dark_gray"

    shape_and: { fg: "#be4264" attr: "b" }
    shape_binary: { fg: "#be4264" attr: "b" }
    shape_block: { fg: "#1e8bac" attr: "b" }
    shape_bool: "#1ba595"
    shape_custom: "#88b92d"
    shape_datetime: { fg: "#1ba595" attr: "b" }
    shape_directory: "#1ba595"
    shape_external: "#1ba595"
    shape_externalarg: { fg: "#88b92d" attr: "b" }
    shape_filepath: "#1ba595"
    shape_flag: { fg: "#1e8bac" attr: "b" }
    shape_float: { fg: "#be4264" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1ba595" attr: "b" }
    shape_int: { fg: "#be4264" attr: "b" }
    shape_internalcall: { fg: "#1ba595" attr: "b" }
    shape_list: { fg: "#1ba595" attr: "b" }
    shape_literal: "#1e8bac"
    shape_match_pattern: "#88b92d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1ba595"
    shape_operator: "#f19d1a"
    shape_or: { fg: "#be4264" attr: "b" }
    shape_pipe: { fg: "#be4264" attr: "b" }
    shape_range: { fg: "#f19d1a" attr: "b" }
    shape_record: { fg: "#1ba595" attr: "b" }
    shape_redirection: { fg: "#be4264" attr: "b" }
    shape_signature: { fg: "#88b92d" attr: "b" }
    shape_string: "#88b92d"
    shape_string_interpolation: { fg: "#1ba595" attr: "b" }
    shape_table: { fg: "#1e8bac" attr: "b" }
    shape_variable: "#be4264"

    background: "#1d2021"
    foreground: "#d5d5d5"
    cursor: "#d5d5d5"
}}