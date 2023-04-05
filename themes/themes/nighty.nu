export def main [] { return {
    separator: "#828282"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#095b32" attr: "b" }
    empty: "#1d3e6f"
    bool: {|| if $in { "#70d2a4" } else { "light_gray" } }
    int: "#828282"
    filesize: {|e|
      if $e == 0b {
        "#828282"
      } else if $e < 1mb {
        "#3a7458"
      } else {{ fg: "#1d3e6f" }}
    }
    duration: "#828282"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#9b3e46" attr: "b" }
      } else if $in < 6hr {
        "#9b3e46"
      } else if $in < 1day {
        "#808020"
      } else if $in < 3day {
        "#095b32"
      } else if $in < 1wk {
        { fg: "#095b32" attr: "b" }
      } else if $in < 6wk {
        "#3a7458"
      } else if $in < 52wk {
        "#1d3e6f"
      } else { "dark_gray" }
    }
    range: "#828282"
    float: "#828282"
    string: "#828282"
    nothing: "#828282"
    binary: "#828282"
    cellpath: "#828282"
    row_index: { fg: "#095b32" attr: "b" }
    record: "#828282"
    list: "#828282"
    block: "#828282"
    hints: "dark_gray"

    shape_and: { fg: "#823065" attr: "b" }
    shape_binary: { fg: "#823065" attr: "b" }
    shape_block: { fg: "#1d3e6f" attr: "b" }
    shape_bool: "#70d2a4"
    shape_custom: "#095b32"
    shape_datetime: { fg: "#3a7458" attr: "b" }
    shape_directory: "#3a7458"
    shape_external: "#3a7458"
    shape_externalarg: { fg: "#095b32" attr: "b" }
    shape_filepath: "#3a7458"
    shape_flag: { fg: "#1d3e6f" attr: "b" }
    shape_float: { fg: "#823065" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3a7458" attr: "b" }
    shape_int: { fg: "#823065" attr: "b" }
    shape_internalcall: { fg: "#3a7458" attr: "b" }
    shape_list: { fg: "#3a7458" attr: "b" }
    shape_literal: "#1d3e6f"
    shape_match_pattern: "#095b32"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#70d2a4"
    shape_operator: "#808020"
    shape_or: { fg: "#823065" attr: "b" }
    shape_pipe: { fg: "#823065" attr: "b" }
    shape_range: { fg: "#808020" attr: "b" }
    shape_record: { fg: "#3a7458" attr: "b" }
    shape_redirection: { fg: "#823065" attr: "b" }
    shape_signature: { fg: "#095b32" attr: "b" }
    shape_string: "#095b32"
    shape_string_interpolation: { fg: "#3a7458" attr: "b" }
    shape_table: { fg: "#1d3e6f" attr: "b" }
    shape_variable: "#823065"

    background: "#2f2f2f"
    foreground: "#dfdfdf"
    cursor: "#dfdfdf"
}}