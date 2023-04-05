export def main [] { return {
    separator: "#eeffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#c3e88d" attr: "b" }
    empty: "#82aaff"
    bool: {|| if $in { "#89ddff" } else { "light_gray" } }
    int: "#eeffff"
    filesize: {|e|
      if $e == 0b {
        "#eeffff"
      } else if $e < 1mb {
        "#89ddff"
      } else {{ fg: "#82aaff" }}
    }
    duration: "#eeffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f07178" attr: "b" }
      } else if $in < 6hr {
        "#f07178"
      } else if $in < 1day {
        "#ffcb6b"
      } else if $in < 3day {
        "#c3e88d"
      } else if $in < 1wk {
        { fg: "#c3e88d" attr: "b" }
      } else if $in < 6wk {
        "#89ddff"
      } else if $in < 52wk {
        "#82aaff"
      } else { "dark_gray" }
    }
    range: "#eeffff"
    float: "#eeffff"
    string: "#eeffff"
    nothing: "#eeffff"
    binary: "#eeffff"
    cellpath: "#eeffff"
    row_index: { fg: "#c3e88d" attr: "b" }
    record: "#eeffff"
    list: "#eeffff"
    block: "#eeffff"
    hints: "dark_gray"

    shape_and: { fg: "#c792ea" attr: "b" }
    shape_binary: { fg: "#c792ea" attr: "b" }
    shape_block: { fg: "#82aaff" attr: "b" }
    shape_bool: "#89ddff"
    shape_custom: "#c3e88d"
    shape_datetime: { fg: "#89ddff" attr: "b" }
    shape_directory: "#89ddff"
    shape_external: "#89ddff"
    shape_externalarg: { fg: "#c3e88d" attr: "b" }
    shape_filepath: "#89ddff"
    shape_flag: { fg: "#82aaff" attr: "b" }
    shape_float: { fg: "#c792ea" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#89ddff" attr: "b" }
    shape_int: { fg: "#c792ea" attr: "b" }
    shape_internalcall: { fg: "#89ddff" attr: "b" }
    shape_list: { fg: "#89ddff" attr: "b" }
    shape_literal: "#82aaff"
    shape_match_pattern: "#c3e88d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#89ddff"
    shape_operator: "#ffcb6b"
    shape_or: { fg: "#c792ea" attr: "b" }
    shape_pipe: { fg: "#c792ea" attr: "b" }
    shape_range: { fg: "#ffcb6b" attr: "b" }
    shape_record: { fg: "#89ddff" attr: "b" }
    shape_redirection: { fg: "#c792ea" attr: "b" }
    shape_signature: { fg: "#c3e88d" attr: "b" }
    shape_string: "#c3e88d"
    shape_string_interpolation: { fg: "#89ddff" attr: "b" }
    shape_table: { fg: "#82aaff" attr: "b" }
    shape_variable: "#c792ea"

    background: "#212121"
    foreground: "#eeffff"
    cursor: "#eeffff"
}}