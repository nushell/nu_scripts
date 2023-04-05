export def main [] { return {
    separator: "#bababa"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#68c256" attr: "b" }
    empty: "#1c98e8"
    bool: {|| if $in { "#3d97e2" } else { "light_gray" } }
    int: "#bababa"
    filesize: {|e|
      if $e == 0b {
        "#bababa"
      } else if $e < 1mb {
        "#1c98e8"
      } else {{ fg: "#1c98e8" }}
    }
    duration: "#bababa"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e8341c" attr: "b" }
      } else if $in < 6hr {
        "#e8341c"
      } else if $in < 1day {
        "#f2d42c"
      } else if $in < 3day {
        "#68c256"
      } else if $in < 1wk {
        { fg: "#68c256" attr: "b" }
      } else if $in < 6wk {
        "#1c98e8"
      } else if $in < 52wk {
        "#1c98e8"
      } else { "dark_gray" }
    }
    range: "#bababa"
    float: "#bababa"
    string: "#bababa"
    nothing: "#bababa"
    binary: "#bababa"
    cellpath: "#bababa"
    row_index: { fg: "#68c256" attr: "b" }
    record: "#bababa"
    list: "#bababa"
    block: "#bababa"
    hints: "dark_gray"

    shape_and: { fg: "#8e69c9" attr: "b" }
    shape_binary: { fg: "#8e69c9" attr: "b" }
    shape_block: { fg: "#1c98e8" attr: "b" }
    shape_bool: "#3d97e2"
    shape_custom: "#68c256"
    shape_datetime: { fg: "#1c98e8" attr: "b" }
    shape_directory: "#1c98e8"
    shape_external: "#1c98e8"
    shape_externalarg: { fg: "#68c256" attr: "b" }
    shape_filepath: "#1c98e8"
    shape_flag: { fg: "#1c98e8" attr: "b" }
    shape_float: { fg: "#8e69c9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1c98e8" attr: "b" }
    shape_int: { fg: "#8e69c9" attr: "b" }
    shape_internalcall: { fg: "#1c98e8" attr: "b" }
    shape_list: { fg: "#1c98e8" attr: "b" }
    shape_literal: "#1c98e8"
    shape_match_pattern: "#68c256"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3d97e2"
    shape_operator: "#f2d42c"
    shape_or: { fg: "#8e69c9" attr: "b" }
    shape_pipe: { fg: "#8e69c9" attr: "b" }
    shape_range: { fg: "#f2d42c" attr: "b" }
    shape_record: { fg: "#1c98e8" attr: "b" }
    shape_redirection: { fg: "#8e69c9" attr: "b" }
    shape_signature: { fg: "#68c256" attr: "b" }
    shape_string: "#68c256"
    shape_string_interpolation: { fg: "#1c98e8" attr: "b" }
    shape_table: { fg: "#1c98e8" attr: "b" }
    shape_variable: "#8e69c9"

    background: "#222324"
    foreground: "#bababa"
    cursor: "#bababa"
}}