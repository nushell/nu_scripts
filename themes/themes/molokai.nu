export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#23e298" attr: "b" }
    empty: "#d08010"
    bool: {|| if $in { "#ffce51" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#d0a843"
      } else {{ fg: "#d08010" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#7325fa" attr: "b" }
      } else if $in < 6hr {
        "#7325fa"
      } else if $in < 1day {
        "#60d4df"
      } else if $in < 3day {
        "#23e298"
      } else if $in < 1wk {
        { fg: "#23e298" attr: "b" }
      } else if $in < 6wk {
        "#d0a843"
      } else if $in < 52wk {
        "#d08010"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#23e298" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#ff0087" attr: "b" }
    shape_binary: { fg: "#ff0087" attr: "b" }
    shape_block: { fg: "#d08010" attr: "b" }
    shape_bool: "#ffce51"
    shape_custom: "#23e298"
    shape_datetime: { fg: "#d0a843" attr: "b" }
    shape_directory: "#d0a843"
    shape_external: "#d0a843"
    shape_externalarg: { fg: "#23e298" attr: "b" }
    shape_filepath: "#d0a843"
    shape_flag: { fg: "#d08010" attr: "b" }
    shape_float: { fg: "#ff0087" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#d0a843" attr: "b" }
    shape_int: { fg: "#ff0087" attr: "b" }
    shape_internalcall: { fg: "#d0a843" attr: "b" }
    shape_list: { fg: "#d0a843" attr: "b" }
    shape_literal: "#d08010"
    shape_match_pattern: "#23e298"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ffce51"
    shape_operator: "#60d4df"
    shape_or: { fg: "#ff0087" attr: "b" }
    shape_pipe: { fg: "#ff0087" attr: "b" }
    shape_range: { fg: "#60d4df" attr: "b" }
    shape_record: { fg: "#d0a843" attr: "b" }
    shape_redirection: { fg: "#ff0087" attr: "b" }
    shape_signature: { fg: "#23e298" attr: "b" }
    shape_string: "#23e298"
    shape_string_interpolation: { fg: "#d0a843" attr: "b" }
    shape_table: { fg: "#d08010" attr: "b" }
    shape_variable: "#ff0087"

    background: "#1b1d1e"
    foreground: "#bbbbbb"
    cursor: "#bbbbbb"
}}