export def main [] { return {
    separator: "#b7bec9"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#a1bf78" attr: "b" }
    empty: "#73b3e7"
    bool: {|| if $in { "#5ebaa5" } else { "light_gray" } }
    int: "#b7bec9"
    filesize: {|e|
      if $e == 0b {
        "#b7bec9"
      } else if $e < 1mb {
        "#5ebaa5"
      } else {{ fg: "#73b3e7" }}
    }
    duration: "#b7bec9"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#e77171" attr: "b" }
      } else if $in < 6hr {
        "#e77171"
      } else if $in < 1day {
        "#dbb774"
      } else if $in < 3day {
        "#a1bf78"
      } else if $in < 1wk {
        { fg: "#a1bf78" attr: "b" }
      } else if $in < 6wk {
        "#5ebaa5"
      } else if $in < 52wk {
        "#73b3e7"
      } else { "dark_gray" }
    }
    range: "#b7bec9"
    float: "#b7bec9"
    string: "#b7bec9"
    nothing: "#b7bec9"
    binary: "#b7bec9"
    cellpath: "#b7bec9"
    row_index: { fg: "#a1bf78" attr: "b" }
    record: "#b7bec9"
    list: "#b7bec9"
    block: "#b7bec9"
    hints: "dark_gray"

    shape_and: { fg: "#d390e7" attr: "b" }
    shape_binary: { fg: "#d390e7" attr: "b" }
    shape_block: { fg: "#73b3e7" attr: "b" }
    shape_bool: "#5ebaa5"
    shape_custom: "#a1bf78"
    shape_datetime: { fg: "#5ebaa5" attr: "b" }
    shape_directory: "#5ebaa5"
    shape_external: "#5ebaa5"
    shape_externalarg: { fg: "#a1bf78" attr: "b" }
    shape_filepath: "#5ebaa5"
    shape_flag: { fg: "#73b3e7" attr: "b" }
    shape_float: { fg: "#d390e7" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5ebaa5" attr: "b" }
    shape_int: { fg: "#d390e7" attr: "b" }
    shape_internalcall: { fg: "#5ebaa5" attr: "b" }
    shape_list: { fg: "#5ebaa5" attr: "b" }
    shape_literal: "#73b3e7"
    shape_match_pattern: "#a1bf78"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5ebaa5"
    shape_operator: "#dbb774"
    shape_or: { fg: "#d390e7" attr: "b" }
    shape_pipe: { fg: "#d390e7" attr: "b" }
    shape_range: { fg: "#dbb774" attr: "b" }
    shape_record: { fg: "#5ebaa5" attr: "b" }
    shape_redirection: { fg: "#d390e7" attr: "b" }
    shape_signature: { fg: "#a1bf78" attr: "b" }
    shape_string: "#a1bf78"
    shape_string_interpolation: { fg: "#5ebaa5" attr: "b" }
    shape_table: { fg: "#73b3e7" attr: "b" }
    shape_variable: "#d390e7"

    background: "#262729"
    foreground: "#b7bec9"
    cursor: "#b7bec9"
}}