export def main [] { return {
    separator: "#8b8198"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a3b367" attr: "b" }
    empty: "#7297b9"
    bool: {|| if $in { "#69a9a7" } else { "light_gray" } }
    int: "#8b8198"
    filesize: {|e|
      if $e == 0b {
        "#8b8198"
      } else if $e < 1mb {
        "#69a9a7"
      } else {{ fg: "#7297b9" }}
    }
    duration: "#8b8198"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d57e85" attr: "b" }
      } else if $in < 6hr {
        "#d57e85"
      } else if $in < 1day {
        "#dcb16c"
      } else if $in < 3day {
        "#a3b367"
      } else if $in < 1wk {
        { fg: "#a3b367" attr: "b" }
      } else if $in < 6wk {
        "#69a9a7"
      } else if $in < 52wk {
        "#7297b9"
      } else { "dark_gray" }
    }
    range: "#8b8198"
    float: "#8b8198"
    string: "#8b8198"
    nothing: "#8b8198"
    binary: "#8b8198"
    cellpath: "#8b8198"
    row_index: { fg: "#a3b367" attr: "b" }
    record: "#8b8198"
    list: "#8b8198"
    block: "#8b8198"
    hints: "dark_gray"

    shape_and: { fg: "#bb99b4" attr: "b" }
    shape_binary: { fg: "#bb99b4" attr: "b" }
    shape_block: { fg: "#7297b9" attr: "b" }
    shape_bool: "#69a9a7"
    shape_custom: "#a3b367"
    shape_datetime: { fg: "#69a9a7" attr: "b" }
    shape_directory: "#69a9a7"
    shape_external: "#69a9a7"
    shape_externalarg: { fg: "#a3b367" attr: "b" }
    shape_filepath: "#69a9a7"
    shape_flag: { fg: "#7297b9" attr: "b" }
    shape_float: { fg: "#bb99b4" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#69a9a7" attr: "b" }
    shape_int: { fg: "#bb99b4" attr: "b" }
    shape_internalcall: { fg: "#69a9a7" attr: "b" }
    shape_list: { fg: "#69a9a7" attr: "b" }
    shape_literal: "#7297b9"
    shape_match_pattern: "#a3b367"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#69a9a7"
    shape_operator: "#dcb16c"
    shape_or: { fg: "#bb99b4" attr: "b" }
    shape_pipe: { fg: "#bb99b4" attr: "b" }
    shape_range: { fg: "#dcb16c" attr: "b" }
    shape_record: { fg: "#69a9a7" attr: "b" }
    shape_redirection: { fg: "#bb99b4" attr: "b" }
    shape_signature: { fg: "#a3b367" attr: "b" }
    shape_string: "#a3b367"
    shape_string_interpolation: { fg: "#69a9a7" attr: "b" }
    shape_table: { fg: "#7297b9" attr: "b" }
    shape_variable: "#bb99b4"

    background: "#fbf1f2"
    foreground: "#8b8198"
    cursor: "#8b8198"
}}