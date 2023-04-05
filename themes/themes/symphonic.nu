export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#56db3a" attr: "b" }
    empty: "#0084d4"
    bool: {|| if $in { "#ccccff" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#ccccff"
      } else {{ fg: "#0084d4" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#dc322f" attr: "b" }
      } else if $in < 6hr {
        "#dc322f"
      } else if $in < 1day {
        "#ff8400"
      } else if $in < 3day {
        "#56db3a"
      } else if $in < 1wk {
        { fg: "#56db3a" attr: "b" }
      } else if $in < 6wk {
        "#ccccff"
      } else if $in < 52wk {
        "#0084d4"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#56db3a" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#b729d9" attr: "b" }
    shape_binary: { fg: "#b729d9" attr: "b" }
    shape_block: { fg: "#0084d4" attr: "b" }
    shape_bool: "#ccccff"
    shape_custom: "#56db3a"
    shape_datetime: { fg: "#ccccff" attr: "b" }
    shape_directory: "#ccccff"
    shape_external: "#ccccff"
    shape_externalarg: { fg: "#56db3a" attr: "b" }
    shape_filepath: "#ccccff"
    shape_flag: { fg: "#0084d4" attr: "b" }
    shape_float: { fg: "#b729d9" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ccccff" attr: "b" }
    shape_int: { fg: "#b729d9" attr: "b" }
    shape_internalcall: { fg: "#ccccff" attr: "b" }
    shape_list: { fg: "#ccccff" attr: "b" }
    shape_literal: "#0084d4"
    shape_match_pattern: "#56db3a"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ccccff"
    shape_operator: "#ff8400"
    shape_or: { fg: "#b729d9" attr: "b" }
    shape_pipe: { fg: "#b729d9" attr: "b" }
    shape_range: { fg: "#ff8400" attr: "b" }
    shape_record: { fg: "#ccccff" attr: "b" }
    shape_redirection: { fg: "#b729d9" attr: "b" }
    shape_signature: { fg: "#56db3a" attr: "b" }
    shape_string: "#56db3a"
    shape_string_interpolation: { fg: "#ccccff" attr: "b" }
    shape_table: { fg: "#0084d4" attr: "b" }
    shape_variable: "#b729d9"

    background: "#000000"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}