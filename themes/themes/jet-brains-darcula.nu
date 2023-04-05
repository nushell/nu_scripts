export def main [] { return {
    separator: "#adadad"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#126e00" attr: "b" }
    empty: "#4581eb"
    bool: {|| if $in { "#60d3d1" } else { "light_gray" } }
    int: "#adadad"
    filesize: {|e|
      if $e == 0b {
        "#adadad"
      } else if $e < 1mb {
        "#33c2c1"
      } else {{ fg: "#4581eb" }}
    }
    duration: "#adadad"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fa5355" attr: "b" }
      } else if $in < 6hr {
        "#fa5355"
      } else if $in < 1day {
        "#c2c300"
      } else if $in < 3day {
        "#126e00"
      } else if $in < 1wk {
        { fg: "#126e00" attr: "b" }
      } else if $in < 6wk {
        "#33c2c1"
      } else if $in < 52wk {
        "#4581eb"
      } else { "dark_gray" }
    }
    range: "#adadad"
    float: "#adadad"
    string: "#adadad"
    nothing: "#adadad"
    binary: "#adadad"
    cellpath: "#adadad"
    row_index: { fg: "#126e00" attr: "b" }
    record: "#adadad"
    list: "#adadad"
    block: "#adadad"
    hints: "dark_gray"

    shape_and: { fg: "#fa54ff" attr: "b" }
    shape_binary: { fg: "#fa54ff" attr: "b" }
    shape_block: { fg: "#4581eb" attr: "b" }
    shape_bool: "#60d3d1"
    shape_custom: "#126e00"
    shape_datetime: { fg: "#33c2c1" attr: "b" }
    shape_directory: "#33c2c1"
    shape_external: "#33c2c1"
    shape_externalarg: { fg: "#126e00" attr: "b" }
    shape_filepath: "#33c2c1"
    shape_flag: { fg: "#4581eb" attr: "b" }
    shape_float: { fg: "#fa54ff" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#33c2c1" attr: "b" }
    shape_int: { fg: "#fa54ff" attr: "b" }
    shape_internalcall: { fg: "#33c2c1" attr: "b" }
    shape_list: { fg: "#33c2c1" attr: "b" }
    shape_literal: "#4581eb"
    shape_match_pattern: "#126e00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#60d3d1"
    shape_operator: "#c2c300"
    shape_or: { fg: "#fa54ff" attr: "b" }
    shape_pipe: { fg: "#fa54ff" attr: "b" }
    shape_range: { fg: "#c2c300" attr: "b" }
    shape_record: { fg: "#33c2c1" attr: "b" }
    shape_redirection: { fg: "#fa54ff" attr: "b" }
    shape_signature: { fg: "#126e00" attr: "b" }
    shape_string: "#126e00"
    shape_string_interpolation: { fg: "#33c2c1" attr: "b" }
    shape_table: { fg: "#4581eb" attr: "b" }
    shape_variable: "#fa54ff"

    background: "#202020"
    foreground: "#adadad"
    cursor: "#ffffff"
}}