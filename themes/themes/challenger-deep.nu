export def main [] { return {
    separator: "#cbe3e7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#95ffa4" attr: "b" }
    empty: "#91ddff"
    bool: {|| if $in { "#63f2f1" } else { "light_gray" } }
    int: "#cbe3e7"
    filesize: {|e|
      if $e == 0b {
        "#cbe3e7"
      } else if $e < 1mb {
        "#aaffe4"
      } else {{ fg: "#91ddff" }}
    }
    duration: "#cbe3e7"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff8080" attr: "b" }
      } else if $in < 6hr {
        "#ff8080"
      } else if $in < 1day {
        "#ffe9aa"
      } else if $in < 3day {
        "#95ffa4"
      } else if $in < 1wk {
        { fg: "#95ffa4" attr: "b" }
      } else if $in < 6wk {
        "#aaffe4"
      } else if $in < 52wk {
        "#91ddff"
      } else { "dark_gray" }
    }
    range: "#cbe3e7"
    float: "#cbe3e7"
    string: "#cbe3e7"
    nothing: "#cbe3e7"
    binary: "#cbe3e7"
    cellpath: "#cbe3e7"
    row_index: { fg: "#95ffa4" attr: "b" }
    record: "#cbe3e7"
    list: "#cbe3e7"
    block: "#cbe3e7"
    hints: "dark_gray"

    shape_and: { fg: "#c991e1" attr: "b" }
    shape_binary: { fg: "#c991e1" attr: "b" }
    shape_block: { fg: "#91ddff" attr: "b" }
    shape_bool: "#63f2f1"
    shape_custom: "#95ffa4"
    shape_datetime: { fg: "#aaffe4" attr: "b" }
    shape_directory: "#aaffe4"
    shape_external: "#aaffe4"
    shape_externalarg: { fg: "#95ffa4" attr: "b" }
    shape_filepath: "#aaffe4"
    shape_flag: { fg: "#91ddff" attr: "b" }
    shape_float: { fg: "#c991e1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#aaffe4" attr: "b" }
    shape_int: { fg: "#c991e1" attr: "b" }
    shape_internalcall: { fg: "#aaffe4" attr: "b" }
    shape_list: { fg: "#aaffe4" attr: "b" }
    shape_literal: "#91ddff"
    shape_match_pattern: "#95ffa4"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#63f2f1"
    shape_operator: "#ffe9aa"
    shape_or: { fg: "#c991e1" attr: "b" }
    shape_pipe: { fg: "#c991e1" attr: "b" }
    shape_range: { fg: "#ffe9aa" attr: "b" }
    shape_record: { fg: "#aaffe4" attr: "b" }
    shape_redirection: { fg: "#c991e1" attr: "b" }
    shape_signature: { fg: "#95ffa4" attr: "b" }
    shape_string: "#95ffa4"
    shape_string_interpolation: { fg: "#aaffe4" attr: "b" }
    shape_table: { fg: "#91ddff" attr: "b" }
    shape_variable: "#c991e1"

    background: "#1e1c31"
    foreground: "#cbe3e7"
    cursor: "#cbe3e7"
}}