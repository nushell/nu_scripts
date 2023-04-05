export def main [] { return {
    separator: "#a89984"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#528b8b" attr: "b" }
    empty: "#83a598"
    bool: {|| if $in { "#83a598" } else { "light_gray" } }
    int: "#a89984"
    filesize: {|e|
      if $e == 0b {
        "#a89984"
      } else if $e < 1mb {
        "#83a598"
      } else {{ fg: "#83a598" }}
    }
    duration: "#a89984"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#83a598" attr: "b" }
      } else if $in < 6hr {
        "#83a598"
      } else if $in < 1day {
        "#a07e3b"
      } else if $in < 3day {
        "#528b8b"
      } else if $in < 1wk {
        { fg: "#528b8b" attr: "b" }
      } else if $in < 6wk {
        "#83a598"
      } else if $in < 52wk {
        "#83a598"
      } else { "dark_gray" }
    }
    range: "#a89984"
    float: "#a89984"
    string: "#a89984"
    nothing: "#a89984"
    binary: "#a89984"
    cellpath: "#a89984"
    row_index: { fg: "#528b8b" attr: "b" }
    record: "#a89984"
    list: "#a89984"
    block: "#a89984"
    hints: "dark_gray"

    shape_and: { fg: "#d75f5f" attr: "b" }
    shape_binary: { fg: "#d75f5f" attr: "b" }
    shape_block: { fg: "#83a598" attr: "b" }
    shape_bool: "#83a598"
    shape_custom: "#528b8b"
    shape_datetime: { fg: "#83a598" attr: "b" }
    shape_directory: "#83a598"
    shape_external: "#83a598"
    shape_externalarg: { fg: "#528b8b" attr: "b" }
    shape_filepath: "#83a598"
    shape_flag: { fg: "#83a598" attr: "b" }
    shape_float: { fg: "#d75f5f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#83a598" attr: "b" }
    shape_int: { fg: "#d75f5f" attr: "b" }
    shape_internalcall: { fg: "#83a598" attr: "b" }
    shape_list: { fg: "#83a598" attr: "b" }
    shape_literal: "#83a598"
    shape_match_pattern: "#528b8b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#83a598"
    shape_operator: "#a07e3b"
    shape_or: { fg: "#d75f5f" attr: "b" }
    shape_pipe: { fg: "#d75f5f" attr: "b" }
    shape_range: { fg: "#a07e3b" attr: "b" }
    shape_record: { fg: "#83a598" attr: "b" }
    shape_redirection: { fg: "#d75f5f" attr: "b" }
    shape_signature: { fg: "#528b8b" attr: "b" }
    shape_string: "#528b8b"
    shape_string_interpolation: { fg: "#83a598" attr: "b" }
    shape_table: { fg: "#83a598" attr: "b" }
    shape_variable: "#d75f5f"

    background: "#282c34"
    foreground: "#a89984"
    cursor: "#a89984"
}}