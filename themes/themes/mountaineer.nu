export def main [] { return {
    separator: "#c5c8c6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b5bd68" attr: "b" }
    empty: "#81a2be"
    bool: {|| if $in { "#8abeb7" } else { "light_gray" } }
    int: "#c5c8c6"
    filesize: {|e|
      if $e == 0b {
        "#c5c8c6"
      } else if $e < 1mb {
        "#8abeb7"
      } else {{ fg: "#81a2be" }}
    }
    duration: "#c5c8c6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cc6666" attr: "b" }
      } else if $in < 6hr {
        "#cc6666"
      } else if $in < 1day {
        "#f0c674"
      } else if $in < 3day {
        "#b5bd68"
      } else if $in < 1wk {
        { fg: "#b5bd68" attr: "b" }
      } else if $in < 6wk {
        "#8abeb7"
      } else if $in < 52wk {
        "#81a2be"
      } else { "dark_gray" }
    }
    range: "#c5c8c6"
    float: "#c5c8c6"
    string: "#c5c8c6"
    nothing: "#c5c8c6"
    binary: "#c5c8c6"
    cellpath: "#c5c8c6"
    row_index: { fg: "#b5bd68" attr: "b" }
    record: "#c5c8c6"
    list: "#c5c8c6"
    block: "#c5c8c6"
    hints: "dark_gray"

    shape_and: { fg: "#b294bb" attr: "b" }
    shape_binary: { fg: "#b294bb" attr: "b" }
    shape_block: { fg: "#81a2be" attr: "b" }
    shape_bool: "#8abeb7"
    shape_custom: "#b5bd68"
    shape_datetime: { fg: "#8abeb7" attr: "b" }
    shape_directory: "#8abeb7"
    shape_external: "#8abeb7"
    shape_externalarg: { fg: "#b5bd68" attr: "b" }
    shape_filepath: "#8abeb7"
    shape_flag: { fg: "#81a2be" attr: "b" }
    shape_float: { fg: "#b294bb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8abeb7" attr: "b" }
    shape_int: { fg: "#b294bb" attr: "b" }
    shape_internalcall: { fg: "#8abeb7" attr: "b" }
    shape_list: { fg: "#8abeb7" attr: "b" }
    shape_literal: "#81a2be"
    shape_match_pattern: "#b5bd68"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8abeb7"
    shape_operator: "#f0c674"
    shape_or: { fg: "#b294bb" attr: "b" }
    shape_pipe: { fg: "#b294bb" attr: "b" }
    shape_range: { fg: "#f0c674" attr: "b" }
    shape_record: { fg: "#8abeb7" attr: "b" }
    shape_redirection: { fg: "#b294bb" attr: "b" }
    shape_signature: { fg: "#b5bd68" attr: "b" }
    shape_string: "#b5bd68"
    shape_string_interpolation: { fg: "#8abeb7" attr: "b" }
    shape_table: { fg: "#81a2be" attr: "b" }
    shape_variable: "#b294bb"

    background: "#050505"
    foreground: "#f0f0f0"
    cursor: "#b5bd68"
}}