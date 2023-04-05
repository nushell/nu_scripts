export def main [] { return {
    separator: "#bcbcbc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#87af87" attr: "b" }
    empty: "#ffffaf"
    bool: {|| if $in { "#5f875f" } else { "light_gray" } }
    int: "#bcbcbc"
    filesize: {|e|
      if $e == 0b {
        "#bcbcbc"
      } else if $e < 1mb {
        "#5f875f"
      } else {{ fg: "#ffffaf" }}
    }
    duration: "#bcbcbc"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#5f8787" attr: "b" }
      } else if $in < 6hr {
        "#5f8787"
      } else if $in < 1day {
        "#5f8787"
      } else if $in < 3day {
        "#87af87"
      } else if $in < 1wk {
        { fg: "#87af87" attr: "b" }
      } else if $in < 6wk {
        "#5f875f"
      } else if $in < 52wk {
        "#ffffaf"
      } else { "dark_gray" }
    }
    range: "#bcbcbc"
    float: "#bcbcbc"
    string: "#bcbcbc"
    nothing: "#bcbcbc"
    binary: "#bcbcbc"
    cellpath: "#bcbcbc"
    row_index: { fg: "#87af87" attr: "b" }
    record: "#bcbcbc"
    list: "#bcbcbc"
    block: "#bcbcbc"
    hints: "dark_gray"

    shape_and: { fg: "#87afd7" attr: "b" }
    shape_binary: { fg: "#87afd7" attr: "b" }
    shape_block: { fg: "#ffffaf" attr: "b" }
    shape_bool: "#5f875f"
    shape_custom: "#87af87"
    shape_datetime: { fg: "#5f875f" attr: "b" }
    shape_directory: "#5f875f"
    shape_external: "#5f875f"
    shape_externalarg: { fg: "#87af87" attr: "b" }
    shape_filepath: "#5f875f"
    shape_flag: { fg: "#ffffaf" attr: "b" }
    shape_float: { fg: "#87afd7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5f875f" attr: "b" }
    shape_int: { fg: "#87afd7" attr: "b" }
    shape_internalcall: { fg: "#5f875f" attr: "b" }
    shape_list: { fg: "#5f875f" attr: "b" }
    shape_literal: "#ffffaf"
    shape_match_pattern: "#87af87"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5f875f"
    shape_operator: "#5f8787"
    shape_or: { fg: "#87afd7" attr: "b" }
    shape_pipe: { fg: "#87afd7" attr: "b" }
    shape_range: { fg: "#5f8787" attr: "b" }
    shape_record: { fg: "#5f875f" attr: "b" }
    shape_redirection: { fg: "#87afd7" attr: "b" }
    shape_signature: { fg: "#87af87" attr: "b" }
    shape_string: "#87af87"
    shape_string_interpolation: { fg: "#5f875f" attr: "b" }
    shape_table: { fg: "#ffffaf" attr: "b" }
    shape_variable: "#87afd7"

    background: "#262626"
    foreground: "#bcbcbc"
    cursor: "#bcbcbc"
}}