export def main [] { return {
    separator: "#0000d7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#bcbcbc" attr: "b" }
    empty: "#5f87d7"
    bool: {|| if $in { "#005faf" } else { "light_gray" } }
    int: "#0000d7"
    filesize: {|e|
      if $e == 0b {
        "#0000d7"
      } else if $e < 1mb {
        "#0087d7"
      } else {{ fg: "#5f87d7" }}
    }
    duration: "#0000d7"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#5f5f5f" attr: "b" }
      } else if $in < 6hr {
        "#5f5f5f"
      } else if $in < 1day {
        "#d7af87"
      } else if $in < 3day {
        "#bcbcbc"
      } else if $in < 1wk {
        { fg: "#bcbcbc" attr: "b" }
      } else if $in < 6wk {
        "#0087d7"
      } else if $in < 52wk {
        "#5f87d7"
      } else { "dark_gray" }
    }
    range: "#0000d7"
    float: "#0000d7"
    string: "#0000d7"
    nothing: "#0000d7"
    binary: "#0000d7"
    cellpath: "#0000d7"
    row_index: { fg: "#bcbcbc" attr: "b" }
    record: "#0000d7"
    list: "#0000d7"
    block: "#0000d7"
    hints: "dark_gray"

    shape_and: { fg: "#87afd7" attr: "b" }
    shape_binary: { fg: "#87afd7" attr: "b" }
    shape_block: { fg: "#5f87d7" attr: "b" }
    shape_bool: "#005faf"
    shape_custom: "#bcbcbc"
    shape_datetime: { fg: "#0087d7" attr: "b" }
    shape_directory: "#0087d7"
    shape_external: "#0087d7"
    shape_externalarg: { fg: "#bcbcbc" attr: "b" }
    shape_filepath: "#0087d7"
    shape_flag: { fg: "#5f87d7" attr: "b" }
    shape_float: { fg: "#87afd7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#0087d7" attr: "b" }
    shape_int: { fg: "#87afd7" attr: "b" }
    shape_internalcall: { fg: "#0087d7" attr: "b" }
    shape_list: { fg: "#0087d7" attr: "b" }
    shape_literal: "#5f87d7"
    shape_match_pattern: "#bcbcbc"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#005faf"
    shape_operator: "#d7af87"
    shape_or: { fg: "#87afd7" attr: "b" }
    shape_pipe: { fg: "#87afd7" attr: "b" }
    shape_range: { fg: "#d7af87" attr: "b" }
    shape_record: { fg: "#0087d7" attr: "b" }
    shape_redirection: { fg: "#87afd7" attr: "b" }
    shape_signature: { fg: "#bcbcbc" attr: "b" }
    shape_string: "#bcbcbc"
    shape_string_interpolation: { fg: "#0087d7" attr: "b" }
    shape_table: { fg: "#5f87d7" attr: "b" }
    shape_variable: "#87afd7"

    background: "#000000"
    foreground: "#e4e4e4"
    cursor: "#5fafff"
}}