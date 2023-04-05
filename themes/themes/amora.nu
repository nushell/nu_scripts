export def main [] { return {
    separator: "#dedbeb"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a2baa8" attr: "b" }
    empty: "#9985d1"
    bool: {|| if $in { "#c4d1f5" } else { "light_gray" } }
    int: "#dedbeb"
    filesize: {|e|
      if $e == 0b {
        "#dedbeb"
      } else if $e < 1mb {
        "#aabae7"
      } else {{ fg: "#9985d1" }}
    }
    duration: "#dedbeb"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ed3f7f" attr: "b" }
      } else if $in < 6hr {
        "#ed3f7f"
      } else if $in < 1day {
        "#eacac0"
      } else if $in < 3day {
        "#a2baa8"
      } else if $in < 1wk {
        { fg: "#a2baa8" attr: "b" }
      } else if $in < 6wk {
        "#aabae7"
      } else if $in < 52wk {
        "#9985d1"
      } else { "dark_gray" }
    }
    range: "#dedbeb"
    float: "#dedbeb"
    string: "#dedbeb"
    nothing: "#dedbeb"
    binary: "#dedbeb"
    cellpath: "#dedbeb"
    row_index: { fg: "#a2baa8" attr: "b" }
    record: "#dedbeb"
    list: "#dedbeb"
    block: "#dedbeb"
    hints: "dark_gray"

    shape_and: { fg: "#e68ac1" attr: "b" }
    shape_binary: { fg: "#e68ac1" attr: "b" }
    shape_block: { fg: "#9985d1" attr: "b" }
    shape_bool: "#c4d1f5"
    shape_custom: "#a2baa8"
    shape_datetime: { fg: "#aabae7" attr: "b" }
    shape_directory: "#aabae7"
    shape_external: "#aabae7"
    shape_externalarg: { fg: "#a2baa8" attr: "b" }
    shape_filepath: "#aabae7"
    shape_flag: { fg: "#9985d1" attr: "b" }
    shape_float: { fg: "#e68ac1" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#aabae7" attr: "b" }
    shape_int: { fg: "#e68ac1" attr: "b" }
    shape_internalcall: { fg: "#aabae7" attr: "b" }
    shape_list: { fg: "#aabae7" attr: "b" }
    shape_literal: "#9985d1"
    shape_match_pattern: "#a2baa8"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#c4d1f5"
    shape_operator: "#eacac0"
    shape_or: { fg: "#e68ac1" attr: "b" }
    shape_pipe: { fg: "#e68ac1" attr: "b" }
    shape_range: { fg: "#eacac0" attr: "b" }
    shape_record: { fg: "#aabae7" attr: "b" }
    shape_redirection: { fg: "#e68ac1" attr: "b" }
    shape_signature: { fg: "#a2baa8" attr: "b" }
    shape_string: "#a2baa8"
    shape_string_interpolation: { fg: "#aabae7" attr: "b" }
    shape_table: { fg: "#9985d1" attr: "b" }
    shape_variable: "#e68ac1"

    background: "#2a2331"
    foreground: "#dedbeb"
    cursor: "#dedbeb"
}}