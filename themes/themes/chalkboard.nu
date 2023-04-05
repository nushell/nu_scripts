export def main [] { return {
    separator: "#d9d9d9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#72c373" attr: "b" }
    empty: "#7372c3"
    bool: {|| if $in { "#aadadb" } else { "light_gray" } }
    int: "#d9d9d9"
    filesize: {|e|
      if $e == 0b {
        "#d9d9d9"
      } else if $e < 1mb {
        "#72c2c3"
      } else {{ fg: "#7372c3" }}
    }
    duration: "#d9d9d9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c37372" attr: "b" }
      } else if $in < 6hr {
        "#c37372"
      } else if $in < 1day {
        "#c2c372"
      } else if $in < 3day {
        "#72c373"
      } else if $in < 1wk {
        { fg: "#72c373" attr: "b" }
      } else if $in < 6wk {
        "#72c2c3"
      } else if $in < 52wk {
        "#7372c3"
      } else { "dark_gray" }
    }
    range: "#d9d9d9"
    float: "#d9d9d9"
    string: "#d9d9d9"
    nothing: "#d9d9d9"
    binary: "#d9d9d9"
    cellpath: "#d9d9d9"
    row_index: { fg: "#72c373" attr: "b" }
    record: "#d9d9d9"
    list: "#d9d9d9"
    block: "#d9d9d9"
    hints: "dark_gray"

    shape_and: { fg: "#c372c2" attr: "b" }
    shape_binary: { fg: "#c372c2" attr: "b" }
    shape_block: { fg: "#7372c3" attr: "b" }
    shape_bool: "#aadadb"
    shape_custom: "#72c373"
    shape_datetime: { fg: "#72c2c3" attr: "b" }
    shape_directory: "#72c2c3"
    shape_external: "#72c2c3"
    shape_externalarg: { fg: "#72c373" attr: "b" }
    shape_filepath: "#72c2c3"
    shape_flag: { fg: "#7372c3" attr: "b" }
    shape_float: { fg: "#c372c2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#72c2c3" attr: "b" }
    shape_int: { fg: "#c372c2" attr: "b" }
    shape_internalcall: { fg: "#72c2c3" attr: "b" }
    shape_list: { fg: "#72c2c3" attr: "b" }
    shape_literal: "#7372c3"
    shape_match_pattern: "#72c373"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#aadadb"
    shape_operator: "#c2c372"
    shape_or: { fg: "#c372c2" attr: "b" }
    shape_pipe: { fg: "#c372c2" attr: "b" }
    shape_range: { fg: "#c2c372" attr: "b" }
    shape_record: { fg: "#72c2c3" attr: "b" }
    shape_redirection: { fg: "#c372c2" attr: "b" }
    shape_signature: { fg: "#72c373" attr: "b" }
    shape_string: "#72c373"
    shape_string_interpolation: { fg: "#72c2c3" attr: "b" }
    shape_table: { fg: "#7372c3" attr: "b" }
    shape_variable: "#c372c2"

    background: "#29262f"
    foreground: "#d9e6f2"
    cursor: "#d9e6f2"
}}