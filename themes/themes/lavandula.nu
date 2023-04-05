export def main [] { return {
    separator: "#736e7d"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#337e6f" attr: "b" }
    empty: "#4f4a7f"
    bool: {|| if $in { "#9ad4e0" } else { "light_gray" } }
    int: "#736e7d"
    filesize: {|e|
      if $e == 0b {
        "#736e7d"
      } else if $e < 1mb {
        "#58777f"
      } else {{ fg: "#4f4a7f" }}
    }
    duration: "#736e7d"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#7d1625" attr: "b" }
      } else if $in < 6hr {
        "#7d1625"
      } else if $in < 1day {
        "#7f6f49"
      } else if $in < 3day {
        "#337e6f"
      } else if $in < 1wk {
        { fg: "#337e6f" attr: "b" }
      } else if $in < 6wk {
        "#58777f"
      } else if $in < 52wk {
        "#4f4a7f"
      } else { "dark_gray" }
    }
    range: "#736e7d"
    float: "#736e7d"
    string: "#736e7d"
    nothing: "#736e7d"
    binary: "#736e7d"
    cellpath: "#736e7d"
    row_index: { fg: "#337e6f" attr: "b" }
    record: "#736e7d"
    list: "#736e7d"
    block: "#736e7d"
    hints: "dark_gray"

    shape_and: { fg: "#5a3f7f" attr: "b" }
    shape_binary: { fg: "#5a3f7f" attr: "b" }
    shape_block: { fg: "#4f4a7f" attr: "b" }
    shape_bool: "#9ad4e0"
    shape_custom: "#337e6f"
    shape_datetime: { fg: "#58777f" attr: "b" }
    shape_directory: "#58777f"
    shape_external: "#58777f"
    shape_externalarg: { fg: "#337e6f" attr: "b" }
    shape_filepath: "#58777f"
    shape_flag: { fg: "#4f4a7f" attr: "b" }
    shape_float: { fg: "#5a3f7f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#58777f" attr: "b" }
    shape_int: { fg: "#5a3f7f" attr: "b" }
    shape_internalcall: { fg: "#58777f" attr: "b" }
    shape_list: { fg: "#58777f" attr: "b" }
    shape_literal: "#4f4a7f"
    shape_match_pattern: "#337e6f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#9ad4e0"
    shape_operator: "#7f6f49"
    shape_or: { fg: "#5a3f7f" attr: "b" }
    shape_pipe: { fg: "#5a3f7f" attr: "b" }
    shape_range: { fg: "#7f6f49" attr: "b" }
    shape_record: { fg: "#58777f" attr: "b" }
    shape_redirection: { fg: "#5a3f7f" attr: "b" }
    shape_signature: { fg: "#337e6f" attr: "b" }
    shape_string: "#337e6f"
    shape_string_interpolation: { fg: "#58777f" attr: "b" }
    shape_table: { fg: "#4f4a7f" attr: "b" }
    shape_variable: "#5a3f7f"

    background: "#050014"
    foreground: "#736e7d"
    cursor: "#736e7d"
}}