export def main [] { return {
    separator: "#dedacf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#b1e969" attr: "b" }
    empty: "#5da9f6"
    bool: {|| if $in { "#b7fff9" } else { "light_gray" } }
    int: "#dedacf"
    filesize: {|e|
      if $e == 0b {
        "#dedacf"
      } else if $e < 1mb {
        "#82fff7"
      } else {{ fg: "#5da9f6" }}
    }
    duration: "#dedacf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff615a" attr: "b" }
      } else if $in < 6hr {
        "#ff615a"
      } else if $in < 1day {
        "#ebd99c"
      } else if $in < 3day {
        "#b1e969"
      } else if $in < 1wk {
        { fg: "#b1e969" attr: "b" }
      } else if $in < 6wk {
        "#82fff7"
      } else if $in < 52wk {
        "#5da9f6"
      } else { "dark_gray" }
    }
    range: "#dedacf"
    float: "#dedacf"
    string: "#dedacf"
    nothing: "#dedacf"
    binary: "#dedacf"
    cellpath: "#dedacf"
    row_index: { fg: "#b1e969" attr: "b" }
    record: "#dedacf"
    list: "#dedacf"
    block: "#dedacf"
    hints: "dark_gray"

    shape_and: { fg: "#e86aff" attr: "b" }
    shape_binary: { fg: "#e86aff" attr: "b" }
    shape_block: { fg: "#5da9f6" attr: "b" }
    shape_bool: "#b7fff9"
    shape_custom: "#b1e969"
    shape_datetime: { fg: "#82fff7" attr: "b" }
    shape_directory: "#82fff7"
    shape_external: "#82fff7"
    shape_externalarg: { fg: "#b1e969" attr: "b" }
    shape_filepath: "#82fff7"
    shape_flag: { fg: "#5da9f6" attr: "b" }
    shape_float: { fg: "#e86aff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#82fff7" attr: "b" }
    shape_int: { fg: "#e86aff" attr: "b" }
    shape_internalcall: { fg: "#82fff7" attr: "b" }
    shape_list: { fg: "#82fff7" attr: "b" }
    shape_literal: "#5da9f6"
    shape_match_pattern: "#b1e969"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b7fff9"
    shape_operator: "#ebd99c"
    shape_or: { fg: "#e86aff" attr: "b" }
    shape_pipe: { fg: "#e86aff" attr: "b" }
    shape_range: { fg: "#ebd99c" attr: "b" }
    shape_record: { fg: "#82fff7" attr: "b" }
    shape_redirection: { fg: "#e86aff" attr: "b" }
    shape_signature: { fg: "#b1e969" attr: "b" }
    shape_string: "#b1e969"
    shape_string_interpolation: { fg: "#82fff7" attr: "b" }
    shape_table: { fg: "#5da9f6" attr: "b" }
    shape_variable: "#e86aff"

    background: "#171717"
    foreground: "#dedacf"
    cursor: "#dedacf"
}}