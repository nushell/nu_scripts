export def main [] { return {
    separator: "#ba46b2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#3ba5ff" attr: "b" }
    empty: "#8ff586"
    bool: {|| if $in { "#6cbc67" } else { "light_gray" } }
    int: "#ba46b2"
    filesize: {|e|
      if $e == 0b {
        "#ba46b2"
      } else if $e < 1mb {
        "#8ff586"
      } else {{ fg: "#8ff586" }}
    }
    duration: "#ba46b2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff2320" attr: "b" }
      } else if $in < 6hr {
        "#ff2320"
      } else if $in < 1day {
        "#e9e75c"
      } else if $in < 3day {
        "#3ba5ff"
      } else if $in < 1wk {
        { fg: "#3ba5ff" attr: "b" }
      } else if $in < 6wk {
        "#8ff586"
      } else if $in < 52wk {
        "#8ff586"
      } else { "dark_gray" }
    }
    range: "#ba46b2"
    float: "#ba46b2"
    string: "#ba46b2"
    nothing: "#ba46b2"
    binary: "#ba46b2"
    cellpath: "#ba46b2"
    row_index: { fg: "#3ba5ff" attr: "b" }
    record: "#ba46b2"
    list: "#ba46b2"
    block: "#ba46b2"
    hints: "dark_gray"

    shape_and: { fg: "#781aa0" attr: "b" }
    shape_binary: { fg: "#781aa0" attr: "b" }
    shape_block: { fg: "#8ff586" attr: "b" }
    shape_bool: "#6cbc67"
    shape_custom: "#3ba5ff"
    shape_datetime: { fg: "#8ff586" attr: "b" }
    shape_directory: "#8ff586"
    shape_external: "#8ff586"
    shape_externalarg: { fg: "#3ba5ff" attr: "b" }
    shape_filepath: "#8ff586"
    shape_flag: { fg: "#8ff586" attr: "b" }
    shape_float: { fg: "#781aa0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8ff586" attr: "b" }
    shape_int: { fg: "#781aa0" attr: "b" }
    shape_internalcall: { fg: "#8ff586" attr: "b" }
    shape_list: { fg: "#8ff586" attr: "b" }
    shape_literal: "#8ff586"
    shape_match_pattern: "#3ba5ff"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#6cbc67"
    shape_operator: "#e9e75c"
    shape_or: { fg: "#781aa0" attr: "b" }
    shape_pipe: { fg: "#781aa0" attr: "b" }
    shape_range: { fg: "#e9e75c" attr: "b" }
    shape_record: { fg: "#8ff586" attr: "b" }
    shape_redirection: { fg: "#781aa0" attr: "b" }
    shape_signature: { fg: "#3ba5ff" attr: "b" }
    shape_string: "#3ba5ff"
    shape_string_interpolation: { fg: "#8ff586" attr: "b" }
    shape_table: { fg: "#8ff586" attr: "b" }
    shape_variable: "#781aa0"

    background: "#142838"
    foreground: "#8ff586"
    cursor: "#8ff586"
}}