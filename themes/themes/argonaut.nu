export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8ce10b" attr: "b" }
    empty: "#008df8"
    bool: {|| if $in { "#67fff0" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#00d8eb"
      } else {{ fg: "#008df8" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff000f" attr: "b" }
      } else if $in < 6hr {
        "#ff000f"
      } else if $in < 1day {
        "#ffb900"
      } else if $in < 3day {
        "#8ce10b"
      } else if $in < 1wk {
        { fg: "#8ce10b" attr: "b" }
      } else if $in < 6wk {
        "#00d8eb"
      } else if $in < 52wk {
        "#008df8"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#8ce10b" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#6d43a6" attr: "b" }
    shape_binary: { fg: "#6d43a6" attr: "b" }
    shape_block: { fg: "#008df8" attr: "b" }
    shape_bool: "#67fff0"
    shape_custom: "#8ce10b"
    shape_datetime: { fg: "#00d8eb" attr: "b" }
    shape_directory: "#00d8eb"
    shape_external: "#00d8eb"
    shape_externalarg: { fg: "#8ce10b" attr: "b" }
    shape_filepath: "#00d8eb"
    shape_flag: { fg: "#008df8" attr: "b" }
    shape_float: { fg: "#6d43a6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#00d8eb" attr: "b" }
    shape_int: { fg: "#6d43a6" attr: "b" }
    shape_internalcall: { fg: "#00d8eb" attr: "b" }
    shape_list: { fg: "#00d8eb" attr: "b" }
    shape_literal: "#008df8"
    shape_match_pattern: "#8ce10b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#67fff0"
    shape_operator: "#ffb900"
    shape_or: { fg: "#6d43a6" attr: "b" }
    shape_pipe: { fg: "#6d43a6" attr: "b" }
    shape_range: { fg: "#ffb900" attr: "b" }
    shape_record: { fg: "#00d8eb" attr: "b" }
    shape_redirection: { fg: "#6d43a6" attr: "b" }
    shape_signature: { fg: "#8ce10b" attr: "b" }
    shape_string: "#8ce10b"
    shape_string_interpolation: { fg: "#00d8eb" attr: "b" }
    shape_table: { fg: "#008df8" attr: "b" }
    shape_variable: "#6d43a6"

    background: "#0e1019"
    foreground: "#fffaf4"
    cursor: "#fffaf4"
}}