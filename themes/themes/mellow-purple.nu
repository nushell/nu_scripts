export def main [] { return {
    separator: "#ffeeff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#05cb0d" attr: "b" }
    empty: "#550068"
    bool: {|| if $in { "#b900b1" } else { "light_gray" } }
    int: "#ffeeff"
    filesize: {|e|
      if $e == 0b {
        "#ffeeff"
      } else if $e < 1mb {
        "#b900b1"
      } else {{ fg: "#550068" }}
    }
    duration: "#ffeeff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#00d9e9" attr: "b" }
      } else if $in < 6hr {
        "#00d9e9"
      } else if $in < 1day {
        "#955ae7"
      } else if $in < 3day {
        "#05cb0d"
      } else if $in < 1wk {
        { fg: "#05cb0d" attr: "b" }
      } else if $in < 6wk {
        "#b900b1"
      } else if $in < 52wk {
        "#550068"
      } else { "dark_gray" }
    }
    range: "#ffeeff"
    float: "#ffeeff"
    string: "#ffeeff"
    nothing: "#ffeeff"
    binary: "#ffeeff"
    cellpath: "#ffeeff"
    row_index: { fg: "#05cb0d" attr: "b" }
    record: "#ffeeff"
    list: "#ffeeff"
    block: "#ffeeff"
    hints: "dark_gray"

    shape_and: { fg: "#8991bb" attr: "b" }
    shape_binary: { fg: "#8991bb" attr: "b" }
    shape_block: { fg: "#550068" attr: "b" }
    shape_bool: "#b900b1"
    shape_custom: "#05cb0d"
    shape_datetime: { fg: "#b900b1" attr: "b" }
    shape_directory: "#b900b1"
    shape_external: "#b900b1"
    shape_externalarg: { fg: "#05cb0d" attr: "b" }
    shape_filepath: "#b900b1"
    shape_flag: { fg: "#550068" attr: "b" }
    shape_float: { fg: "#8991bb" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#b900b1" attr: "b" }
    shape_int: { fg: "#8991bb" attr: "b" }
    shape_internalcall: { fg: "#b900b1" attr: "b" }
    shape_list: { fg: "#b900b1" attr: "b" }
    shape_literal: "#550068"
    shape_match_pattern: "#05cb0d"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b900b1"
    shape_operator: "#955ae7"
    shape_or: { fg: "#8991bb" attr: "b" }
    shape_pipe: { fg: "#8991bb" attr: "b" }
    shape_range: { fg: "#955ae7" attr: "b" }
    shape_record: { fg: "#b900b1" attr: "b" }
    shape_redirection: { fg: "#8991bb" attr: "b" }
    shape_signature: { fg: "#05cb0d" attr: "b" }
    shape_string: "#05cb0d"
    shape_string_interpolation: { fg: "#b900b1" attr: "b" }
    shape_table: { fg: "#550068" attr: "b" }
    shape_variable: "#8991bb"

    background: "#1e0528"
    foreground: "#ffeeff"
    cursor: "#ffeeff"
}}