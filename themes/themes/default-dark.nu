export def main [] { return {
    separator: "#d8d8d8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a1b56c" attr: "b" }
    empty: "#7cafc2"
    bool: {|| if $in { "#86c1b9" } else { "light_gray" } }
    int: "#d8d8d8"
    filesize: {|e|
      if $e == 0b {
        "#d8d8d8"
      } else if $e < 1mb {
        "#86c1b9"
      } else {{ fg: "#7cafc2" }}
    }
    duration: "#d8d8d8"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ab4642" attr: "b" }
      } else if $in < 6hr {
        "#ab4642"
      } else if $in < 1day {
        "#f7ca88"
      } else if $in < 3day {
        "#a1b56c"
      } else if $in < 1wk {
        { fg: "#a1b56c" attr: "b" }
      } else if $in < 6wk {
        "#86c1b9"
      } else if $in < 52wk {
        "#7cafc2"
      } else { "dark_gray" }
    }
    range: "#d8d8d8"
    float: "#d8d8d8"
    string: "#d8d8d8"
    nothing: "#d8d8d8"
    binary: "#d8d8d8"
    cellpath: "#d8d8d8"
    row_index: { fg: "#a1b56c" attr: "b" }
    record: "#d8d8d8"
    list: "#d8d8d8"
    block: "#d8d8d8"
    hints: "dark_gray"

    shape_and: { fg: "#ba8baf" attr: "b" }
    shape_binary: { fg: "#ba8baf" attr: "b" }
    shape_block: { fg: "#7cafc2" attr: "b" }
    shape_bool: "#86c1b9"
    shape_custom: "#a1b56c"
    shape_datetime: { fg: "#86c1b9" attr: "b" }
    shape_directory: "#86c1b9"
    shape_external: "#86c1b9"
    shape_externalarg: { fg: "#a1b56c" attr: "b" }
    shape_filepath: "#86c1b9"
    shape_flag: { fg: "#7cafc2" attr: "b" }
    shape_float: { fg: "#ba8baf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#86c1b9" attr: "b" }
    shape_int: { fg: "#ba8baf" attr: "b" }
    shape_internalcall: { fg: "#86c1b9" attr: "b" }
    shape_list: { fg: "#86c1b9" attr: "b" }
    shape_literal: "#7cafc2"
    shape_match_pattern: "#a1b56c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#86c1b9"
    shape_operator: "#f7ca88"
    shape_or: { fg: "#ba8baf" attr: "b" }
    shape_pipe: { fg: "#ba8baf" attr: "b" }
    shape_range: { fg: "#f7ca88" attr: "b" }
    shape_record: { fg: "#86c1b9" attr: "b" }
    shape_redirection: { fg: "#ba8baf" attr: "b" }
    shape_signature: { fg: "#a1b56c" attr: "b" }
    shape_string: "#a1b56c"
    shape_string_interpolation: { fg: "#86c1b9" attr: "b" }
    shape_table: { fg: "#7cafc2" attr: "b" }
    shape_variable: "#ba8baf"

    background: "#181818"
    foreground: "#d8d8d8"
    cursor: "#d8d8d8"
}}