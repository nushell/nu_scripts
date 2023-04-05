export def main [] { return {
    separator: "#e0e0e0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7e807e" attr: "b" }
    empty: "#16a085"
    bool: {|| if $in { "#00d1d1" } else { "light_gray" } }
    int: "#e0e0e0"
    filesize: {|e|
      if $e == 0b {
        "#e0e0e0"
      } else if $e < 1mb {
        "#00cccc"
      } else {{ fg: "#16a085" }}
    }
    duration: "#e0e0e0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ba2922" attr: "b" }
      } else if $in < 6hr {
        "#ba2922"
      } else if $in < 1day {
        "#4c4f4d"
      } else if $in < 3day {
        "#7e807e"
      } else if $in < 1wk {
        { fg: "#7e807e" attr: "b" }
      } else if $in < 6wk {
        "#00cccc"
      } else if $in < 52wk {
        "#16a085"
      } else { "dark_gray" }
    }
    range: "#e0e0e0"
    float: "#e0e0e0"
    string: "#e0e0e0"
    nothing: "#e0e0e0"
    binary: "#e0e0e0"
    cellpath: "#e0e0e0"
    row_index: { fg: "#7e807e" attr: "b" }
    record: "#e0e0e0"
    list: "#e0e0e0"
    block: "#e0e0e0"
    hints: "dark_gray"

    shape_and: { fg: "#43746a" attr: "b" }
    shape_binary: { fg: "#43746a" attr: "b" }
    shape_block: { fg: "#16a085" attr: "b" }
    shape_bool: "#00d1d1"
    shape_custom: "#7e807e"
    shape_datetime: { fg: "#00cccc" attr: "b" }
    shape_directory: "#00cccc"
    shape_external: "#00cccc"
    shape_externalarg: { fg: "#7e807e" attr: "b" }
    shape_filepath: "#00cccc"
    shape_flag: { fg: "#16a085" attr: "b" }
    shape_float: { fg: "#43746a" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00cccc" attr: "b" }
    shape_int: { fg: "#43746a" attr: "b" }
    shape_internalcall: { fg: "#00cccc" attr: "b" }
    shape_list: { fg: "#00cccc" attr: "b" }
    shape_literal: "#16a085"
    shape_match_pattern: "#7e807e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00d1d1"
    shape_operator: "#4c4f4d"
    shape_or: { fg: "#43746a" attr: "b" }
    shape_pipe: { fg: "#43746a" attr: "b" }
    shape_range: { fg: "#4c4f4d" attr: "b" }
    shape_record: { fg: "#00cccc" attr: "b" }
    shape_redirection: { fg: "#43746a" attr: "b" }
    shape_signature: { fg: "#7e807e" attr: "b" }
    shape_string: "#7e807e"
    shape_string_interpolation: { fg: "#00cccc" attr: "b" }
    shape_table: { fg: "#16a085" attr: "b" }
    shape_variable: "#43746a"

    background: "#272827"
    foreground: "#fdf6e3"
    cursor: "#16a085"
}}