export def main [] { return {
    separator: "#00ccff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00ccff" attr: "b" }
    empty: "#00ccff"
    bool: {|| if $in { "#00ccff" } else { "light_gray" } }
    int: "#00ccff"
    filesize: {|e|
      if $e == 0b {
        "#00ccff"
      } else if $e < 1mb {
        "#00ccff"
      } else {{ fg: "#00ccff" }}
    }
    duration: "#00ccff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#00ccff" attr: "b" }
      } else if $in < 6hr {
        "#00ccff"
      } else if $in < 1day {
        "#00ccff"
      } else if $in < 3day {
        "#00ccff"
      } else if $in < 1wk {
        { fg: "#00ccff" attr: "b" }
      } else if $in < 6wk {
        "#00ccff"
      } else if $in < 52wk {
        "#00ccff"
      } else { "dark_gray" }
    }
    range: "#00ccff"
    float: "#00ccff"
    string: "#00ccff"
    nothing: "#00ccff"
    binary: "#00ccff"
    cellpath: "#00ccff"
    row_index: { fg: "#00ccff" attr: "b" }
    record: "#00ccff"
    list: "#00ccff"
    block: "#00ccff"
    hints: "dark_gray"

    shape_and: { fg: "#00ccff" attr: "b" }
    shape_binary: { fg: "#00ccff" attr: "b" }
    shape_block: { fg: "#00ccff" attr: "b" }
    shape_bool: "#00ccff"
    shape_custom: "#00ccff"
    shape_datetime: { fg: "#00ccff" attr: "b" }
    shape_directory: "#00ccff"
    shape_external: "#00ccff"
    shape_externalarg: { fg: "#00ccff" attr: "b" }
    shape_filepath: "#00ccff"
    shape_flag: { fg: "#00ccff" attr: "b" }
    shape_float: { fg: "#00ccff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00ccff" attr: "b" }
    shape_int: { fg: "#00ccff" attr: "b" }
    shape_internalcall: { fg: "#00ccff" attr: "b" }
    shape_list: { fg: "#00ccff" attr: "b" }
    shape_literal: "#00ccff"
    shape_match_pattern: "#00ccff"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00ccff"
    shape_operator: "#00ccff"
    shape_or: { fg: "#00ccff" attr: "b" }
    shape_pipe: { fg: "#00ccff" attr: "b" }
    shape_range: { fg: "#00ccff" attr: "b" }
    shape_record: { fg: "#00ccff" attr: "b" }
    shape_redirection: { fg: "#00ccff" attr: "b" }
    shape_signature: { fg: "#00ccff" attr: "b" }
    shape_string: "#00ccff"
    shape_string_interpolation: { fg: "#00ccff" attr: "b" }
    shape_table: { fg: "#00ccff" attr: "b" }
    shape_variable: "#00ccff"

    background: "#00222b"
    foreground: "#00ccff"
    cursor: "#00ccff"
}}