export def main [] { return {
    separator: "#f8f8f8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#61ce3c" attr: "b" }
    empty: "#253b76"
    bool: {|| if $in { "#8da6ce" } else { "light_gray" } }
    int: "#f8f8f8"
    filesize: {|e|
      if $e == 0b {
        "#f8f8f8"
      } else if $e < 1mb {
        "#8da6ce"
      } else {{ fg: "#253b76" }}
    }
    duration: "#f8f8f8"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#800000" attr: "b" }
      } else if $in < 6hr {
        "#800000"
      } else if $in < 1day {
        "#fbde2d"
      } else if $in < 3day {
        "#61ce3c"
      } else if $in < 1wk {
        { fg: "#61ce3c" attr: "b" }
      } else if $in < 6wk {
        "#8da6ce"
      } else if $in < 52wk {
        "#253b76"
      } else { "dark_gray" }
    }
    range: "#f8f8f8"
    float: "#f8f8f8"
    string: "#f8f8f8"
    nothing: "#f8f8f8"
    binary: "#f8f8f8"
    cellpath: "#f8f8f8"
    row_index: { fg: "#61ce3c" attr: "b" }
    record: "#f8f8f8"
    list: "#f8f8f8"
    block: "#f8f8f8"
    hints: "dark_gray"

    shape_and: { fg: "#ff0080" attr: "b" }
    shape_binary: { fg: "#ff0080" attr: "b" }
    shape_block: { fg: "#253b76" attr: "b" }
    shape_bool: "#8da6ce"
    shape_custom: "#61ce3c"
    shape_datetime: { fg: "#8da6ce" attr: "b" }
    shape_directory: "#8da6ce"
    shape_external: "#8da6ce"
    shape_externalarg: { fg: "#61ce3c" attr: "b" }
    shape_filepath: "#8da6ce"
    shape_flag: { fg: "#253b76" attr: "b" }
    shape_float: { fg: "#ff0080" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8da6ce" attr: "b" }
    shape_int: { fg: "#ff0080" attr: "b" }
    shape_internalcall: { fg: "#8da6ce" attr: "b" }
    shape_list: { fg: "#8da6ce" attr: "b" }
    shape_literal: "#253b76"
    shape_match_pattern: "#61ce3c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8da6ce"
    shape_operator: "#fbde2d"
    shape_or: { fg: "#ff0080" attr: "b" }
    shape_pipe: { fg: "#ff0080" attr: "b" }
    shape_range: { fg: "#fbde2d" attr: "b" }
    shape_record: { fg: "#8da6ce" attr: "b" }
    shape_redirection: { fg: "#ff0080" attr: "b" }
    shape_signature: { fg: "#61ce3c" attr: "b" }
    shape_string: "#61ce3c"
    shape_string_interpolation: { fg: "#8da6ce" attr: "b" }
    shape_table: { fg: "#253b76" attr: "b" }
    shape_variable: "#ff0080"

    background: "#271f19"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}