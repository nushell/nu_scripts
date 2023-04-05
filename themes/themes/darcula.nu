export def main [] { return {
    separator: "#a9b7c6"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6a8759" attr: "b" }
    empty: "#9876aa"
    bool: {|| if $in { "#629755" } else { "light_gray" } }
    int: "#a9b7c6"
    filesize: {|e|
      if $e == 0b {
        "#a9b7c6"
      } else if $e < 1mb {
        "#629755"
      } else {{ fg: "#9876aa" }}
    }
    duration: "#a9b7c6"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#4eade5" attr: "b" }
      } else if $in < 6hr {
        "#4eade5"
      } else if $in < 1day {
        "#bbb529"
      } else if $in < 3day {
        "#6a8759"
      } else if $in < 1wk {
        { fg: "#6a8759" attr: "b" }
      } else if $in < 6wk {
        "#629755"
      } else if $in < 52wk {
        "#9876aa"
      } else { "dark_gray" }
    }
    range: "#a9b7c6"
    float: "#a9b7c6"
    string: "#a9b7c6"
    nothing: "#a9b7c6"
    binary: "#a9b7c6"
    cellpath: "#a9b7c6"
    row_index: { fg: "#6a8759" attr: "b" }
    record: "#a9b7c6"
    list: "#a9b7c6"
    block: "#a9b7c6"
    hints: "dark_gray"

    shape_and: { fg: "#cc7832" attr: "b" }
    shape_binary: { fg: "#cc7832" attr: "b" }
    shape_block: { fg: "#9876aa" attr: "b" }
    shape_bool: "#629755"
    shape_custom: "#6a8759"
    shape_datetime: { fg: "#629755" attr: "b" }
    shape_directory: "#629755"
    shape_external: "#629755"
    shape_externalarg: { fg: "#6a8759" attr: "b" }
    shape_filepath: "#629755"
    shape_flag: { fg: "#9876aa" attr: "b" }
    shape_float: { fg: "#cc7832" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#629755" attr: "b" }
    shape_int: { fg: "#cc7832" attr: "b" }
    shape_internalcall: { fg: "#629755" attr: "b" }
    shape_list: { fg: "#629755" attr: "b" }
    shape_literal: "#9876aa"
    shape_match_pattern: "#6a8759"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#629755"
    shape_operator: "#bbb529"
    shape_or: { fg: "#cc7832" attr: "b" }
    shape_pipe: { fg: "#cc7832" attr: "b" }
    shape_range: { fg: "#bbb529" attr: "b" }
    shape_record: { fg: "#629755" attr: "b" }
    shape_redirection: { fg: "#cc7832" attr: "b" }
    shape_signature: { fg: "#6a8759" attr: "b" }
    shape_string: "#6a8759"
    shape_string_interpolation: { fg: "#629755" attr: "b" }
    shape_table: { fg: "#9876aa" attr: "b" }
    shape_variable: "#cc7832"

    background: "#2b2b2b"
    foreground: "#a9b7c6"
    cursor: "#a9b7c6"
}}