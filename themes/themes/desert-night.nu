export def main [] { return {
    separator: "#87765d"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#99b05f" attr: "b" }
    empty: "#949fb4"
    bool: {|| if $in { "#bfab36" } else { "light_gray" } }
    int: "#87765d"
    filesize: {|e|
      if $e == 0b {
        "#87765d"
      } else if $e < 1mb {
        "#bfab36"
      } else {{ fg: "#949fb4" }}
    }
    duration: "#87765d"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e56b55" attr: "b" }
      } else if $in < 6hr {
        "#e56b55"
      } else if $in < 1day {
        "#e18245"
      } else if $in < 3day {
        "#99b05f"
      } else if $in < 1wk {
        { fg: "#99b05f" attr: "b" }
      } else if $in < 6wk {
        "#bfab36"
      } else if $in < 52wk {
        "#949fb4"
      } else { "dark_gray" }
    }
    range: "#87765d"
    float: "#87765d"
    string: "#87765d"
    nothing: "#87765d"
    binary: "#87765d"
    cellpath: "#87765d"
    row_index: { fg: "#99b05f" attr: "b" }
    record: "#87765d"
    list: "#87765d"
    block: "#87765d"
    hints: "dark_gray"

    shape_and: { fg: "#d261a5" attr: "b" }
    shape_binary: { fg: "#d261a5" attr: "b" }
    shape_block: { fg: "#949fb4" attr: "b" }
    shape_bool: "#bfab36"
    shape_custom: "#99b05f"
    shape_datetime: { fg: "#bfab36" attr: "b" }
    shape_directory: "#bfab36"
    shape_external: "#bfab36"
    shape_externalarg: { fg: "#99b05f" attr: "b" }
    shape_filepath: "#bfab36"
    shape_flag: { fg: "#949fb4" attr: "b" }
    shape_float: { fg: "#d261a5" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#bfab36" attr: "b" }
    shape_int: { fg: "#d261a5" attr: "b" }
    shape_internalcall: { fg: "#bfab36" attr: "b" }
    shape_list: { fg: "#bfab36" attr: "b" }
    shape_literal: "#949fb4"
    shape_match_pattern: "#99b05f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#bfab36"
    shape_operator: "#e18245"
    shape_or: { fg: "#d261a5" attr: "b" }
    shape_pipe: { fg: "#d261a5" attr: "b" }
    shape_range: { fg: "#e18245" attr: "b" }
    shape_record: { fg: "#bfab36" attr: "b" }
    shape_redirection: { fg: "#d261a5" attr: "b" }
    shape_signature: { fg: "#99b05f" attr: "b" }
    shape_string: "#99b05f"
    shape_string_interpolation: { fg: "#bfab36" attr: "b" }
    shape_table: { fg: "#949fb4" attr: "b" }
    shape_variable: "#d261a5"

    background: "#24221c"
    foreground: "#d4b07b"
    cursor: "#d4b07b"
}}