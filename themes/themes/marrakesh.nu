export def main [] { return {
    separator: "#948e48"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#18974e" attr: "b" }
    empty: "#477ca1"
    bool: {|| if $in { "#75a738" } else { "light_gray" } }
    int: "#948e48"
    filesize: {|e|
      if $e == 0b {
        "#948e48"
      } else if $e < 1mb {
        "#75a738"
      } else {{ fg: "#477ca1" }}
    }
    duration: "#948e48"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c35359" attr: "b" }
      } else if $in < 6hr {
        "#c35359"
      } else if $in < 1day {
        "#a88339"
      } else if $in < 3day {
        "#18974e"
      } else if $in < 1wk {
        { fg: "#18974e" attr: "b" }
      } else if $in < 6wk {
        "#75a738"
      } else if $in < 52wk {
        "#477ca1"
      } else { "dark_gray" }
    }
    range: "#948e48"
    float: "#948e48"
    string: "#948e48"
    nothing: "#948e48"
    binary: "#948e48"
    cellpath: "#948e48"
    row_index: { fg: "#18974e" attr: "b" }
    record: "#948e48"
    list: "#948e48"
    block: "#948e48"
    hints: "dark_gray"

    shape_and: { fg: "#8868b3" attr: "b" }
    shape_binary: { fg: "#8868b3" attr: "b" }
    shape_block: { fg: "#477ca1" attr: "b" }
    shape_bool: "#75a738"
    shape_custom: "#18974e"
    shape_datetime: { fg: "#75a738" attr: "b" }
    shape_directory: "#75a738"
    shape_external: "#75a738"
    shape_externalarg: { fg: "#18974e" attr: "b" }
    shape_filepath: "#75a738"
    shape_flag: { fg: "#477ca1" attr: "b" }
    shape_float: { fg: "#8868b3" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#75a738" attr: "b" }
    shape_int: { fg: "#8868b3" attr: "b" }
    shape_internalcall: { fg: "#75a738" attr: "b" }
    shape_list: { fg: "#75a738" attr: "b" }
    shape_literal: "#477ca1"
    shape_match_pattern: "#18974e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#75a738"
    shape_operator: "#a88339"
    shape_or: { fg: "#8868b3" attr: "b" }
    shape_pipe: { fg: "#8868b3" attr: "b" }
    shape_range: { fg: "#a88339" attr: "b" }
    shape_record: { fg: "#75a738" attr: "b" }
    shape_redirection: { fg: "#8868b3" attr: "b" }
    shape_signature: { fg: "#18974e" attr: "b" }
    shape_string: "#18974e"
    shape_string_interpolation: { fg: "#75a738" attr: "b" }
    shape_table: { fg: "#477ca1" attr: "b" }
    shape_variable: "#8868b3"

    background: "#201602"
    foreground: "#948e48"
    cursor: "#948e48"
}}