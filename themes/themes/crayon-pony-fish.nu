export def main [] { return {
    separator: "#68525a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#579524" attr: "b" }
    empty: "#8c87b0"
    bool: {|| if $in { "#ffceaf" } else { "light_gray" } }
    int: "#68525a"
    filesize: {|e|
      if $e == 0b {
        "#68525a"
      } else if $e < 1mb {
        "#e8a866"
      } else {{ fg: "#8c87b0" }}
    }
    duration: "#68525a"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#91002b" attr: "b" }
      } else if $in < 6hr {
        "#91002b"
      } else if $in < 1day {
        "#ab311b"
      } else if $in < 3day {
        "#579524"
      } else if $in < 1wk {
        { fg: "#579524" attr: "b" }
      } else if $in < 6wk {
        "#e8a866"
      } else if $in < 52wk {
        "#8c87b0"
      } else { "dark_gray" }
    }
    range: "#68525a"
    float: "#68525a"
    string: "#68525a"
    nothing: "#68525a"
    binary: "#68525a"
    cellpath: "#68525a"
    row_index: { fg: "#579524" attr: "b" }
    record: "#68525a"
    list: "#68525a"
    block: "#68525a"
    hints: "dark_gray"

    shape_and: { fg: "#692f50" attr: "b" }
    shape_binary: { fg: "#692f50" attr: "b" }
    shape_block: { fg: "#8c87b0" attr: "b" }
    shape_bool: "#ffceaf"
    shape_custom: "#579524"
    shape_datetime: { fg: "#e8a866" attr: "b" }
    shape_directory: "#e8a866"
    shape_external: "#e8a866"
    shape_externalarg: { fg: "#579524" attr: "b" }
    shape_filepath: "#e8a866"
    shape_flag: { fg: "#8c87b0" attr: "b" }
    shape_float: { fg: "#692f50" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#e8a866" attr: "b" }
    shape_int: { fg: "#692f50" attr: "b" }
    shape_internalcall: { fg: "#e8a866" attr: "b" }
    shape_list: { fg: "#e8a866" attr: "b" }
    shape_literal: "#8c87b0"
    shape_match_pattern: "#579524"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ffceaf"
    shape_operator: "#ab311b"
    shape_or: { fg: "#692f50" attr: "b" }
    shape_pipe: { fg: "#692f50" attr: "b" }
    shape_range: { fg: "#ab311b" attr: "b" }
    shape_record: { fg: "#e8a866" attr: "b" }
    shape_redirection: { fg: "#692f50" attr: "b" }
    shape_signature: { fg: "#579524" attr: "b" }
    shape_string: "#579524"
    shape_string_interpolation: { fg: "#e8a866" attr: "b" }
    shape_table: { fg: "#8c87b0" attr: "b" }
    shape_variable: "#692f50"

    background: "#150707"
    foreground: "#68525a"
    cursor: "#68525a"
}}