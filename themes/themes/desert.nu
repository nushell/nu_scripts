export def main [] { return {
    separator: "#f5deb3"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#98fb98" attr: "b" }
    empty: "#cd853f"
    bool: {|| if $in { "#ffd700" } else { "light_gray" } }
    int: "#f5deb3"
    filesize: {|e|
      if $e == 0b {
        "#f5deb3"
      } else if $e < 1mb {
        "#ffa0a0"
      } else {{ fg: "#cd853f" }}
    }
    duration: "#f5deb3"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff2b2b" attr: "b" }
      } else if $in < 6hr {
        "#ff2b2b"
      } else if $in < 1day {
        "#f0e68c"
      } else if $in < 3day {
        "#98fb98"
      } else if $in < 1wk {
        { fg: "#98fb98" attr: "b" }
      } else if $in < 6wk {
        "#ffa0a0"
      } else if $in < 52wk {
        "#cd853f"
      } else { "dark_gray" }
    }
    range: "#f5deb3"
    float: "#f5deb3"
    string: "#f5deb3"
    nothing: "#f5deb3"
    binary: "#f5deb3"
    cellpath: "#f5deb3"
    row_index: { fg: "#98fb98" attr: "b" }
    record: "#f5deb3"
    list: "#f5deb3"
    block: "#f5deb3"
    hints: "dark_gray"

    shape_and: { fg: "#ffdead" attr: "b" }
    shape_binary: { fg: "#ffdead" attr: "b" }
    shape_block: { fg: "#cd853f" attr: "b" }
    shape_bool: "#ffd700"
    shape_custom: "#98fb98"
    shape_datetime: { fg: "#ffa0a0" attr: "b" }
    shape_directory: "#ffa0a0"
    shape_external: "#ffa0a0"
    shape_externalarg: { fg: "#98fb98" attr: "b" }
    shape_filepath: "#ffa0a0"
    shape_flag: { fg: "#cd853f" attr: "b" }
    shape_float: { fg: "#ffdead" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ffa0a0" attr: "b" }
    shape_int: { fg: "#ffdead" attr: "b" }
    shape_internalcall: { fg: "#ffa0a0" attr: "b" }
    shape_list: { fg: "#ffa0a0" attr: "b" }
    shape_literal: "#cd853f"
    shape_match_pattern: "#98fb98"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ffd700"
    shape_operator: "#f0e68c"
    shape_or: { fg: "#ffdead" attr: "b" }
    shape_pipe: { fg: "#ffdead" attr: "b" }
    shape_range: { fg: "#f0e68c" attr: "b" }
    shape_record: { fg: "#ffa0a0" attr: "b" }
    shape_redirection: { fg: "#ffdead" attr: "b" }
    shape_signature: { fg: "#98fb98" attr: "b" }
    shape_string: "#98fb98"
    shape_string_interpolation: { fg: "#ffa0a0" attr: "b" }
    shape_table: { fg: "#cd853f" attr: "b" }
    shape_variable: "#ffdead"

    background: "#333333"
    foreground: "#ffffff"
    cursor: "#ffffff"
}}