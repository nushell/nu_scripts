export def main [] { return {
    separator: "#e0dbb7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6ba18a" attr: "b" }
    empty: "#5a86ad"
    bool: {|| if $in { "#93cfd7" } else { "light_gray" } }
    int: "#e0dbb7"
    filesize: {|e|
      if $e == 0b {
        "#e0dbb7"
      } else if $e < 1mb {
        "#74a6ad"
      } else {{ fg: "#5a86ad" }}
    }
    duration: "#e0dbb7"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#be2d26" attr: "b" }
      } else if $in < 6hr {
        "#be2d26"
      } else if $in < 1day {
        "#e99d2a"
      } else if $in < 3day {
        "#6ba18a"
      } else if $in < 1wk {
        { fg: "#6ba18a" attr: "b" }
      } else if $in < 6wk {
        "#74a6ad"
      } else if $in < 52wk {
        "#5a86ad"
      } else { "dark_gray" }
    }
    range: "#e0dbb7"
    float: "#e0dbb7"
    string: "#e0dbb7"
    nothing: "#e0dbb7"
    binary: "#e0dbb7"
    cellpath: "#e0dbb7"
    row_index: { fg: "#6ba18a" attr: "b" }
    record: "#e0dbb7"
    list: "#e0dbb7"
    block: "#e0dbb7"
    hints: "dark_gray"

    shape_and: { fg: "#ac80a6" attr: "b" }
    shape_binary: { fg: "#ac80a6" attr: "b" }
    shape_block: { fg: "#5a86ad" attr: "b" }
    shape_bool: "#93cfd7"
    shape_custom: "#6ba18a"
    shape_datetime: { fg: "#74a6ad" attr: "b" }
    shape_directory: "#74a6ad"
    shape_external: "#74a6ad"
    shape_externalarg: { fg: "#6ba18a" attr: "b" }
    shape_filepath: "#74a6ad"
    shape_flag: { fg: "#5a86ad" attr: "b" }
    shape_float: { fg: "#ac80a6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#74a6ad" attr: "b" }
    shape_int: { fg: "#ac80a6" attr: "b" }
    shape_internalcall: { fg: "#74a6ad" attr: "b" }
    shape_list: { fg: "#74a6ad" attr: "b" }
    shape_literal: "#5a86ad"
    shape_match_pattern: "#6ba18a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#93cfd7"
    shape_operator: "#e99d2a"
    shape_or: { fg: "#ac80a6" attr: "b" }
    shape_pipe: { fg: "#ac80a6" attr: "b" }
    shape_range: { fg: "#e99d2a" attr: "b" }
    shape_record: { fg: "#74a6ad" attr: "b" }
    shape_redirection: { fg: "#ac80a6" attr: "b" }
    shape_signature: { fg: "#6ba18a" attr: "b" }
    shape_string: "#6ba18a"
    shape_string_interpolation: { fg: "#74a6ad" attr: "b" }
    shape_table: { fg: "#5a86ad" attr: "b" }
    shape_variable: "#ac80a6"

    background: "#2a1f1d"
    foreground: "#e0dbb7"
    cursor: "#e0dbb7"
}}