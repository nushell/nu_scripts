export def main [] { return {
    separator: "#a9b1d6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#9ece6a" attr: "b" }
    empty: "#7aa2f7"
    bool: {|| if $in { "#7dcfff" } else { "light_gray" } }
    int: "#a9b1d6"
    filesize: {|e|
      if $e == 0b {
        "#a9b1d6"
      } else if $e < 1mb {
        "#7dcfff"
      } else {{ fg: "#7aa2f7" }}
    }
    duration: "#a9b1d6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f7768e" attr: "b" }
      } else if $in < 6hr {
        "#f7768e"
      } else if $in < 1day {
        "#e0af68"
      } else if $in < 3day {
        "#9ece6a"
      } else if $in < 1wk {
        { fg: "#9ece6a" attr: "b" }
      } else if $in < 6wk {
        "#7dcfff"
      } else if $in < 52wk {
        "#7aa2f7"
      } else { "dark_gray" }
    }
    range: "#a9b1d6"
    float: "#a9b1d6"
    string: "#a9b1d6"
    nothing: "#a9b1d6"
    binary: "#a9b1d6"
    cellpath: "#a9b1d6"
    row_index: { fg: "#9ece6a" attr: "b" }
    record: "#a9b1d6"
    list: "#a9b1d6"
    block: "#a9b1d6"
    hints: "dark_gray"

    shape_and: { fg: "#bb9af7" attr: "b" }
    shape_binary: { fg: "#bb9af7" attr: "b" }
    shape_block: { fg: "#7aa2f7" attr: "b" }
    shape_bool: "#7dcfff"
    shape_custom: "#9ece6a"
    shape_datetime: { fg: "#7dcfff" attr: "b" }
    shape_directory: "#7dcfff"
    shape_external: "#7dcfff"
    shape_externalarg: { fg: "#9ece6a" attr: "b" }
    shape_filepath: "#7dcfff"
    shape_flag: { fg: "#7aa2f7" attr: "b" }
    shape_float: { fg: "#bb9af7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7dcfff" attr: "b" }
    shape_int: { fg: "#bb9af7" attr: "b" }
    shape_internalcall: { fg: "#7dcfff" attr: "b" }
    shape_list: { fg: "#7dcfff" attr: "b" }
    shape_literal: "#7aa2f7"
    shape_match_pattern: "#9ece6a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7dcfff"
    shape_operator: "#e0af68"
    shape_or: { fg: "#bb9af7" attr: "b" }
    shape_pipe: { fg: "#bb9af7" attr: "b" }
    shape_range: { fg: "#e0af68" attr: "b" }
    shape_record: { fg: "#7dcfff" attr: "b" }
    shape_redirection: { fg: "#bb9af7" attr: "b" }
    shape_signature: { fg: "#9ece6a" attr: "b" }
    shape_string: "#9ece6a"
    shape_string_interpolation: { fg: "#7dcfff" attr: "b" }
    shape_table: { fg: "#7aa2f7" attr: "b" }
    shape_variable: "#bb9af7"

    background: "#1a1b26"
    foreground: "#c0caf5"
    cursor: "#c0caf5"
}}