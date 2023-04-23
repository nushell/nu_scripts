export def main [] { return {
    separator: "#dadadb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#32bf46" attr: "b" }
    empty: "#356abf"
    bool: {|| if $in { "#6dd8d8" } else { "light_gray" } }
    int: "#dadadb"
    filesize: {|e|
      if $e == 0b {
        "#dadadb"
      } else if $e < 1mb {
        "#54cece"
      } else {{ fg: "#356abf" }}
    }
    duration: "#dadadb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ea2639" attr: "b" }
      } else if $in < 6hr {
        "#ea2639"
      } else if $in < 1day {
        "#f8f800"
      } else if $in < 3day {
        "#32bf46"
      } else if $in < 1wk {
        { fg: "#32bf46" attr: "b" }
      } else if $in < 6wk {
        "#54cece"
      } else if $in < 52wk {
        "#356abf"
      } else { "dark_gray" }
    }
    range: "#dadadb"
    float: "#dadadb"
    string: "#dadadb"
    nothing: "#dadadb"
    binary: "#dadadb"
    cellpath: "#dadadb"
    row_index: { fg: "#32bf46" attr: "b" }
    record: "#dadadb"
    list: "#dadadb"
    block: "#dadadb"
    hints: "dark_gray"

    shape_and: { fg: "#b035c0" attr: "b" }
    shape_binary: { fg: "#b035c0" attr: "b" }
    shape_block: { fg: "#356abf" attr: "b" }
    shape_bool: "#6dd8d8"
    shape_custom: "#32bf46"
    shape_datetime: { fg: "#54cece" attr: "b" }
    shape_directory: "#54cece"
    shape_external: "#54cece"
    shape_externalarg: { fg: "#32bf46" attr: "b" }
    shape_filepath: "#54cece"
    shape_flag: { fg: "#356abf" attr: "b" }
    shape_float: { fg: "#b035c0" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#54cece" attr: "b" }
    shape_int: { fg: "#b035c0" attr: "b" }
    shape_internalcall: { fg: "#54cece" attr: "b" }
    shape_list: { fg: "#54cece" attr: "b" }
    shape_literal: "#356abf"
    shape_match_pattern: "#32bf46"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#6dd8d8"
    shape_operator: "#f8f800"
    shape_or: { fg: "#b035c0" attr: "b" }
    shape_pipe: { fg: "#b035c0" attr: "b" }
    shape_range: { fg: "#f8f800" attr: "b" }
    shape_record: { fg: "#54cece" attr: "b" }
    shape_redirection: { fg: "#b035c0" attr: "b" }
    shape_signature: { fg: "#32bf46" attr: "b" }
    shape_string: "#32bf46"
    shape_string_interpolation: { fg: "#54cece" attr: "b" }
    shape_table: { fg: "#356abf" attr: "b" }
    shape_variable: "#b035c0"

    background: "#1d1e20"
    foreground: "#dadadb"
    cursor: "#dadadb"
}}