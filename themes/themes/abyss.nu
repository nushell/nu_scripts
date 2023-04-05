export def main [] { return {
    separator: "#a0cce2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#10598b" attr: "b" }
    empty: "#277bb1"
    bool: {|| if $in { "#2592d3" } else { "light_gray" } }
    int: "#a0cce2"
    filesize: {|e|
      if $e == 0b {
        "#a0cce2"
      } else if $e < 1mb {
        "#2592d3"
      } else {{ fg: "#277bb1" }}
    }
    duration: "#a0cce2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#48697e" attr: "b" }
      } else if $in < 6hr {
        "#48697e"
      } else if $in < 1day {
        "#1f6ca1"
      } else if $in < 3day {
        "#10598b"
      } else if $in < 1wk {
        { fg: "#10598b" attr: "b" }
      } else if $in < 6wk {
        "#2592d3"
      } else if $in < 52wk {
        "#277bb1"
      } else { "dark_gray" }
    }
    range: "#a0cce2"
    float: "#a0cce2"
    string: "#a0cce2"
    nothing: "#a0cce2"
    binary: "#a0cce2"
    cellpath: "#a0cce2"
    row_index: { fg: "#10598b" attr: "b" }
    record: "#a0cce2"
    list: "#a0cce2"
    block: "#a0cce2"
    hints: "dark_gray"

    shape_and: { fg: "#4595bd" attr: "b" }
    shape_binary: { fg: "#4595bd" attr: "b" }
    shape_block: { fg: "#277bb1" attr: "b" }
    shape_bool: "#2592d3"
    shape_custom: "#10598b"
    shape_datetime: { fg: "#2592d3" attr: "b" }
    shape_directory: "#2592d3"
    shape_external: "#2592d3"
    shape_externalarg: { fg: "#10598b" attr: "b" }
    shape_filepath: "#2592d3"
    shape_flag: { fg: "#277bb1" attr: "b" }
    shape_float: { fg: "#4595bd" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2592d3" attr: "b" }
    shape_int: { fg: "#4595bd" attr: "b" }
    shape_internalcall: { fg: "#2592d3" attr: "b" }
    shape_list: { fg: "#2592d3" attr: "b" }
    shape_literal: "#277bb1"
    shape_match_pattern: "#10598b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2592d3"
    shape_operator: "#1f6ca1"
    shape_or: { fg: "#4595bd" attr: "b" }
    shape_pipe: { fg: "#4595bd" attr: "b" }
    shape_range: { fg: "#1f6ca1" attr: "b" }
    shape_record: { fg: "#2592d3" attr: "b" }
    shape_redirection: { fg: "#4595bd" attr: "b" }
    shape_signature: { fg: "#10598b" attr: "b" }
    shape_string: "#10598b"
    shape_string_interpolation: { fg: "#2592d3" attr: "b" }
    shape_table: { fg: "#277bb1" attr: "b" }
    shape_variable: "#4595bd"

    background: "#040f18"
    foreground: "#c0c7ca"
    cursor: "#10598b"
}}