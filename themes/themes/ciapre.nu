export def main [] { return {
    separator: "#aea47f"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#48513b" attr: "b" }
    empty: "#576d8c"
    bool: {|| if $in { "#f3dbb2" } else { "light_gray" } }
    int: "#aea47f"
    filesize: {|e|
      if $e == 0b {
        "#aea47f"
      } else if $e < 1mb {
        "#5c4f4b"
      } else {{ fg: "#576d8c" }}
    }
    duration: "#aea47f"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#810009" attr: "b" }
      } else if $in < 6hr {
        "#810009"
      } else if $in < 1day {
        "#cc8b3f"
      } else if $in < 3day {
        "#48513b"
      } else if $in < 1wk {
        { fg: "#48513b" attr: "b" }
      } else if $in < 6wk {
        "#5c4f4b"
      } else if $in < 52wk {
        "#576d8c"
      } else { "dark_gray" }
    }
    range: "#aea47f"
    float: "#aea47f"
    string: "#aea47f"
    nothing: "#aea47f"
    binary: "#aea47f"
    cellpath: "#aea47f"
    row_index: { fg: "#48513b" attr: "b" }
    record: "#aea47f"
    list: "#aea47f"
    block: "#aea47f"
    hints: "dark_gray"

    shape_and: { fg: "#724d7c" attr: "b" }
    shape_binary: { fg: "#724d7c" attr: "b" }
    shape_block: { fg: "#576d8c" attr: "b" }
    shape_bool: "#f3dbb2"
    shape_custom: "#48513b"
    shape_datetime: { fg: "#5c4f4b" attr: "b" }
    shape_directory: "#5c4f4b"
    shape_external: "#5c4f4b"
    shape_externalarg: { fg: "#48513b" attr: "b" }
    shape_filepath: "#5c4f4b"
    shape_flag: { fg: "#576d8c" attr: "b" }
    shape_float: { fg: "#724d7c" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5c4f4b" attr: "b" }
    shape_int: { fg: "#724d7c" attr: "b" }
    shape_internalcall: { fg: "#5c4f4b" attr: "b" }
    shape_list: { fg: "#5c4f4b" attr: "b" }
    shape_literal: "#576d8c"
    shape_match_pattern: "#48513b"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#f3dbb2"
    shape_operator: "#cc8b3f"
    shape_or: { fg: "#724d7c" attr: "b" }
    shape_pipe: { fg: "#724d7c" attr: "b" }
    shape_range: { fg: "#cc8b3f" attr: "b" }
    shape_record: { fg: "#5c4f4b" attr: "b" }
    shape_redirection: { fg: "#724d7c" attr: "b" }
    shape_signature: { fg: "#48513b" attr: "b" }
    shape_string: "#48513b"
    shape_string_interpolation: { fg: "#5c4f4b" attr: "b" }
    shape_table: { fg: "#576d8c" attr: "b" }
    shape_variable: "#724d7c"

    background: "#191c27"
    foreground: "#aea47a"
    cursor: "#aea47a"
}}