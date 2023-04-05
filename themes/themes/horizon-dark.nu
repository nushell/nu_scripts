export def main [] { return {
    separator: "#cbced0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#efaf8e" attr: "b" }
    empty: "#df5273"
    bool: {|| if $in { "#24a8b4" } else { "light_gray" } }
    int: "#cbced0"
    filesize: {|e|
      if $e == 0b {
        "#cbced0"
      } else if $e < 1mb {
        "#24a8b4"
      } else {{ fg: "#df5273" }}
    }
    duration: "#cbced0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e93c58" attr: "b" }
      } else if $in < 6hr {
        "#e93c58"
      } else if $in < 1day {
        "#efb993"
      } else if $in < 3day {
        "#efaf8e"
      } else if $in < 1wk {
        { fg: "#efaf8e" attr: "b" }
      } else if $in < 6wk {
        "#24a8b4"
      } else if $in < 52wk {
        "#df5273"
      } else { "dark_gray" }
    }
    range: "#cbced0"
    float: "#cbced0"
    string: "#cbced0"
    nothing: "#cbced0"
    binary: "#cbced0"
    cellpath: "#cbced0"
    row_index: { fg: "#efaf8e" attr: "b" }
    record: "#cbced0"
    list: "#cbced0"
    block: "#cbced0"
    hints: "dark_gray"

    shape_and: { fg: "#b072d1" attr: "b" }
    shape_binary: { fg: "#b072d1" attr: "b" }
    shape_block: { fg: "#df5273" attr: "b" }
    shape_bool: "#24a8b4"
    shape_custom: "#efaf8e"
    shape_datetime: { fg: "#24a8b4" attr: "b" }
    shape_directory: "#24a8b4"
    shape_external: "#24a8b4"
    shape_externalarg: { fg: "#efaf8e" attr: "b" }
    shape_filepath: "#24a8b4"
    shape_flag: { fg: "#df5273" attr: "b" }
    shape_float: { fg: "#b072d1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#24a8b4" attr: "b" }
    shape_int: { fg: "#b072d1" attr: "b" }
    shape_internalcall: { fg: "#24a8b4" attr: "b" }
    shape_list: { fg: "#24a8b4" attr: "b" }
    shape_literal: "#df5273"
    shape_match_pattern: "#efaf8e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#24a8b4"
    shape_operator: "#efb993"
    shape_or: { fg: "#b072d1" attr: "b" }
    shape_pipe: { fg: "#b072d1" attr: "b" }
    shape_range: { fg: "#efb993" attr: "b" }
    shape_record: { fg: "#24a8b4" attr: "b" }
    shape_redirection: { fg: "#b072d1" attr: "b" }
    shape_signature: { fg: "#efaf8e" attr: "b" }
    shape_string: "#efaf8e"
    shape_string_interpolation: { fg: "#24a8b4" attr: "b" }
    shape_table: { fg: "#df5273" attr: "b" }
    shape_variable: "#b072d1"

    background: "#1c1e26"
    foreground: "#cbced0"
    cursor: "#cbced0"
}}