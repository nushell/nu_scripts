export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#1f8c3b" attr: "b" }
    empty: "#1dd3ee"
    bool: {|| if $in { "#3e999f" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#3e999f"
      } else {{ fg: "#1dd3ee" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff4d83" attr: "b" }
      } else if $in < 6hr {
        "#ff4d83"
      } else if $in < 1day {
        "#1fc95b"
      } else if $in < 3day {
        "#1f8c3b"
      } else if $in < 1wk {
        { fg: "#1f8c3b" attr: "b" }
      } else if $in < 6wk {
        "#3e999f"
      } else if $in < 52wk {
        "#1dd3ee"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#1f8c3b" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#8959a8" attr: "b" }
    shape_binary: { fg: "#8959a8" attr: "b" }
    shape_block: { fg: "#1dd3ee" attr: "b" }
    shape_bool: "#3e999f"
    shape_custom: "#1f8c3b"
    shape_datetime: { fg: "#3e999f" attr: "b" }
    shape_directory: "#3e999f"
    shape_external: "#3e999f"
    shape_externalarg: { fg: "#1f8c3b" attr: "b" }
    shape_filepath: "#3e999f"
    shape_flag: { fg: "#1dd3ee" attr: "b" }
    shape_float: { fg: "#8959a8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3e999f" attr: "b" }
    shape_int: { fg: "#8959a8" attr: "b" }
    shape_internalcall: { fg: "#3e999f" attr: "b" }
    shape_list: { fg: "#3e999f" attr: "b" }
    shape_literal: "#1dd3ee"
    shape_match_pattern: "#1f8c3b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3e999f"
    shape_operator: "#1fc95b"
    shape_or: { fg: "#8959a8" attr: "b" }
    shape_pipe: { fg: "#8959a8" attr: "b" }
    shape_range: { fg: "#1fc95b" attr: "b" }
    shape_record: { fg: "#3e999f" attr: "b" }
    shape_redirection: { fg: "#8959a8" attr: "b" }
    shape_signature: { fg: "#1f8c3b" attr: "b" }
    shape_string: "#1f8c3b"
    shape_string_interpolation: { fg: "#3e999f" attr: "b" }
    shape_table: { fg: "#1dd3ee" attr: "b" }
    shape_variable: "#8959a8"

    background: "#0a1e24"
    foreground: "#ecf0c1"
    cursor: "#ecf0c1"
}}