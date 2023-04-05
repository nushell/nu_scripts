export def main [] { return {
    separator: "#b4b4b9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#718e3f" attr: "b" }
    empty: "#635196"
    bool: {|| if $in { "#8bccbf" } else { "light_gray" } }
    int: "#b4b4b9"
    filesize: {|e|
      if $e == 0b {
        "#b4b4b9"
      } else if $e < 1mb {
        "#34bfa4"
      } else {{ fg: "#635196" }}
    }
    duration: "#b4b4b9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff3600" attr: "b" }
      } else if $in < 6hr {
        "#ff3600"
      } else if $in < 1day {
        "#ffc552"
      } else if $in < 3day {
        "#718e3f"
      } else if $in < 1wk {
        { fg: "#718e3f" attr: "b" }
      } else if $in < 6wk {
        "#34bfa4"
      } else if $in < 52wk {
        "#635196"
      } else { "dark_gray" }
    }
    range: "#b4b4b9"
    float: "#b4b4b9"
    string: "#b4b4b9"
    nothing: "#b4b4b9"
    binary: "#b4b4b9"
    cellpath: "#b4b4b9"
    row_index: { fg: "#718e3f" attr: "b" }
    record: "#b4b4b9"
    list: "#b4b4b9"
    block: "#b4b4b9"
    hints: "dark_gray"

    shape_and: { fg: "#ff761a" attr: "b" }
    shape_binary: { fg: "#ff761a" attr: "b" }
    shape_block: { fg: "#635196" attr: "b" }
    shape_bool: "#8bccbf"
    shape_custom: "#718e3f"
    shape_datetime: { fg: "#34bfa4" attr: "b" }
    shape_directory: "#34bfa4"
    shape_external: "#34bfa4"
    shape_externalarg: { fg: "#718e3f" attr: "b" }
    shape_filepath: "#34bfa4"
    shape_flag: { fg: "#635196" attr: "b" }
    shape_float: { fg: "#ff761a" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#34bfa4" attr: "b" }
    shape_int: { fg: "#ff761a" attr: "b" }
    shape_internalcall: { fg: "#34bfa4" attr: "b" }
    shape_list: { fg: "#34bfa4" attr: "b" }
    shape_literal: "#635196"
    shape_match_pattern: "#718e3f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8bccbf"
    shape_operator: "#ffc552"
    shape_or: { fg: "#ff761a" attr: "b" }
    shape_pipe: { fg: "#ff761a" attr: "b" }
    shape_range: { fg: "#ffc552" attr: "b" }
    shape_record: { fg: "#34bfa4" attr: "b" }
    shape_redirection: { fg: "#ff761a" attr: "b" }
    shape_signature: { fg: "#718e3f" attr: "b" }
    shape_string: "#718e3f"
    shape_string_interpolation: { fg: "#34bfa4" attr: "b" }
    shape_table: { fg: "#635196" attr: "b" }
    shape_variable: "#ff761a"

    background: "#020221"
    foreground: "#b4b4b9"
    cursor: "#ffe8c0"
}}