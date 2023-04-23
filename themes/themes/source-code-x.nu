export def main [] { return {
    separator: "#bfbfbf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#74b391" attr: "b" }
    empty: "#9586f4"
    bool: {|| if $in { "#83d2c0" } else { "light_gray" } }
    int: "#bfbfbf"
    filesize: {|e|
      if $e == 0b {
        "#bfbfbf"
      } else if $e < 1mb {
        "#79c8b6"
      } else {{ fg: "#9586f4" }}
    }
    duration: "#bfbfbf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fb695d" attr: "b" }
      } else if $in < 6hr {
        "#fb695d"
      } else if $in < 1day {
        "#fc8e3e"
      } else if $in < 3day {
        "#74b391"
      } else if $in < 1wk {
        { fg: "#74b391" attr: "b" }
      } else if $in < 6wk {
        "#79c8b6"
      } else if $in < 52wk {
        "#9586f4"
      } else { "dark_gray" }
    }
    range: "#bfbfbf"
    float: "#bfbfbf"
    string: "#bfbfbf"
    nothing: "#bfbfbf"
    binary: "#bfbfbf"
    cellpath: "#bfbfbf"
    row_index: { fg: "#74b391" attr: "b" }
    record: "#bfbfbf"
    list: "#bfbfbf"
    block: "#bfbfbf"
    hints: "dark_gray"

    shape_and: { fg: "#fb5ea3" attr: "b" }
    shape_binary: { fg: "#fb5ea3" attr: "b" }
    shape_block: { fg: "#9586f4" attr: "b" }
    shape_bool: "#83d2c0"
    shape_custom: "#74b391"
    shape_datetime: { fg: "#79c8b6" attr: "b" }
    shape_directory: "#79c8b6"
    shape_external: "#79c8b6"
    shape_externalarg: { fg: "#74b391" attr: "b" }
    shape_filepath: "#79c8b6"
    shape_flag: { fg: "#9586f4" attr: "b" }
    shape_float: { fg: "#fb5ea3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#79c8b6" attr: "b" }
    shape_int: { fg: "#fb5ea3" attr: "b" }
    shape_internalcall: { fg: "#79c8b6" attr: "b" }
    shape_list: { fg: "#79c8b6" attr: "b" }
    shape_literal: "#9586f4"
    shape_match_pattern: "#74b391"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#83d2c0"
    shape_operator: "#fc8e3e"
    shape_or: { fg: "#fb5ea3" attr: "b" }
    shape_pipe: { fg: "#fb5ea3" attr: "b" }
    shape_range: { fg: "#fc8e3e" attr: "b" }
    shape_record: { fg: "#79c8b6" attr: "b" }
    shape_redirection: { fg: "#fb5ea3" attr: "b" }
    shape_signature: { fg: "#74b391" attr: "b" }
    shape_string: "#74b391"
    shape_string_interpolation: { fg: "#79c8b6" attr: "b" }
    shape_table: { fg: "#9586f4" attr: "b" }
    shape_variable: "#fb5ea3"

    background: "#1f1f24"
    foreground: "#000000"
    cursor: "#7f7f7f"
}}