export def main [] { return {
    separator: "#deb88d"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#027c9b" attr: "b" }
    empty: "#1e4950"
    bool: {|| if $in { "#87acb4" } else { "light_gray" } }
    int: "#deb88d"
    filesize: {|e|
      if $e == 0b {
        "#deb88d"
      } else if $e < 1mb {
        "#50a3b5"
      } else {{ fg: "#1e4950" }}
    }
    duration: "#deb88d"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d15123" attr: "b" }
      } else if $in < 6hr {
        "#d15123"
      } else if $in < 1day {
        "#fca02f"
      } else if $in < 3day {
        "#027c9b"
      } else if $in < 1wk {
        { fg: "#027c9b" attr: "b" }
      } else if $in < 6wk {
        "#50a3b5"
      } else if $in < 52wk {
        "#1e4950"
      } else { "dark_gray" }
    }
    range: "#deb88d"
    float: "#deb88d"
    string: "#deb88d"
    nothing: "#deb88d"
    binary: "#deb88d"
    cellpath: "#deb88d"
    row_index: { fg: "#027c9b" attr: "b" }
    record: "#deb88d"
    list: "#deb88d"
    block: "#deb88d"
    hints: "dark_gray"

    shape_and: { fg: "#68d4f1" attr: "b" }
    shape_binary: { fg: "#68d4f1" attr: "b" }
    shape_block: { fg: "#1e4950" attr: "b" }
    shape_bool: "#87acb4"
    shape_custom: "#027c9b"
    shape_datetime: { fg: "#50a3b5" attr: "b" }
    shape_directory: "#50a3b5"
    shape_external: "#50a3b5"
    shape_externalarg: { fg: "#027c9b" attr: "b" }
    shape_filepath: "#50a3b5"
    shape_flag: { fg: "#1e4950" attr: "b" }
    shape_float: { fg: "#68d4f1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#50a3b5" attr: "b" }
    shape_int: { fg: "#68d4f1" attr: "b" }
    shape_internalcall: { fg: "#50a3b5" attr: "b" }
    shape_list: { fg: "#50a3b5" attr: "b" }
    shape_literal: "#1e4950"
    shape_match_pattern: "#027c9b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#87acb4"
    shape_operator: "#fca02f"
    shape_or: { fg: "#68d4f1" attr: "b" }
    shape_pipe: { fg: "#68d4f1" attr: "b" }
    shape_range: { fg: "#fca02f" attr: "b" }
    shape_record: { fg: "#50a3b5" attr: "b" }
    shape_redirection: { fg: "#68d4f1" attr: "b" }
    shape_signature: { fg: "#027c9b" attr: "b" }
    shape_string: "#027c9b"
    shape_string_interpolation: { fg: "#50a3b5" attr: "b" }
    shape_table: { fg: "#1e4950" attr: "b" }
    shape_variable: "#68d4f1"

    background: "#09141b"
    foreground: "#deb88d"
    cursor: "#deb88d"
}}