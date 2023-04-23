export def main [] { return {
    separator: "#dedcdf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#c6914b" attr: "b" }
    empty: "#8e7dc6"
    bool: {|| if $in { "#7263aa" } else { "light_gray" } }
    int: "#dedcdf"
    filesize: {|e|
      if $e == 0b {
        "#dedcdf"
      } else if $e < 1mb {
        "#7263aa"
      } else {{ fg: "#8e7dc6" }}
    }
    duration: "#dedcdf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#a92258" attr: "b" }
      } else if $in < 6hr {
        "#a92258"
      } else if $in < 1day {
        "#804ead"
      } else if $in < 3day {
        "#c6914b"
      } else if $in < 1wk {
        { fg: "#c6914b" attr: "b" }
      } else if $in < 6wk {
        "#7263aa"
      } else if $in < 52wk {
        "#8e7dc6"
      } else { "dark_gray" }
    }
    range: "#dedcdf"
    float: "#dedcdf"
    string: "#dedcdf"
    nothing: "#dedcdf"
    binary: "#dedcdf"
    cellpath: "#dedcdf"
    row_index: { fg: "#c6914b" attr: "b" }
    record: "#dedcdf"
    list: "#dedcdf"
    block: "#dedcdf"
    hints: "dark_gray"

    shape_and: { fg: "#953b9d" attr: "b" }
    shape_binary: { fg: "#953b9d" attr: "b" }
    shape_block: { fg: "#8e7dc6" attr: "b" }
    shape_bool: "#7263aa"
    shape_custom: "#c6914b"
    shape_datetime: { fg: "#7263aa" attr: "b" }
    shape_directory: "#7263aa"
    shape_external: "#7263aa"
    shape_externalarg: { fg: "#c6914b" attr: "b" }
    shape_filepath: "#7263aa"
    shape_flag: { fg: "#8e7dc6" attr: "b" }
    shape_float: { fg: "#953b9d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#7263aa" attr: "b" }
    shape_int: { fg: "#953b9d" attr: "b" }
    shape_internalcall: { fg: "#7263aa" attr: "b" }
    shape_list: { fg: "#7263aa" attr: "b" }
    shape_literal: "#8e7dc6"
    shape_match_pattern: "#c6914b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#7263aa"
    shape_operator: "#804ead"
    shape_or: { fg: "#953b9d" attr: "b" }
    shape_pipe: { fg: "#953b9d" attr: "b" }
    shape_range: { fg: "#804ead" attr: "b" }
    shape_record: { fg: "#7263aa" attr: "b" }
    shape_redirection: { fg: "#953b9d" attr: "b" }
    shape_signature: { fg: "#c6914b" attr: "b" }
    shape_string: "#c6914b"
    shape_string_interpolation: { fg: "#7263aa" attr: "b" }
    shape_table: { fg: "#8e7dc6" attr: "b" }
    shape_variable: "#953b9d"

    background: "#271c3a"
    foreground: "#dedcdf"
    cursor: "#dedcdf"
}}