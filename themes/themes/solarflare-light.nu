export def main [] { return {
    separator: "#586875"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7cc844" attr: "b" }
    empty: "#33b5e1"
    bool: {|| if $in { "#52cbb0" } else { "light_gray" } }
    int: "#586875"
    filesize: {|e|
      if $e == 0b {
        "#586875"
      } else if $e < 1mb {
        "#52cbb0"
      } else {{ fg: "#33b5e1" }}
    }
    duration: "#586875"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ef5253" attr: "b" }
      } else if $in < 6hr {
        "#ef5253"
      } else if $in < 1day {
        "#e4b51c"
      } else if $in < 3day {
        "#7cc844"
      } else if $in < 1wk {
        { fg: "#7cc844" attr: "b" }
      } else if $in < 6wk {
        "#52cbb0"
      } else if $in < 52wk {
        "#33b5e1"
      } else { "dark_gray" }
    }
    range: "#586875"
    float: "#586875"
    string: "#586875"
    nothing: "#586875"
    binary: "#586875"
    cellpath: "#586875"
    row_index: { fg: "#7cc844" attr: "b" }
    record: "#586875"
    list: "#586875"
    block: "#586875"
    hints: "dark_gray"

    shape_and: { fg: "#a363d5" attr: "b" }
    shape_binary: { fg: "#a363d5" attr: "b" }
    shape_block: { fg: "#33b5e1" attr: "b" }
    shape_bool: "#52cbb0"
    shape_custom: "#7cc844"
    shape_datetime: { fg: "#52cbb0" attr: "b" }
    shape_directory: "#52cbb0"
    shape_external: "#52cbb0"
    shape_externalarg: { fg: "#7cc844" attr: "b" }
    shape_filepath: "#52cbb0"
    shape_flag: { fg: "#33b5e1" attr: "b" }
    shape_float: { fg: "#a363d5" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#52cbb0" attr: "b" }
    shape_int: { fg: "#a363d5" attr: "b" }
    shape_internalcall: { fg: "#52cbb0" attr: "b" }
    shape_list: { fg: "#52cbb0" attr: "b" }
    shape_literal: "#33b5e1"
    shape_match_pattern: "#7cc844"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#52cbb0"
    shape_operator: "#e4b51c"
    shape_or: { fg: "#a363d5" attr: "b" }
    shape_pipe: { fg: "#a363d5" attr: "b" }
    shape_range: { fg: "#e4b51c" attr: "b" }
    shape_record: { fg: "#52cbb0" attr: "b" }
    shape_redirection: { fg: "#a363d5" attr: "b" }
    shape_signature: { fg: "#7cc844" attr: "b" }
    shape_string: "#7cc844"
    shape_string_interpolation: { fg: "#52cbb0" attr: "b" }
    shape_table: { fg: "#33b5e1" attr: "b" }
    shape_variable: "#a363d5"

    background: "#f5f7fa"
    foreground: "#586875"
    cursor: "#586875"
}}