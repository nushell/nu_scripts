export def main [] { return {
    separator: "#cbd6e2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#56bf8b" attr: "b" }
    empty: "#8b56bf"
    bool: {|| if $in { "#568bbf" } else { "light_gray" } }
    int: "#cbd6e2"
    filesize: {|e|
      if $e == 0b {
        "#cbd6e2"
      } else if $e < 1mb {
        "#568bbf"
      } else {{ fg: "#8b56bf" }}
    }
    duration: "#cbd6e2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#bf8b56" attr: "b" }
      } else if $in < 6hr {
        "#bf8b56"
      } else if $in < 1day {
        "#8bbf56"
      } else if $in < 3day {
        "#56bf8b"
      } else if $in < 1wk {
        { fg: "#56bf8b" attr: "b" }
      } else if $in < 6wk {
        "#568bbf"
      } else if $in < 52wk {
        "#8b56bf"
      } else { "dark_gray" }
    }
    range: "#cbd6e2"
    float: "#cbd6e2"
    string: "#cbd6e2"
    nothing: "#cbd6e2"
    binary: "#cbd6e2"
    cellpath: "#cbd6e2"
    row_index: { fg: "#56bf8b" attr: "b" }
    record: "#cbd6e2"
    list: "#cbd6e2"
    block: "#cbd6e2"
    hints: "dark_gray"

    shape_and: { fg: "#bf568b" attr: "b" }
    shape_binary: { fg: "#bf568b" attr: "b" }
    shape_block: { fg: "#8b56bf" attr: "b" }
    shape_bool: "#568bbf"
    shape_custom: "#56bf8b"
    shape_datetime: { fg: "#568bbf" attr: "b" }
    shape_directory: "#568bbf"
    shape_external: "#568bbf"
    shape_externalarg: { fg: "#56bf8b" attr: "b" }
    shape_filepath: "#568bbf"
    shape_flag: { fg: "#8b56bf" attr: "b" }
    shape_float: { fg: "#bf568b" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#568bbf" attr: "b" }
    shape_int: { fg: "#bf568b" attr: "b" }
    shape_internalcall: { fg: "#568bbf" attr: "b" }
    shape_list: { fg: "#568bbf" attr: "b" }
    shape_literal: "#8b56bf"
    shape_match_pattern: "#56bf8b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#568bbf"
    shape_operator: "#8bbf56"
    shape_or: { fg: "#bf568b" attr: "b" }
    shape_pipe: { fg: "#bf568b" attr: "b" }
    shape_range: { fg: "#8bbf56" attr: "b" }
    shape_record: { fg: "#568bbf" attr: "b" }
    shape_redirection: { fg: "#bf568b" attr: "b" }
    shape_signature: { fg: "#56bf8b" attr: "b" }
    shape_string: "#56bf8b"
    shape_string_interpolation: { fg: "#568bbf" attr: "b" }
    shape_table: { fg: "#8b56bf" attr: "b" }
    shape_variable: "#bf568b"

    background: "#0b1c2c"
    foreground: "#cbd6e2"
    cursor: "#cbd6e2"
}}