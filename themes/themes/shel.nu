export def main [] { return {
    separator: "#918988"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#6ca323" attr: "b" }
    empty: "#2c64a2"
    bool: {|| if $in { "#8feeb9" } else { "light_gray" } }
    int: "#918988"
    filesize: {|e|
      if $e == 0b {
        "#918988"
      } else if $e < 1mb {
        "#2ca363"
      } else {{ fg: "#2c64a2" }}
    }
    duration: "#918988"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ab2463" attr: "b" }
      } else if $in < 6hr {
        "#ab2463"
      } else if $in < 1day {
        "#ab6423"
      } else if $in < 3day {
        "#6ca323"
      } else if $in < 1wk {
        { fg: "#6ca323" attr: "b" }
      } else if $in < 6wk {
        "#2ca363"
      } else if $in < 52wk {
        "#2c64a2"
      } else { "dark_gray" }
    }
    range: "#918988"
    float: "#918988"
    string: "#918988"
    nothing: "#918988"
    binary: "#918988"
    cellpath: "#918988"
    row_index: { fg: "#6ca323" attr: "b" }
    record: "#918988"
    list: "#918988"
    block: "#918988"
    hints: "dark_gray"

    shape_and: { fg: "#6c24a2" attr: "b" }
    shape_binary: { fg: "#6c24a2" attr: "b" }
    shape_block: { fg: "#2c64a2" attr: "b" }
    shape_bool: "#8feeb9"
    shape_custom: "#6ca323"
    shape_datetime: { fg: "#2ca363" attr: "b" }
    shape_directory: "#2ca363"
    shape_external: "#2ca363"
    shape_externalarg: { fg: "#6ca323" attr: "b" }
    shape_filepath: "#2ca363"
    shape_flag: { fg: "#2c64a2" attr: "b" }
    shape_float: { fg: "#6c24a2" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#2ca363" attr: "b" }
    shape_int: { fg: "#6c24a2" attr: "b" }
    shape_internalcall: { fg: "#2ca363" attr: "b" }
    shape_list: { fg: "#2ca363" attr: "b" }
    shape_literal: "#2c64a2"
    shape_match_pattern: "#6ca323"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8feeb9"
    shape_operator: "#ab6423"
    shape_or: { fg: "#6c24a2" attr: "b" }
    shape_pipe: { fg: "#6c24a2" attr: "b" }
    shape_range: { fg: "#ab6423" attr: "b" }
    shape_record: { fg: "#2ca363" attr: "b" }
    shape_redirection: { fg: "#6c24a2" attr: "b" }
    shape_signature: { fg: "#6ca323" attr: "b" }
    shape_string: "#6ca323"
    shape_string_interpolation: { fg: "#2ca363" attr: "b" }
    shape_table: { fg: "#2c64a2" attr: "b" }
    shape_variable: "#6c24a2"

    background: "#2a201f"
    foreground: "#4882cd"
    cursor: "#4882cd"
}}