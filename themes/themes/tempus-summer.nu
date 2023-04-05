export def main [] { return {
    separator: "#919ab9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#4eac6d" attr: "b" }
    empty: "#609fda"
    bool: {|| if $in { "#2aa9b6" } else { "light_gray" } }
    int: "#919ab9"
    filesize: {|e|
      if $e == 0b {
        "#919ab9"
      } else if $e < 1mb {
        "#3dab95"
      } else {{ fg: "#609fda" }}
    }
    duration: "#919ab9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f76f6e" attr: "b" }
      } else if $in < 6hr {
        "#f76f6e"
      } else if $in < 1day {
        "#af9a0a"
      } else if $in < 3day {
        "#4eac6d"
      } else if $in < 1wk {
        { fg: "#4eac6d" attr: "b" }
      } else if $in < 6wk {
        "#3dab95"
      } else if $in < 52wk {
        "#609fda"
      } else { "dark_gray" }
    }
    range: "#919ab9"
    float: "#919ab9"
    string: "#919ab9"
    nothing: "#919ab9"
    binary: "#919ab9"
    cellpath: "#919ab9"
    row_index: { fg: "#4eac6d" attr: "b" }
    record: "#919ab9"
    list: "#919ab9"
    block: "#919ab9"
    hints: "dark_gray"

    shape_and: { fg: "#cc84ad" attr: "b" }
    shape_binary: { fg: "#cc84ad" attr: "b" }
    shape_block: { fg: "#609fda" attr: "b" }
    shape_bool: "#2aa9b6"
    shape_custom: "#4eac6d"
    shape_datetime: { fg: "#3dab95" attr: "b" }
    shape_directory: "#3dab95"
    shape_external: "#3dab95"
    shape_externalarg: { fg: "#4eac6d" attr: "b" }
    shape_filepath: "#3dab95"
    shape_flag: { fg: "#609fda" attr: "b" }
    shape_float: { fg: "#cc84ad" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3dab95" attr: "b" }
    shape_int: { fg: "#cc84ad" attr: "b" }
    shape_internalcall: { fg: "#3dab95" attr: "b" }
    shape_list: { fg: "#3dab95" attr: "b" }
    shape_literal: "#609fda"
    shape_match_pattern: "#4eac6d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2aa9b6"
    shape_operator: "#af9a0a"
    shape_or: { fg: "#cc84ad" attr: "b" }
    shape_pipe: { fg: "#cc84ad" attr: "b" }
    shape_range: { fg: "#af9a0a" attr: "b" }
    shape_record: { fg: "#3dab95" attr: "b" }
    shape_redirection: { fg: "#cc84ad" attr: "b" }
    shape_signature: { fg: "#4eac6d" attr: "b" }
    shape_string: "#4eac6d"
    shape_string_interpolation: { fg: "#3dab95" attr: "b" }
    shape_table: { fg: "#609fda" attr: "b" }
    shape_variable: "#cc84ad"

    background: "#202c3d"
    foreground: "#a0abae"
    cursor: "#a0abae"
}}