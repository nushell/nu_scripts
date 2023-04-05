export def main [] { return {
    separator: "#c1c1c1"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#dd9999" attr: "b" }
    empty: "#888888"
    bool: {|| if $in { "#aaaaaa" } else { "light_gray" } }
    int: "#c1c1c1"
    filesize: {|e|
      if $e == 0b {
        "#c1c1c1"
      } else if $e < 1mb {
        "#aaaaaa"
      } else {{ fg: "#888888" }}
    }
    duration: "#c1c1c1"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#5f8787" attr: "b" }
      } else if $in < 6hr {
        "#5f8787"
      } else if $in < 1day {
        "#a06666"
      } else if $in < 3day {
        "#dd9999"
      } else if $in < 1wk {
        { fg: "#dd9999" attr: "b" }
      } else if $in < 6wk {
        "#aaaaaa"
      } else if $in < 52wk {
        "#888888"
      } else { "dark_gray" }
    }
    range: "#c1c1c1"
    float: "#c1c1c1"
    string: "#c1c1c1"
    nothing: "#c1c1c1"
    binary: "#c1c1c1"
    cellpath: "#c1c1c1"
    row_index: { fg: "#dd9999" attr: "b" }
    record: "#c1c1c1"
    list: "#c1c1c1"
    block: "#c1c1c1"
    hints: "dark_gray"

    shape_and: { fg: "#999999" attr: "b" }
    shape_binary: { fg: "#999999" attr: "b" }
    shape_block: { fg: "#888888" attr: "b" }
    shape_bool: "#aaaaaa"
    shape_custom: "#dd9999"
    shape_datetime: { fg: "#aaaaaa" attr: "b" }
    shape_directory: "#aaaaaa"
    shape_external: "#aaaaaa"
    shape_externalarg: { fg: "#dd9999" attr: "b" }
    shape_filepath: "#aaaaaa"
    shape_flag: { fg: "#888888" attr: "b" }
    shape_float: { fg: "#999999" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#aaaaaa" attr: "b" }
    shape_int: { fg: "#999999" attr: "b" }
    shape_internalcall: { fg: "#aaaaaa" attr: "b" }
    shape_list: { fg: "#aaaaaa" attr: "b" }
    shape_literal: "#888888"
    shape_match_pattern: "#dd9999"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#aaaaaa"
    shape_operator: "#a06666"
    shape_or: { fg: "#999999" attr: "b" }
    shape_pipe: { fg: "#999999" attr: "b" }
    shape_range: { fg: "#a06666" attr: "b" }
    shape_record: { fg: "#aaaaaa" attr: "b" }
    shape_redirection: { fg: "#999999" attr: "b" }
    shape_signature: { fg: "#dd9999" attr: "b" }
    shape_string: "#dd9999"
    shape_string_interpolation: { fg: "#aaaaaa" attr: "b" }
    shape_table: { fg: "#888888" attr: "b" }
    shape_variable: "#999999"

    background: "#000000"
    foreground: "#c1c1c1"
    cursor: "#c1c1c1"
}}