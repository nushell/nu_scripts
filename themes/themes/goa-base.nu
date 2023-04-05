export def main [] { return {
    separator: "#000000"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#249000" attr: "b" }
    empty: "#000482"
    bool: {|| if $in { "#c8f9f3" } else { "light_gray" } }
    int: "#000000"
    filesize: {|e|
      if $e == 0b {
        "#000000"
      } else if $e < 1mb {
        "#3affff"
      } else {{ fg: "#000482" }}
    }
    duration: "#000000"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f78000" attr: "b" }
      } else if $in < 6hr {
        "#f78000"
      } else if $in < 1day {
        "#f40000"
      } else if $in < 3day {
        "#249000"
      } else if $in < 1wk {
        { fg: "#249000" attr: "b" }
      } else if $in < 6wk {
        "#3affff"
      } else if $in < 52wk {
        "#000482"
      } else { "dark_gray" }
    }
    range: "#000000"
    float: "#000000"
    string: "#000000"
    nothing: "#000000"
    binary: "#000000"
    cellpath: "#000000"
    row_index: { fg: "#249000" attr: "b" }
    record: "#000000"
    list: "#000000"
    block: "#000000"
    hints: "dark_gray"

    shape_and: { fg: "#f43bff" attr: "b" }
    shape_binary: { fg: "#f43bff" attr: "b" }
    shape_block: { fg: "#000482" attr: "b" }
    shape_bool: "#c8f9f3"
    shape_custom: "#249000"
    shape_datetime: { fg: "#3affff" attr: "b" }
    shape_directory: "#3affff"
    shape_external: "#3affff"
    shape_externalarg: { fg: "#249000" attr: "b" }
    shape_filepath: "#3affff"
    shape_flag: { fg: "#000482" attr: "b" }
    shape_float: { fg: "#f43bff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3affff" attr: "b" }
    shape_int: { fg: "#f43bff" attr: "b" }
    shape_internalcall: { fg: "#3affff" attr: "b" }
    shape_list: { fg: "#3affff" attr: "b" }
    shape_literal: "#000482"
    shape_match_pattern: "#249000"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c8f9f3"
    shape_operator: "#f40000"
    shape_or: { fg: "#f43bff" attr: "b" }
    shape_pipe: { fg: "#f43bff" attr: "b" }
    shape_range: { fg: "#f40000" attr: "b" }
    shape_record: { fg: "#3affff" attr: "b" }
    shape_redirection: { fg: "#f43bff" attr: "b" }
    shape_signature: { fg: "#249000" attr: "b" }
    shape_string: "#249000"
    shape_string_interpolation: { fg: "#3affff" attr: "b" }
    shape_table: { fg: "#000482" attr: "b" }
    shape_variable: "#f43bff"

    background: "#2f0033"
    foreground: "#f6ed00"
    cursor: "#1a6500"
}}