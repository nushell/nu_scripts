export def main [] { return {
    separator: "#e5e9f0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a3be8c" attr: "b" }
    empty: "#81a1c1"
    bool: {|| if $in { "#88c0d0" } else { "light_gray" } }
    int: "#e5e9f0"
    filesize: {|e|
      if $e == 0b {
        "#e5e9f0"
      } else if $e < 1mb {
        "#88c0d0"
      } else {{ fg: "#81a1c1" }}
    }
    duration: "#e5e9f0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#bf616a" attr: "b" }
      } else if $in < 6hr {
        "#bf616a"
      } else if $in < 1day {
        "#ebcb8b"
      } else if $in < 3day {
        "#a3be8c"
      } else if $in < 1wk {
        { fg: "#a3be8c" attr: "b" }
      } else if $in < 6wk {
        "#88c0d0"
      } else if $in < 52wk {
        "#81a1c1"
      } else { "dark_gray" }
    }
    range: "#e5e9f0"
    float: "#e5e9f0"
    string: "#e5e9f0"
    nothing: "#e5e9f0"
    binary: "#e5e9f0"
    cellpath: "#e5e9f0"
    row_index: { fg: "#a3be8c" attr: "b" }
    record: "#e5e9f0"
    list: "#e5e9f0"
    block: "#e5e9f0"
    hints: "dark_gray"

    shape_and: { fg: "#b48ead" attr: "b" }
    shape_binary: { fg: "#b48ead" attr: "b" }
    shape_block: { fg: "#81a1c1" attr: "b" }
    shape_bool: "#88c0d0"
    shape_custom: "#a3be8c"
    shape_datetime: { fg: "#88c0d0" attr: "b" }
    shape_directory: "#88c0d0"
    shape_external: "#88c0d0"
    shape_externalarg: { fg: "#a3be8c" attr: "b" }
    shape_filepath: "#88c0d0"
    shape_flag: { fg: "#81a1c1" attr: "b" }
    shape_float: { fg: "#b48ead" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#88c0d0" attr: "b" }
    shape_int: { fg: "#b48ead" attr: "b" }
    shape_internalcall: { fg: "#88c0d0" attr: "b" }
    shape_list: { fg: "#88c0d0" attr: "b" }
    shape_literal: "#81a1c1"
    shape_match_pattern: "#a3be8c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#88c0d0"
    shape_operator: "#ebcb8b"
    shape_or: { fg: "#b48ead" attr: "b" }
    shape_pipe: { fg: "#b48ead" attr: "b" }
    shape_range: { fg: "#ebcb8b" attr: "b" }
    shape_record: { fg: "#88c0d0" attr: "b" }
    shape_redirection: { fg: "#b48ead" attr: "b" }
    shape_signature: { fg: "#a3be8c" attr: "b" }
    shape_string: "#a3be8c"
    shape_string_interpolation: { fg: "#88c0d0" attr: "b" }
    shape_table: { fg: "#81a1c1" attr: "b" }
    shape_variable: "#b48ead"

    background: "#2e3440"
    foreground: "#e5e9f0"
    cursor: "#e5e9f0"
}}