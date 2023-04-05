export def main [] { return {
    separator: "#514036"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#72761e" attr: "b" }
    empty: "#266b79"
    bool: {|| if $in { "#477a5b" } else { "light_gray" } }
    int: "#514036"
    filesize: {|e|
      if $e == 0b {
        "#514036"
      } else if $e < 1mb {
        "#477a5b"
      } else {{ fg: "#266b79" }}
    }
    duration: "#514036"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#af2528" attr: "b" }
      } else if $in < 6hr {
        "#af2528"
      } else if $in < 1day {
        "#b4730e"
      } else if $in < 3day {
        "#72761e"
      } else if $in < 1wk {
        { fg: "#72761e" attr: "b" }
      } else if $in < 6wk {
        "#477a5b"
      } else if $in < 52wk {
        "#266b79"
      } else { "dark_gray" }
    }
    range: "#514036"
    float: "#514036"
    string: "#514036"
    nothing: "#514036"
    binary: "#514036"
    cellpath: "#514036"
    row_index: { fg: "#72761e" attr: "b" }
    record: "#514036"
    list: "#514036"
    block: "#514036"
    hints: "dark_gray"

    shape_and: { fg: "#924f79" attr: "b" }
    shape_binary: { fg: "#924f79" attr: "b" }
    shape_block: { fg: "#266b79" attr: "b" }
    shape_bool: "#477a5b"
    shape_custom: "#72761e"
    shape_datetime: { fg: "#477a5b" attr: "b" }
    shape_directory: "#477a5b"
    shape_external: "#477a5b"
    shape_externalarg: { fg: "#72761e" attr: "b" }
    shape_filepath: "#477a5b"
    shape_flag: { fg: "#266b79" attr: "b" }
    shape_float: { fg: "#924f79" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#477a5b" attr: "b" }
    shape_int: { fg: "#924f79" attr: "b" }
    shape_internalcall: { fg: "#477a5b" attr: "b" }
    shape_list: { fg: "#477a5b" attr: "b" }
    shape_literal: "#266b79"
    shape_match_pattern: "#72761e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#477a5b"
    shape_operator: "#b4730e"
    shape_or: { fg: "#924f79" attr: "b" }
    shape_pipe: { fg: "#924f79" attr: "b" }
    shape_range: { fg: "#b4730e" attr: "b" }
    shape_record: { fg: "#477a5b" attr: "b" }
    shape_redirection: { fg: "#924f79" attr: "b" }
    shape_signature: { fg: "#72761e" attr: "b" }
    shape_string: "#72761e"
    shape_string_interpolation: { fg: "#477a5b" attr: "b" }
    shape_table: { fg: "#266b79" attr: "b" }
    shape_variable: "#924f79"

    background: "#fbf1c7"
    foreground: "#514036"
    cursor: "#514036"
}}