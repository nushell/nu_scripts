export def main [] { return {
    separator: "#6c696e"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#17ad98" attr: "b" }
    empty: "#775dff"
    bool: {|| if $in { "#149bda" } else { "light_gray" } }
    int: "#6c696e"
    filesize: {|e|
      if $e == 0b {
        "#6c696e"
      } else if $e < 1mb {
        "#149bda"
      } else {{ fg: "#775dff" }}
    }
    duration: "#6c696e"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d8137f" attr: "b" }
      } else if $in < 6hr {
        "#d8137f"
      } else if $in < 1day {
        "#dc8a0e"
      } else if $in < 3day {
        "#17ad98"
      } else if $in < 1wk {
        { fg: "#17ad98" attr: "b" }
      } else if $in < 6wk {
        "#149bda"
      } else if $in < 52wk {
        "#775dff"
      } else { "dark_gray" }
    }
    range: "#6c696e"
    float: "#6c696e"
    string: "#6c696e"
    nothing: "#6c696e"
    binary: "#6c696e"
    cellpath: "#6c696e"
    row_index: { fg: "#17ad98" attr: "b" }
    record: "#6c696e"
    list: "#6c696e"
    block: "#6c696e"
    hints: "dark_gray"

    shape_and: { fg: "#aa17e6" attr: "b" }
    shape_binary: { fg: "#aa17e6" attr: "b" }
    shape_block: { fg: "#775dff" attr: "b" }
    shape_bool: "#149bda"
    shape_custom: "#17ad98"
    shape_datetime: { fg: "#149bda" attr: "b" }
    shape_directory: "#149bda"
    shape_external: "#149bda"
    shape_externalarg: { fg: "#17ad98" attr: "b" }
    shape_filepath: "#149bda"
    shape_flag: { fg: "#775dff" attr: "b" }
    shape_float: { fg: "#aa17e6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#149bda" attr: "b" }
    shape_int: { fg: "#aa17e6" attr: "b" }
    shape_internalcall: { fg: "#149bda" attr: "b" }
    shape_list: { fg: "#149bda" attr: "b" }
    shape_literal: "#775dff"
    shape_match_pattern: "#17ad98"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#149bda"
    shape_operator: "#dc8a0e"
    shape_or: { fg: "#aa17e6" attr: "b" }
    shape_pipe: { fg: "#aa17e6" attr: "b" }
    shape_range: { fg: "#dc8a0e" attr: "b" }
    shape_record: { fg: "#149bda" attr: "b" }
    shape_redirection: { fg: "#aa17e6" attr: "b" }
    shape_signature: { fg: "#17ad98" attr: "b" }
    shape_string: "#17ad98"
    shape_string_interpolation: { fg: "#149bda" attr: "b" }
    shape_table: { fg: "#775dff" attr: "b" }
    shape_variable: "#aa17e6"

    background: "#ffffff"
    foreground: "#6c696e"
    cursor: "#6c696e"
}}