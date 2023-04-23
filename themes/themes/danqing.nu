export def main [] { return {
    separator: "#e0f0ef"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8ab361" attr: "b" }
    empty: "#b0a4e3"
    bool: {|| if $in { "#30dff3" } else { "light_gray" } }
    int: "#e0f0ef"
    filesize: {|e|
      if $e == 0b {
        "#e0f0ef"
      } else if $e < 1mb {
        "#30dff3"
      } else {{ fg: "#b0a4e3" }}
    }
    duration: "#e0f0ef"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f9906f" attr: "b" }
      } else if $in < 6hr {
        "#f9906f"
      } else if $in < 1day {
        "#f0c239"
      } else if $in < 3day {
        "#8ab361"
      } else if $in < 1wk {
        { fg: "#8ab361" attr: "b" }
      } else if $in < 6wk {
        "#30dff3"
      } else if $in < 52wk {
        "#b0a4e3"
      } else { "dark_gray" }
    }
    range: "#e0f0ef"
    float: "#e0f0ef"
    string: "#e0f0ef"
    nothing: "#e0f0ef"
    binary: "#e0f0ef"
    cellpath: "#e0f0ef"
    row_index: { fg: "#8ab361" attr: "b" }
    record: "#e0f0ef"
    list: "#e0f0ef"
    block: "#e0f0ef"
    hints: "dark_gray"

    shape_and: { fg: "#cca4e3" attr: "b" }
    shape_binary: { fg: "#cca4e3" attr: "b" }
    shape_block: { fg: "#b0a4e3" attr: "b" }
    shape_bool: "#30dff3"
    shape_custom: "#8ab361"
    shape_datetime: { fg: "#30dff3" attr: "b" }
    shape_directory: "#30dff3"
    shape_external: "#30dff3"
    shape_externalarg: { fg: "#8ab361" attr: "b" }
    shape_filepath: "#30dff3"
    shape_flag: { fg: "#b0a4e3" attr: "b" }
    shape_float: { fg: "#cca4e3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#30dff3" attr: "b" }
    shape_int: { fg: "#cca4e3" attr: "b" }
    shape_internalcall: { fg: "#30dff3" attr: "b" }
    shape_list: { fg: "#30dff3" attr: "b" }
    shape_literal: "#b0a4e3"
    shape_match_pattern: "#8ab361"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#30dff3"
    shape_operator: "#f0c239"
    shape_or: { fg: "#cca4e3" attr: "b" }
    shape_pipe: { fg: "#cca4e3" attr: "b" }
    shape_range: { fg: "#f0c239" attr: "b" }
    shape_record: { fg: "#30dff3" attr: "b" }
    shape_redirection: { fg: "#cca4e3" attr: "b" }
    shape_signature: { fg: "#8ab361" attr: "b" }
    shape_string: "#8ab361"
    shape_string_interpolation: { fg: "#30dff3" attr: "b" }
    shape_table: { fg: "#b0a4e3" attr: "b" }
    shape_variable: "#cca4e3"

    background: "#2d302f"
    foreground: "#e0f0ef"
    cursor: "#e0f0ef"
}}