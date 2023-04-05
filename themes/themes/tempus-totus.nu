export def main [] { return {
    separator: "#f3f1f3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#005f26" attr: "b" }
    empty: "#1d3fcf"
    bool: {|| if $in { "#005589" } else { "light_gray" } }
    int: "#f3f1f3"
    filesize: {|e|
      if $e == 0b {
        "#f3f1f3"
      } else if $e < 1mb {
        "#185870"
      } else {{ fg: "#1d3fcf" }}
    }
    duration: "#f3f1f3"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#a80000" attr: "b" }
      } else if $in < 6hr {
        "#a80000"
      } else if $in < 1day {
        "#714900"
      } else if $in < 3day {
        "#005f26"
      } else if $in < 1wk {
        { fg: "#005f26" attr: "b" }
      } else if $in < 6wk {
        "#185870"
      } else if $in < 52wk {
        "#1d3fcf"
      } else { "dark_gray" }
    }
    range: "#f3f1f3"
    float: "#f3f1f3"
    string: "#f3f1f3"
    nothing: "#f3f1f3"
    binary: "#f3f1f3"
    cellpath: "#f3f1f3"
    row_index: { fg: "#005f26" attr: "b" }
    record: "#f3f1f3"
    list: "#f3f1f3"
    block: "#f3f1f3"
    hints: "dark_gray"

    shape_and: { fg: "#882a7a" attr: "b" }
    shape_binary: { fg: "#882a7a" attr: "b" }
    shape_block: { fg: "#1d3fcf" attr: "b" }
    shape_bool: "#005589"
    shape_custom: "#005f26"
    shape_datetime: { fg: "#185870" attr: "b" }
    shape_directory: "#185870"
    shape_external: "#185870"
    shape_externalarg: { fg: "#005f26" attr: "b" }
    shape_filepath: "#185870"
    shape_flag: { fg: "#1d3fcf" attr: "b" }
    shape_float: { fg: "#882a7a" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#185870" attr: "b" }
    shape_int: { fg: "#882a7a" attr: "b" }
    shape_internalcall: { fg: "#185870" attr: "b" }
    shape_list: { fg: "#185870" attr: "b" }
    shape_literal: "#1d3fcf"
    shape_match_pattern: "#005f26"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#005589"
    shape_operator: "#714900"
    shape_or: { fg: "#882a7a" attr: "b" }
    shape_pipe: { fg: "#882a7a" attr: "b" }
    shape_range: { fg: "#714900" attr: "b" }
    shape_record: { fg: "#185870" attr: "b" }
    shape_redirection: { fg: "#882a7a" attr: "b" }
    shape_signature: { fg: "#005f26" attr: "b" }
    shape_string: "#005f26"
    shape_string_interpolation: { fg: "#185870" attr: "b" }
    shape_table: { fg: "#1d3fcf" attr: "b" }
    shape_variable: "#882a7a"

    background: "#ffffff"
    foreground: "#4a484d"
    cursor: "#4a484d"
}}