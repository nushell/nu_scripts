export def main [] { return {
    separator: "#232629"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#388e3c" attr: "b" }
    empty: "#0082c9"
    bool: {|| if $in { "#008e8e" } else { "light_gray" } }
    int: "#232629"
    filesize: {|e|
      if $e == 0b {
        "#232629"
      } else if $e < 1mb {
        "#008e8e"
      } else {{ fg: "#0082c9" }}
    }
    duration: "#232629"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b0151a" attr: "b" }
      } else if $in < 6hr {
        "#b0151a"
      } else if $in < 1day {
        "#ffb627"
      } else if $in < 3day {
        "#388e3c"
      } else if $in < 1wk {
        { fg: "#388e3c" attr: "b" }
      } else if $in < 6wk {
        "#008e8e"
      } else if $in < 52wk {
        "#0082c9"
      } else { "dark_gray" }
    }
    range: "#232629"
    float: "#232629"
    string: "#232629"
    nothing: "#232629"
    binary: "#232629"
    cellpath: "#232629"
    row_index: { fg: "#388e3c" attr: "b" }
    record: "#232629"
    list: "#232629"
    block: "#232629"
    hints: "dark_gray"

    shape_and: { fg: "#700f98" attr: "b" }
    shape_binary: { fg: "#700f98" attr: "b" }
    shape_block: { fg: "#0082c9" attr: "b" }
    shape_bool: "#008e8e"
    shape_custom: "#388e3c"
    shape_datetime: { fg: "#008e8e" attr: "b" }
    shape_directory: "#008e8e"
    shape_external: "#008e8e"
    shape_externalarg: { fg: "#388e3c" attr: "b" }
    shape_filepath: "#008e8e"
    shape_flag: { fg: "#0082c9" attr: "b" }
    shape_float: { fg: "#700f98" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#008e8e" attr: "b" }
    shape_int: { fg: "#700f98" attr: "b" }
    shape_internalcall: { fg: "#008e8e" attr: "b" }
    shape_list: { fg: "#008e8e" attr: "b" }
    shape_literal: "#0082c9"
    shape_match_pattern: "#388e3c"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#008e8e"
    shape_operator: "#ffb627"
    shape_or: { fg: "#700f98" attr: "b" }
    shape_pipe: { fg: "#700f98" attr: "b" }
    shape_range: { fg: "#ffb627" attr: "b" }
    shape_record: { fg: "#008e8e" attr: "b" }
    shape_redirection: { fg: "#700f98" attr: "b" }
    shape_signature: { fg: "#388e3c" attr: "b" }
    shape_string: "#388e3c"
    shape_string_interpolation: { fg: "#008e8e" attr: "b" }
    shape_table: { fg: "#0082c9" attr: "b" }
    shape_variable: "#700f98"

    background: "#f8f8f2"
    foreground: "#232629"
    cursor: "#232629"
}}