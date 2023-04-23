export def main [] { return {
    separator: "#a5918a"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#80a100" attr: "b" }
    empty: "#7897c2"
    bool: {|| if $in { "#2aa4ad" } else { "light_gray" } }
    int: "#a5918a"
    filesize: {|e|
      if $e == 0b {
        "#a5918a"
      } else if $e < 1mb {
        "#52a485"
      } else {{ fg: "#7897c2" }}
    }
    duration: "#a5918a"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f16c50" attr: "b" }
      } else if $in < 6hr {
        "#f16c50"
      } else if $in < 1day {
        "#ac9440"
      } else if $in < 3day {
        "#80a100"
      } else if $in < 1wk {
        { fg: "#80a100" attr: "b" }
      } else if $in < 6wk {
        "#52a485"
      } else if $in < 52wk {
        "#7897c2"
      } else { "dark_gray" }
    }
    range: "#a5918a"
    float: "#a5918a"
    string: "#a5918a"
    nothing: "#a5918a"
    binary: "#a5918a"
    cellpath: "#a5918a"
    row_index: { fg: "#80a100" attr: "b" }
    record: "#a5918a"
    list: "#a5918a"
    block: "#a5918a"
    hints: "dark_gray"

    shape_and: { fg: "#dd758e" attr: "b" }
    shape_binary: { fg: "#dd758e" attr: "b" }
    shape_block: { fg: "#7897c2" attr: "b" }
    shape_bool: "#2aa4ad"
    shape_custom: "#80a100"
    shape_datetime: { fg: "#52a485" attr: "b" }
    shape_directory: "#52a485"
    shape_external: "#52a485"
    shape_externalarg: { fg: "#80a100" attr: "b" }
    shape_filepath: "#52a485"
    shape_flag: { fg: "#7897c2" attr: "b" }
    shape_float: { fg: "#dd758e" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#52a485" attr: "b" }
    shape_int: { fg: "#dd758e" attr: "b" }
    shape_internalcall: { fg: "#52a485" attr: "b" }
    shape_list: { fg: "#52a485" attr: "b" }
    shape_literal: "#7897c2"
    shape_match_pattern: "#80a100"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#2aa4ad"
    shape_operator: "#ac9440"
    shape_or: { fg: "#dd758e" attr: "b" }
    shape_pipe: { fg: "#dd758e" attr: "b" }
    shape_range: { fg: "#ac9440" attr: "b" }
    shape_record: { fg: "#52a485" attr: "b" }
    shape_redirection: { fg: "#dd758e" attr: "b" }
    shape_signature: { fg: "#80a100" attr: "b" }
    shape_string: "#80a100"
    shape_string_interpolation: { fg: "#52a485" attr: "b" }
    shape_table: { fg: "#7897c2" attr: "b" }
    shape_variable: "#dd758e"

    background: "#302420"
    foreground: "#a9a2a6"
    cursor: "#a9a2a6"
}}