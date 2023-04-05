export def main [] { return {
    separator: "#dfddc8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8da101" attr: "b" }
    empty: "#3a94c5"
    bool: {|| if $in { "#35a77c" } else { "light_gray" } }
    int: "#dfddc8"
    filesize: {|e|
      if $e == 0b {
        "#dfddc8"
      } else if $e < 1mb {
        "#35a77c"
      } else {{ fg: "#3a94c5" }}
    }
    duration: "#dfddc8"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f85552" attr: "b" }
      } else if $in < 6hr {
        "#f85552"
      } else if $in < 1day {
        "#dfa000"
      } else if $in < 3day {
        "#8da101"
      } else if $in < 1wk {
        { fg: "#8da101" attr: "b" }
      } else if $in < 6wk {
        "#35a77c"
      } else if $in < 52wk {
        "#3a94c5"
      } else { "dark_gray" }
    }
    range: "#dfddc8"
    float: "#dfddc8"
    string: "#dfddc8"
    nothing: "#dfddc8"
    binary: "#dfddc8"
    cellpath: "#dfddc8"
    row_index: { fg: "#8da101" attr: "b" }
    record: "#dfddc8"
    list: "#dfddc8"
    block: "#dfddc8"
    hints: "dark_gray"

    shape_and: { fg: "#df69ba" attr: "b" }
    shape_binary: { fg: "#df69ba" attr: "b" }
    shape_block: { fg: "#3a94c5" attr: "b" }
    shape_bool: "#35a77c"
    shape_custom: "#8da101"
    shape_datetime: { fg: "#35a77c" attr: "b" }
    shape_directory: "#35a77c"
    shape_external: "#35a77c"
    shape_externalarg: { fg: "#8da101" attr: "b" }
    shape_filepath: "#35a77c"
    shape_flag: { fg: "#3a94c5" attr: "b" }
    shape_float: { fg: "#df69ba" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#35a77c" attr: "b" }
    shape_int: { fg: "#df69ba" attr: "b" }
    shape_internalcall: { fg: "#35a77c" attr: "b" }
    shape_list: { fg: "#35a77c" attr: "b" }
    shape_literal: "#3a94c5"
    shape_match_pattern: "#8da101"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#35a77c"
    shape_operator: "#dfa000"
    shape_or: { fg: "#df69ba" attr: "b" }
    shape_pipe: { fg: "#df69ba" attr: "b" }
    shape_range: { fg: "#dfa000" attr: "b" }
    shape_record: { fg: "#35a77c" attr: "b" }
    shape_redirection: { fg: "#df69ba" attr: "b" }
    shape_signature: { fg: "#8da101" attr: "b" }
    shape_string: "#8da101"
    shape_string_interpolation: { fg: "#35a77c" attr: "b" }
    shape_table: { fg: "#3a94c5" attr: "b" }
    shape_variable: "#df69ba"

    background: "#f8f0dc"
    foreground: "#5c6a72"
    cursor: "#5c6a72"
}}