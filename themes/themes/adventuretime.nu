export def main [] { return {
    separator: "#f8dcc0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4ab118" attr: "b" }
    empty: "#0f4ac6"
    bool: {|| if $in { "#c8faf4" } else { "light_gray" } }
    int: "#f8dcc0"
    filesize: {|e|
      if $e == 0b {
        "#f8dcc0"
      } else if $e < 1mb {
        "#70a598"
      } else {{ fg: "#0f4ac6" }}
    }
    duration: "#f8dcc0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#bd0013" attr: "b" }
      } else if $in < 6hr {
        "#bd0013"
      } else if $in < 1day {
        "#e7741e"
      } else if $in < 3day {
        "#4ab118"
      } else if $in < 1wk {
        { fg: "#4ab118" attr: "b" }
      } else if $in < 6wk {
        "#70a598"
      } else if $in < 52wk {
        "#0f4ac6"
      } else { "dark_gray" }
    }
    range: "#f8dcc0"
    float: "#f8dcc0"
    string: "#f8dcc0"
    nothing: "#f8dcc0"
    binary: "#f8dcc0"
    cellpath: "#f8dcc0"
    row_index: { fg: "#4ab118" attr: "b" }
    record: "#f8dcc0"
    list: "#f8dcc0"
    block: "#f8dcc0"
    hints: "dark_gray"

    shape_and: { fg: "#665993" attr: "b" }
    shape_binary: { fg: "#665993" attr: "b" }
    shape_block: { fg: "#0f4ac6" attr: "b" }
    shape_bool: "#c8faf4"
    shape_custom: "#4ab118"
    shape_datetime: { fg: "#70a598" attr: "b" }
    shape_directory: "#70a598"
    shape_external: "#70a598"
    shape_externalarg: { fg: "#4ab118" attr: "b" }
    shape_filepath: "#70a598"
    shape_flag: { fg: "#0f4ac6" attr: "b" }
    shape_float: { fg: "#665993" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#70a598" attr: "b" }
    shape_int: { fg: "#665993" attr: "b" }
    shape_internalcall: { fg: "#70a598" attr: "b" }
    shape_list: { fg: "#70a598" attr: "b" }
    shape_literal: "#0f4ac6"
    shape_match_pattern: "#4ab118"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c8faf4"
    shape_operator: "#e7741e"
    shape_or: { fg: "#665993" attr: "b" }
    shape_pipe: { fg: "#665993" attr: "b" }
    shape_range: { fg: "#e7741e" attr: "b" }
    shape_record: { fg: "#70a598" attr: "b" }
    shape_redirection: { fg: "#665993" attr: "b" }
    shape_signature: { fg: "#4ab118" attr: "b" }
    shape_string: "#4ab118"
    shape_string_interpolation: { fg: "#70a598" attr: "b" }
    shape_table: { fg: "#0f4ac6" attr: "b" }
    shape_variable: "#665993"

    background: "#1f1d45"
    foreground: "#f8dcc0"
    cursor: "#f8dcc0"
}}