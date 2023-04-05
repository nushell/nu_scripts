export def main [] { return {
    separator: "#524966"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#23801c" attr: "b" }
    empty: "#6580b0"
    bool: {|| if $in { "#acd4eb" } else { "light_gray" } }
    int: "#524966"
    filesize: {|e|
      if $e == 0b {
        "#524966"
      } else if $e < 1mb {
        "#8aaabe"
      } else {{ fg: "#6580b0" }}
    }
    duration: "#524966"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#91284c" attr: "b" }
      } else if $in < 6hr {
        "#91284c"
      } else if $in < 1day {
        "#b49d27"
      } else if $in < 3day {
        "#23801c"
      } else if $in < 1wk {
        { fg: "#23801c" attr: "b" }
      } else if $in < 6wk {
        "#8aaabe"
      } else if $in < 52wk {
        "#6580b0"
      } else { "dark_gray" }
    }
    range: "#524966"
    float: "#524966"
    string: "#524966"
    nothing: "#524966"
    binary: "#524966"
    cellpath: "#524966"
    row_index: { fg: "#23801c" attr: "b" }
    record: "#524966"
    list: "#524966"
    block: "#524966"
    hints: "dark_gray"

    shape_and: { fg: "#674d96" attr: "b" }
    shape_binary: { fg: "#674d96" attr: "b" }
    shape_block: { fg: "#6580b0" attr: "b" }
    shape_bool: "#acd4eb"
    shape_custom: "#23801c"
    shape_datetime: { fg: "#8aaabe" attr: "b" }
    shape_directory: "#8aaabe"
    shape_external: "#8aaabe"
    shape_externalarg: { fg: "#23801c" attr: "b" }
    shape_filepath: "#8aaabe"
    shape_flag: { fg: "#6580b0" attr: "b" }
    shape_float: { fg: "#674d96" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8aaabe" attr: "b" }
    shape_int: { fg: "#674d96" attr: "b" }
    shape_internalcall: { fg: "#8aaabe" attr: "b" }
    shape_list: { fg: "#8aaabe" attr: "b" }
    shape_literal: "#6580b0"
    shape_match_pattern: "#23801c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#acd4eb"
    shape_operator: "#b49d27"
    shape_or: { fg: "#674d96" attr: "b" }
    shape_pipe: { fg: "#674d96" attr: "b" }
    shape_range: { fg: "#b49d27" attr: "b" }
    shape_record: { fg: "#8aaabe" attr: "b" }
    shape_redirection: { fg: "#674d96" attr: "b" }
    shape_signature: { fg: "#23801c" attr: "b" }
    shape_string: "#23801c"
    shape_string_interpolation: { fg: "#8aaabe" attr: "b" }
    shape_table: { fg: "#6580b0" attr: "b" }
    shape_variable: "#674d96"

    background: "#100815"
    foreground: "#514968"
    cursor: "#514968"
}}