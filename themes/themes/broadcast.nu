export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#519f50" attr: "b" }
    empty: "#6d9cbe"
    bool: {|| if $in { "#a0cef0" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#6e9cbe"
      } else {{ fg: "#6d9cbe" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#da4939" attr: "b" }
      } else if $in < 6hr {
        "#da4939"
      } else if $in < 1day {
        "#ffd24a"
      } else if $in < 3day {
        "#519f50"
      } else if $in < 1wk {
        { fg: "#519f50" attr: "b" }
      } else if $in < 6wk {
        "#6e9cbe"
      } else if $in < 52wk {
        "#6d9cbe"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#519f50" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#d0d0ff" attr: "b" }
    shape_binary: { fg: "#d0d0ff" attr: "b" }
    shape_block: { fg: "#6d9cbe" attr: "b" }
    shape_bool: "#a0cef0"
    shape_custom: "#519f50"
    shape_datetime: { fg: "#6e9cbe" attr: "b" }
    shape_directory: "#6e9cbe"
    shape_external: "#6e9cbe"
    shape_externalarg: { fg: "#519f50" attr: "b" }
    shape_filepath: "#6e9cbe"
    shape_flag: { fg: "#6d9cbe" attr: "b" }
    shape_float: { fg: "#d0d0ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#6e9cbe" attr: "b" }
    shape_int: { fg: "#d0d0ff" attr: "b" }
    shape_internalcall: { fg: "#6e9cbe" attr: "b" }
    shape_list: { fg: "#6e9cbe" attr: "b" }
    shape_literal: "#6d9cbe"
    shape_match_pattern: "#519f50"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a0cef0"
    shape_operator: "#ffd24a"
    shape_or: { fg: "#d0d0ff" attr: "b" }
    shape_pipe: { fg: "#d0d0ff" attr: "b" }
    shape_range: { fg: "#ffd24a" attr: "b" }
    shape_record: { fg: "#6e9cbe" attr: "b" }
    shape_redirection: { fg: "#d0d0ff" attr: "b" }
    shape_signature: { fg: "#519f50" attr: "b" }
    shape_string: "#519f50"
    shape_string_interpolation: { fg: "#6e9cbe" attr: "b" }
    shape_table: { fg: "#6d9cbe" attr: "b" }
    shape_variable: "#d0d0ff"

    background: "#2b2b2b"
    foreground: "#e6e1dc"
    cursor: "#e6e1dc"
}}