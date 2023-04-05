export def main [] { return {
    separator: "#fffefe"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b9ca49" attr: "b" }
    empty: "#79a6da"
    bool: {|| if $in { "#70c0b1" } else { "light_gray" } }
    int: "#fffefe"
    filesize: {|e|
      if $e == 0b {
        "#fffefe"
      } else if $e < 1mb {
        "#70c0b1"
      } else {{ fg: "#79a6da" }}
    }
    duration: "#fffefe"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d54e53" attr: "b" }
      } else if $in < 6hr {
        "#d54e53"
      } else if $in < 1day {
        "#e7c547"
      } else if $in < 3day {
        "#b9ca49"
      } else if $in < 1wk {
        { fg: "#b9ca49" attr: "b" }
      } else if $in < 6wk {
        "#70c0b1"
      } else if $in < 52wk {
        "#79a6da"
      } else { "dark_gray" }
    }
    range: "#fffefe"
    float: "#fffefe"
    string: "#fffefe"
    nothing: "#fffefe"
    binary: "#fffefe"
    cellpath: "#fffefe"
    row_index: { fg: "#b9ca49" attr: "b" }
    record: "#fffefe"
    list: "#fffefe"
    block: "#fffefe"
    hints: "dark_gray"

    shape_and: { fg: "#c397d8" attr: "b" }
    shape_binary: { fg: "#c397d8" attr: "b" }
    shape_block: { fg: "#79a6da" attr: "b" }
    shape_bool: "#70c0b1"
    shape_custom: "#b9ca49"
    shape_datetime: { fg: "#70c0b1" attr: "b" }
    shape_directory: "#70c0b1"
    shape_external: "#70c0b1"
    shape_externalarg: { fg: "#b9ca49" attr: "b" }
    shape_filepath: "#70c0b1"
    shape_flag: { fg: "#79a6da" attr: "b" }
    shape_float: { fg: "#c397d8" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#70c0b1" attr: "b" }
    shape_int: { fg: "#c397d8" attr: "b" }
    shape_internalcall: { fg: "#70c0b1" attr: "b" }
    shape_list: { fg: "#70c0b1" attr: "b" }
    shape_literal: "#79a6da"
    shape_match_pattern: "#b9ca49"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#70c0b1"
    shape_operator: "#e7c547"
    shape_or: { fg: "#c397d8" attr: "b" }
    shape_pipe: { fg: "#c397d8" attr: "b" }
    shape_range: { fg: "#e7c547" attr: "b" }
    shape_record: { fg: "#70c0b1" attr: "b" }
    shape_redirection: { fg: "#c397d8" attr: "b" }
    shape_signature: { fg: "#b9ca49" attr: "b" }
    shape_string: "#b9ca49"
    shape_string_interpolation: { fg: "#70c0b1" attr: "b" }
    shape_table: { fg: "#79a6da" attr: "b" }
    shape_variable: "#c397d8"

    background: "#000000"
    foreground: "#e9e9e9"
    cursor: "#e9e9e9"
}}