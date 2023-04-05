export def main [] { return {
    separator: "#87799c"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#37a415" attr: "b" }
    empty: "#564d9b"
    bool: {|| if $in { "#eaeaea" } else { "light_gray" } }
    int: "#87799c"
    filesize: {|e|
      if $e == 0b {
        "#87799c"
      } else if $e < 1mb {
        "#808080"
      } else {{ fg: "#564d9b" }}
    }
    duration: "#87799c"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b0425b" attr: "b" }
      } else if $in < 6hr {
        "#b0425b"
      } else if $in < 1day {
        "#ad5c42"
      } else if $in < 3day {
        "#37a415"
      } else if $in < 1wk {
        { fg: "#37a415" attr: "b" }
      } else if $in < 6wk {
        "#808080"
      } else if $in < 52wk {
        "#564d9b"
      } else { "dark_gray" }
    }
    range: "#87799c"
    float: "#87799c"
    string: "#87799c"
    nothing: "#87799c"
    binary: "#87799c"
    cellpath: "#87799c"
    row_index: { fg: "#37a415" attr: "b" }
    record: "#87799c"
    list: "#87799c"
    block: "#87799c"
    hints: "dark_gray"

    shape_and: { fg: "#6c3ca1" attr: "b" }
    shape_binary: { fg: "#6c3ca1" attr: "b" }
    shape_block: { fg: "#564d9b" attr: "b" }
    shape_bool: "#eaeaea"
    shape_custom: "#37a415"
    shape_datetime: { fg: "#808080" attr: "b" }
    shape_directory: "#808080"
    shape_external: "#808080"
    shape_externalarg: { fg: "#37a415" attr: "b" }
    shape_filepath: "#808080"
    shape_flag: { fg: "#564d9b" attr: "b" }
    shape_float: { fg: "#6c3ca1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#808080" attr: "b" }
    shape_int: { fg: "#6c3ca1" attr: "b" }
    shape_internalcall: { fg: "#808080" attr: "b" }
    shape_list: { fg: "#808080" attr: "b" }
    shape_literal: "#564d9b"
    shape_match_pattern: "#37a415"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#eaeaea"
    shape_operator: "#ad5c42"
    shape_or: { fg: "#6c3ca1" attr: "b" }
    shape_pipe: { fg: "#6c3ca1" attr: "b" }
    shape_range: { fg: "#ad5c42" attr: "b" }
    shape_record: { fg: "#808080" attr: "b" }
    shape_redirection: { fg: "#6c3ca1" attr: "b" }
    shape_signature: { fg: "#37a415" attr: "b" }
    shape_string: "#37a415"
    shape_string_interpolation: { fg: "#808080" attr: "b" }
    shape_table: { fg: "#564d9b" attr: "b" }
    shape_variable: "#6c3ca1"

    background: "#1b1b23"
    foreground: "#877a9b"
    cursor: "#877a9b"
}}