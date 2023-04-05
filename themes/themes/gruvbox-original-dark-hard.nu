export def main [] { return {
    separator: "#ebdbb2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b8bb26" attr: "b" }
    empty: "#83a598"
    bool: {|| if $in { "#8ec07c" } else { "light_gray" } }
    int: "#ebdbb2"
    filesize: {|e|
      if $e == 0b {
        "#ebdbb2"
      } else if $e < 1mb {
        "#8ec07c"
      } else {{ fg: "#83a598" }}
    }
    duration: "#ebdbb2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fb4934" attr: "b" }
      } else if $in < 6hr {
        "#fb4934"
      } else if $in < 1day {
        "#fabd2f"
      } else if $in < 3day {
        "#b8bb26"
      } else if $in < 1wk {
        { fg: "#b8bb26" attr: "b" }
      } else if $in < 6wk {
        "#8ec07c"
      } else if $in < 52wk {
        "#83a598"
      } else { "dark_gray" }
    }
    range: "#ebdbb2"
    float: "#ebdbb2"
    string: "#ebdbb2"
    nothing: "#ebdbb2"
    binary: "#ebdbb2"
    cellpath: "#ebdbb2"
    row_index: { fg: "#b8bb26" attr: "b" }
    record: "#ebdbb2"
    list: "#ebdbb2"
    block: "#ebdbb2"
    hints: "dark_gray"

    shape_and: { fg: "#d3869b" attr: "b" }
    shape_binary: { fg: "#d3869b" attr: "b" }
    shape_block: { fg: "#83a598" attr: "b" }
    shape_bool: "#8ec07c"
    shape_custom: "#b8bb26"
    shape_datetime: { fg: "#8ec07c" attr: "b" }
    shape_directory: "#8ec07c"
    shape_external: "#8ec07c"
    shape_externalarg: { fg: "#b8bb26" attr: "b" }
    shape_filepath: "#8ec07c"
    shape_flag: { fg: "#83a598" attr: "b" }
    shape_float: { fg: "#d3869b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8ec07c" attr: "b" }
    shape_int: { fg: "#d3869b" attr: "b" }
    shape_internalcall: { fg: "#8ec07c" attr: "b" }
    shape_list: { fg: "#8ec07c" attr: "b" }
    shape_literal: "#83a598"
    shape_match_pattern: "#b8bb26"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8ec07c"
    shape_operator: "#fabd2f"
    shape_or: { fg: "#d3869b" attr: "b" }
    shape_pipe: { fg: "#d3869b" attr: "b" }
    shape_range: { fg: "#fabd2f" attr: "b" }
    shape_record: { fg: "#8ec07c" attr: "b" }
    shape_redirection: { fg: "#d3869b" attr: "b" }
    shape_signature: { fg: "#b8bb26" attr: "b" }
    shape_string: "#b8bb26"
    shape_string_interpolation: { fg: "#8ec07c" attr: "b" }
    shape_table: { fg: "#83a598" attr: "b" }
    shape_variable: "#d3869b"

    background: "#1d2021"
    foreground: "#ebdbb2"
    cursor: "#ebdbb2"
}}