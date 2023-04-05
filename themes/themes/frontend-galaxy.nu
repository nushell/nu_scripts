export def main [] { return {
    separator: "#bbbbbb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#21b089" attr: "b" }
    empty: "#589df6"
    bool: {|| if $in { "#3979bc" } else { "light_gray" } }
    int: "#bbbbbb"
    filesize: {|e|
      if $e == 0b {
        "#bbbbbb"
      } else if $e < 1mb {
        "#1f9ee7"
      } else {{ fg: "#589df6" }}
    }
    duration: "#bbbbbb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f9555f" attr: "b" }
      } else if $in < 6hr {
        "#f9555f"
      } else if $in < 1day {
        "#fef02a"
      } else if $in < 3day {
        "#21b089"
      } else if $in < 1wk {
        { fg: "#21b089" attr: "b" }
      } else if $in < 6wk {
        "#1f9ee7"
      } else if $in < 52wk {
        "#589df6"
      } else { "dark_gray" }
    }
    range: "#bbbbbb"
    float: "#bbbbbb"
    string: "#bbbbbb"
    nothing: "#bbbbbb"
    binary: "#bbbbbb"
    cellpath: "#bbbbbb"
    row_index: { fg: "#21b089" attr: "b" }
    record: "#bbbbbb"
    list: "#bbbbbb"
    block: "#bbbbbb"
    hints: "dark_gray"

    shape_and: { fg: "#944d95" attr: "b" }
    shape_binary: { fg: "#944d95" attr: "b" }
    shape_block: { fg: "#589df6" attr: "b" }
    shape_bool: "#3979bc"
    shape_custom: "#21b089"
    shape_datetime: { fg: "#1f9ee7" attr: "b" }
    shape_directory: "#1f9ee7"
    shape_external: "#1f9ee7"
    shape_externalarg: { fg: "#21b089" attr: "b" }
    shape_filepath: "#1f9ee7"
    shape_flag: { fg: "#589df6" attr: "b" }
    shape_float: { fg: "#944d95" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#1f9ee7" attr: "b" }
    shape_int: { fg: "#944d95" attr: "b" }
    shape_internalcall: { fg: "#1f9ee7" attr: "b" }
    shape_list: { fg: "#1f9ee7" attr: "b" }
    shape_literal: "#589df6"
    shape_match_pattern: "#21b089"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3979bc"
    shape_operator: "#fef02a"
    shape_or: { fg: "#944d95" attr: "b" }
    shape_pipe: { fg: "#944d95" attr: "b" }
    shape_range: { fg: "#fef02a" attr: "b" }
    shape_record: { fg: "#1f9ee7" attr: "b" }
    shape_redirection: { fg: "#944d95" attr: "b" }
    shape_signature: { fg: "#21b089" attr: "b" }
    shape_string: "#21b089"
    shape_string_interpolation: { fg: "#1f9ee7" attr: "b" }
    shape_table: { fg: "#589df6" attr: "b" }
    shape_variable: "#944d95"

    background: "#1d2837"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}