export def main [] { return {
    separator: "#bfbfbf"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#2baf2b" attr: "b" }
    empty: "#246eb2"
    bool: {|| if $in { "#00e5e5" } else { "light_gray" } }
    int: "#bfbfbf"
    filesize: {|e|
      if $e == 0b {
        "#bfbfbf"
      } else if $e < 1mb {
        "#00acee"
      } else {{ fg: "#246eb2" }}
    }
    duration: "#bfbfbf"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ef5734" attr: "b" }
      } else if $in < 6hr {
        "#ef5734"
      } else if $in < 1day {
        "#bebf00"
      } else if $in < 3day {
        "#2baf2b"
      } else if $in < 1wk {
        { fg: "#2baf2b" attr: "b" }
      } else if $in < 6wk {
        "#00acee"
      } else if $in < 52wk {
        "#246eb2"
      } else { "dark_gray" }
    }
    range: "#bfbfbf"
    float: "#bfbfbf"
    string: "#bfbfbf"
    nothing: "#bfbfbf"
    binary: "#bfbfbf"
    cellpath: "#bfbfbf"
    row_index: { fg: "#2baf2b" attr: "b" }
    record: "#bfbfbf"
    list: "#bfbfbf"
    block: "#bfbfbf"
    hints: "dark_gray"

    shape_and: { fg: "#d05ec1" attr: "b" }
    shape_binary: { fg: "#d05ec1" attr: "b" }
    shape_block: { fg: "#246eb2" attr: "b" }
    shape_bool: "#00e5e5"
    shape_custom: "#2baf2b"
    shape_datetime: { fg: "#00acee" attr: "b" }
    shape_directory: "#00acee"
    shape_external: "#00acee"
    shape_externalarg: { fg: "#2baf2b" attr: "b" }
    shape_filepath: "#00acee"
    shape_flag: { fg: "#246eb2" attr: "b" }
    shape_float: { fg: "#d05ec1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00acee" attr: "b" }
    shape_int: { fg: "#d05ec1" attr: "b" }
    shape_internalcall: { fg: "#00acee" attr: "b" }
    shape_list: { fg: "#00acee" attr: "b" }
    shape_literal: "#246eb2"
    shape_match_pattern: "#2baf2b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00e5e5"
    shape_operator: "#bebf00"
    shape_or: { fg: "#d05ec1" attr: "b" }
    shape_pipe: { fg: "#d05ec1" attr: "b" }
    shape_range: { fg: "#bebf00" attr: "b" }
    shape_record: { fg: "#00acee" attr: "b" }
    shape_redirection: { fg: "#d05ec1" attr: "b" }
    shape_signature: { fg: "#2baf2b" attr: "b" }
    shape_string: "#2baf2b"
    shape_string_interpolation: { fg: "#00acee" attr: "b" }
    shape_table: { fg: "#246eb2" attr: "b" }
    shape_variable: "#d05ec1"

    background: "#2c1d16"
    foreground: "#ffcc2f"
    cursor: "#ffcc2f"
}}