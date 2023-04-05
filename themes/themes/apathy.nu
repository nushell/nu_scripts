export def main [] { return {
    separator: "#81b5ac"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#883e96" attr: "b" }
    empty: "#96883e"
    bool: {|| if $in { "#963e4c" } else { "light_gray" } }
    int: "#81b5ac"
    filesize: {|e|
      if $e == 0b {
        "#81b5ac"
      } else if $e < 1mb {
        "#963e4c"
      } else {{ fg: "#96883e" }}
    }
    duration: "#81b5ac"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#3e9688" attr: "b" }
      } else if $in < 6hr {
        "#3e9688"
      } else if $in < 1day {
        "#3e4c96"
      } else if $in < 3day {
        "#883e96"
      } else if $in < 1wk {
        { fg: "#883e96" attr: "b" }
      } else if $in < 6wk {
        "#963e4c"
      } else if $in < 52wk {
        "#96883e"
      } else { "dark_gray" }
    }
    range: "#81b5ac"
    float: "#81b5ac"
    string: "#81b5ac"
    nothing: "#81b5ac"
    binary: "#81b5ac"
    cellpath: "#81b5ac"
    row_index: { fg: "#883e96" attr: "b" }
    record: "#81b5ac"
    list: "#81b5ac"
    block: "#81b5ac"
    hints: "dark_gray"

    shape_and: { fg: "#4c963e" attr: "b" }
    shape_binary: { fg: "#4c963e" attr: "b" }
    shape_block: { fg: "#96883e" attr: "b" }
    shape_bool: "#963e4c"
    shape_custom: "#883e96"
    shape_datetime: { fg: "#963e4c" attr: "b" }
    shape_directory: "#963e4c"
    shape_external: "#963e4c"
    shape_externalarg: { fg: "#883e96" attr: "b" }
    shape_filepath: "#963e4c"
    shape_flag: { fg: "#96883e" attr: "b" }
    shape_float: { fg: "#4c963e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#963e4c" attr: "b" }
    shape_int: { fg: "#4c963e" attr: "b" }
    shape_internalcall: { fg: "#963e4c" attr: "b" }
    shape_list: { fg: "#963e4c" attr: "b" }
    shape_literal: "#96883e"
    shape_match_pattern: "#883e96"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#963e4c"
    shape_operator: "#3e4c96"
    shape_or: { fg: "#4c963e" attr: "b" }
    shape_pipe: { fg: "#4c963e" attr: "b" }
    shape_range: { fg: "#3e4c96" attr: "b" }
    shape_record: { fg: "#963e4c" attr: "b" }
    shape_redirection: { fg: "#4c963e" attr: "b" }
    shape_signature: { fg: "#883e96" attr: "b" }
    shape_string: "#883e96"
    shape_string_interpolation: { fg: "#963e4c" attr: "b" }
    shape_table: { fg: "#96883e" attr: "b" }
    shape_variable: "#4c963e"

    background: "#031a16"
    foreground: "#81b5ac"
    cursor: "#81b5ac"
}}