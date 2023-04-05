export def main [] { return {
    separator: "#a4a4a4"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#3fa33f" attr: "b" }
    empty: "#1d80ef"
    bool: {|| if $in { "#42c6d9" } else { "light_gray" } }
    int: "#a4a4a4"
    filesize: {|e|
      if $e == 0b {
        "#a4a4a4"
      } else if $e < 1mb {
        "#16aec9"
      } else {{ fg: "#1d80ef" }}
    }
    duration: "#a4a4a4"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ee2a29" attr: "b" }
      } else if $in < 6hr {
        "#ee2a29"
      } else if $in < 1day {
        "#fee92e"
      } else if $in < 3day {
        "#3fa33f"
      } else if $in < 1wk {
        { fg: "#3fa33f" attr: "b" }
      } else if $in < 6wk {
        "#16aec9"
      } else if $in < 52wk {
        "#1d80ef"
      } else { "dark_gray" }
    }
    range: "#a4a4a4"
    float: "#a4a4a4"
    string: "#a4a4a4"
    nothing: "#a4a4a4"
    binary: "#a4a4a4"
    cellpath: "#a4a4a4"
    row_index: { fg: "#3fa33f" attr: "b" }
    record: "#a4a4a4"
    list: "#a4a4a4"
    block: "#a4a4a4"
    hints: "dark_gray"

    shape_and: { fg: "#8800a0" attr: "b" }
    shape_binary: { fg: "#8800a0" attr: "b" }
    shape_block: { fg: "#1d80ef" attr: "b" }
    shape_bool: "#42c6d9"
    shape_custom: "#3fa33f"
    shape_datetime: { fg: "#16aec9" attr: "b" }
    shape_directory: "#16aec9"
    shape_external: "#16aec9"
    shape_externalarg: { fg: "#3fa33f" attr: "b" }
    shape_filepath: "#16aec9"
    shape_flag: { fg: "#1d80ef" attr: "b" }
    shape_float: { fg: "#8800a0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#16aec9" attr: "b" }
    shape_int: { fg: "#8800a0" attr: "b" }
    shape_internalcall: { fg: "#16aec9" attr: "b" }
    shape_list: { fg: "#16aec9" attr: "b" }
    shape_literal: "#1d80ef"
    shape_match_pattern: "#3fa33f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#42c6d9"
    shape_operator: "#fee92e"
    shape_or: { fg: "#8800a0" attr: "b" }
    shape_pipe: { fg: "#8800a0" attr: "b" }
    shape_range: { fg: "#fee92e" attr: "b" }
    shape_record: { fg: "#16aec9" attr: "b" }
    shape_redirection: { fg: "#8800a0" attr: "b" }
    shape_signature: { fg: "#3fa33f" attr: "b" }
    shape_string: "#3fa33f"
    shape_string_interpolation: { fg: "#16aec9" attr: "b" }
    shape_table: { fg: "#1d80ef" attr: "b" }
    shape_variable: "#8800a0"

    background: "#1c262b"
    foreground: "#c1c8d6"
    cursor: "#b2b8c3"
}}