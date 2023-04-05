export def main [] { return {
    separator: "#405555"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#00a941" attr: "b" }
    empty: "#449a86"
    bool: {|| if $in { "#98d028" } else { "light_gray" } }
    int: "#405555"
    filesize: {|e|
      if $e == 0b {
        "#405555"
      } else if $e < 1mb {
        "#5d7e19"
      } else {{ fg: "#449a86" }}
    }
    duration: "#405555"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b2302d" attr: "b" }
      } else if $in < 6hr {
        "#b2302d"
      } else if $in < 1day {
        "#5e8baa"
      } else if $in < 3day {
        "#00a941"
      } else if $in < 1wk {
        { fg: "#00a941" attr: "b" }
      } else if $in < 6wk {
        "#5d7e19"
      } else if $in < 52wk {
        "#449a86"
      } else { "dark_gray" }
    }
    range: "#405555"
    float: "#405555"
    string: "#405555"
    nothing: "#405555"
    binary: "#405555"
    cellpath: "#405555"
    row_index: { fg: "#00a941" attr: "b" }
    record: "#405555"
    list: "#405555"
    block: "#405555"
    hints: "dark_gray"

    shape_and: { fg: "#00599d" attr: "b" }
    shape_binary: { fg: "#00599d" attr: "b" }
    shape_block: { fg: "#449a86" attr: "b" }
    shape_bool: "#98d028"
    shape_custom: "#00a941"
    shape_datetime: { fg: "#5d7e19" attr: "b" }
    shape_directory: "#5d7e19"
    shape_external: "#5d7e19"
    shape_externalarg: { fg: "#00a941" attr: "b" }
    shape_filepath: "#5d7e19"
    shape_flag: { fg: "#449a86" attr: "b" }
    shape_float: { fg: "#00599d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5d7e19" attr: "b" }
    shape_int: { fg: "#00599d" attr: "b" }
    shape_internalcall: { fg: "#5d7e19" attr: "b" }
    shape_list: { fg: "#5d7e19" attr: "b" }
    shape_literal: "#449a86"
    shape_match_pattern: "#00a941"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#98d028"
    shape_operator: "#5e8baa"
    shape_or: { fg: "#00599d" attr: "b" }
    shape_pipe: { fg: "#00599d" attr: "b" }
    shape_range: { fg: "#5e8baa" attr: "b" }
    shape_record: { fg: "#5d7e19" attr: "b" }
    shape_redirection: { fg: "#00599d" attr: "b" }
    shape_signature: { fg: "#00a941" attr: "b" }
    shape_string: "#00a941"
    shape_string_interpolation: { fg: "#5d7e19" attr: "b" }
    shape_table: { fg: "#449a86" attr: "b" }
    shape_variable: "#00599d"

    background: "#001015"
    foreground: "#405555"
    cursor: "#405555"
}}