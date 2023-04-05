export def main [] { return {
    separator: "#d0d0d0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5f865f" attr: "b" }
    empty: "#85add4"
    bool: {|| if $in { "#87d7d7" } else { "light_gray" } }
    int: "#d0d0d0"
    filesize: {|e|
      if $e == 0b {
        "#d0d0d0"
      } else if $e < 1mb {
        "#87afaf"
      } else {{ fg: "#85add4" }}
    }
    duration: "#d0d0d0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d68787" attr: "b" }
      } else if $in < 6hr {
        "#d68787"
      } else if $in < 1day {
        "#d8af5f"
      } else if $in < 3day {
        "#5f865f"
      } else if $in < 1wk {
        { fg: "#5f865f" attr: "b" }
      } else if $in < 6wk {
        "#87afaf"
      } else if $in < 52wk {
        "#85add4"
      } else { "dark_gray" }
    }
    range: "#d0d0d0"
    float: "#d0d0d0"
    string: "#d0d0d0"
    nothing: "#d0d0d0"
    binary: "#d0d0d0"
    cellpath: "#d0d0d0"
    row_index: { fg: "#5f865f" attr: "b" }
    record: "#d0d0d0"
    list: "#d0d0d0"
    block: "#d0d0d0"
    hints: "dark_gray"

    shape_and: { fg: "#d7afaf" attr: "b" }
    shape_binary: { fg: "#d7afaf" attr: "b" }
    shape_block: { fg: "#85add4" attr: "b" }
    shape_bool: "#87d7d7"
    shape_custom: "#5f865f"
    shape_datetime: { fg: "#87afaf" attr: "b" }
    shape_directory: "#87afaf"
    shape_external: "#87afaf"
    shape_externalarg: { fg: "#5f865f" attr: "b" }
    shape_filepath: "#87afaf"
    shape_flag: { fg: "#85add4" attr: "b" }
    shape_float: { fg: "#d7afaf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#87afaf" attr: "b" }
    shape_int: { fg: "#d7afaf" attr: "b" }
    shape_internalcall: { fg: "#87afaf" attr: "b" }
    shape_list: { fg: "#87afaf" attr: "b" }
    shape_literal: "#85add4"
    shape_match_pattern: "#5f865f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#87d7d7"
    shape_operator: "#d8af5f"
    shape_or: { fg: "#d7afaf" attr: "b" }
    shape_pipe: { fg: "#d7afaf" attr: "b" }
    shape_range: { fg: "#d8af5f" attr: "b" }
    shape_record: { fg: "#87afaf" attr: "b" }
    shape_redirection: { fg: "#d7afaf" attr: "b" }
    shape_signature: { fg: "#5f865f" attr: "b" }
    shape_string: "#5f865f"
    shape_string_interpolation: { fg: "#87afaf" attr: "b" }
    shape_table: { fg: "#85add4" attr: "b" }
    shape_variable: "#d7afaf"

    background: "#3a3a3a"
    foreground: "#d0d0d0"
    cursor: "#d0d0d0"
}}