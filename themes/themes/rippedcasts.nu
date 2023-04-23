export def main [] { return {
    separator: "#bfbfbf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a8ff60" attr: "b" }
    empty: "#75a5b0"
    bool: {|| if $in { "#8c9bc4" } else { "light_gray" } }
    int: "#bfbfbf"
    filesize: {|e|
      if $e == 0b {
        "#bfbfbf"
      } else if $e < 1mb {
        "#5a647e"
      } else {{ fg: "#75a5b0" }}
    }
    duration: "#bfbfbf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cdaf95" attr: "b" }
      } else if $in < 6hr {
        "#cdaf95"
      } else if $in < 1day {
        "#bfbb1f"
      } else if $in < 3day {
        "#a8ff60"
      } else if $in < 1wk {
        { fg: "#a8ff60" attr: "b" }
      } else if $in < 6wk {
        "#5a647e"
      } else if $in < 52wk {
        "#75a5b0"
      } else { "dark_gray" }
    }
    range: "#bfbfbf"
    float: "#bfbfbf"
    string: "#bfbfbf"
    nothing: "#bfbfbf"
    binary: "#bfbfbf"
    cellpath: "#bfbfbf"
    row_index: { fg: "#a8ff60" attr: "b" }
    record: "#bfbfbf"
    list: "#bfbfbf"
    block: "#bfbfbf"
    hints: "dark_gray"

    shape_and: { fg: "#ff73fd" attr: "b" }
    shape_binary: { fg: "#ff73fd" attr: "b" }
    shape_block: { fg: "#75a5b0" attr: "b" }
    shape_bool: "#8c9bc4"
    shape_custom: "#a8ff60"
    shape_datetime: { fg: "#5a647e" attr: "b" }
    shape_directory: "#5a647e"
    shape_external: "#5a647e"
    shape_externalarg: { fg: "#a8ff60" attr: "b" }
    shape_filepath: "#5a647e"
    shape_flag: { fg: "#75a5b0" attr: "b" }
    shape_float: { fg: "#ff73fd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5a647e" attr: "b" }
    shape_int: { fg: "#ff73fd" attr: "b" }
    shape_internalcall: { fg: "#5a647e" attr: "b" }
    shape_list: { fg: "#5a647e" attr: "b" }
    shape_literal: "#75a5b0"
    shape_match_pattern: "#a8ff60"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8c9bc4"
    shape_operator: "#bfbb1f"
    shape_or: { fg: "#ff73fd" attr: "b" }
    shape_pipe: { fg: "#ff73fd" attr: "b" }
    shape_range: { fg: "#bfbb1f" attr: "b" }
    shape_record: { fg: "#5a647e" attr: "b" }
    shape_redirection: { fg: "#ff73fd" attr: "b" }
    shape_signature: { fg: "#a8ff60" attr: "b" }
    shape_string: "#a8ff60"
    shape_string_interpolation: { fg: "#5a647e" attr: "b" }
    shape_table: { fg: "#75a5b0" attr: "b" }
    shape_variable: "#ff73fd"

    background: "#2b2b2b"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}