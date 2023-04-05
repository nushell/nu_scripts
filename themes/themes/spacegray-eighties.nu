export def main [] { return {
    separator: "#efece7"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#81a764" attr: "b" }
    empty: "#5486c0"
    bool: {|| if $in { "#83e9e4" } else { "light_gray" } }
    int: "#efece7"
    filesize: {|e|
      if $e == 0b {
        "#efece7"
      } else if $e < 1mb {
        "#57c2c1"
      } else {{ fg: "#5486c0" }}
    }
    duration: "#efece7"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ec5f67" attr: "b" }
      } else if $in < 6hr {
        "#ec5f67"
      } else if $in < 1day {
        "#fec254"
      } else if $in < 3day {
        "#81a764"
      } else if $in < 1wk {
        { fg: "#81a764" attr: "b" }
      } else if $in < 6wk {
        "#57c2c1"
      } else if $in < 52wk {
        "#5486c0"
      } else { "dark_gray" }
    }
    range: "#efece7"
    float: "#efece7"
    string: "#efece7"
    nothing: "#efece7"
    binary: "#efece7"
    cellpath: "#efece7"
    row_index: { fg: "#81a764" attr: "b" }
    record: "#efece7"
    list: "#efece7"
    block: "#efece7"
    hints: "dark_gray"

    shape_and: { fg: "#bf83c1" attr: "b" }
    shape_binary: { fg: "#bf83c1" attr: "b" }
    shape_block: { fg: "#5486c0" attr: "b" }
    shape_bool: "#83e9e4"
    shape_custom: "#81a764"
    shape_datetime: { fg: "#57c2c1" attr: "b" }
    shape_directory: "#57c2c1"
    shape_external: "#57c2c1"
    shape_externalarg: { fg: "#81a764" attr: "b" }
    shape_filepath: "#57c2c1"
    shape_flag: { fg: "#5486c0" attr: "b" }
    shape_float: { fg: "#bf83c1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#57c2c1" attr: "b" }
    shape_int: { fg: "#bf83c1" attr: "b" }
    shape_internalcall: { fg: "#57c2c1" attr: "b" }
    shape_list: { fg: "#57c2c1" attr: "b" }
    shape_literal: "#5486c0"
    shape_match_pattern: "#81a764"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#83e9e4"
    shape_operator: "#fec254"
    shape_or: { fg: "#bf83c1" attr: "b" }
    shape_pipe: { fg: "#bf83c1" attr: "b" }
    shape_range: { fg: "#fec254" attr: "b" }
    shape_record: { fg: "#57c2c1" attr: "b" }
    shape_redirection: { fg: "#bf83c1" attr: "b" }
    shape_signature: { fg: "#81a764" attr: "b" }
    shape_string: "#81a764"
    shape_string_interpolation: { fg: "#57c2c1" attr: "b" }
    shape_table: { fg: "#5486c0" attr: "b" }
    shape_variable: "#bf83c1"

    background: "#222222"
    foreground: "#bdbaae"
    cursor: "#bdbaae"
}}