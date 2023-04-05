export def main [] { return {
    separator: "#464646"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#8e8e8e" attr: "b" }
    empty: "#686868"
    bool: {|| if $in { "#868686" } else { "light_gray" } }
    int: "#464646"
    filesize: {|e|
      if $e == 0b {
        "#464646"
      } else if $e < 1mb {
        "#868686"
      } else {{ fg: "#686868" }}
    }
    duration: "#464646"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#7c7c7c" attr: "b" }
      } else if $in < 6hr {
        "#7c7c7c"
      } else if $in < 1day {
        "#a0a0a0"
      } else if $in < 3day {
        "#8e8e8e"
      } else if $in < 1wk {
        { fg: "#8e8e8e" attr: "b" }
      } else if $in < 6wk {
        "#868686"
      } else if $in < 52wk {
        "#686868"
      } else { "dark_gray" }
    }
    range: "#464646"
    float: "#464646"
    string: "#464646"
    nothing: "#464646"
    binary: "#464646"
    cellpath: "#464646"
    row_index: { fg: "#8e8e8e" attr: "b" }
    record: "#464646"
    list: "#464646"
    block: "#464646"
    hints: "dark_gray"

    shape_and: { fg: "#747474" attr: "b" }
    shape_binary: { fg: "#747474" attr: "b" }
    shape_block: { fg: "#686868" attr: "b" }
    shape_bool: "#868686"
    shape_custom: "#8e8e8e"
    shape_datetime: { fg: "#868686" attr: "b" }
    shape_directory: "#868686"
    shape_external: "#868686"
    shape_externalarg: { fg: "#8e8e8e" attr: "b" }
    shape_filepath: "#868686"
    shape_flag: { fg: "#686868" attr: "b" }
    shape_float: { fg: "#747474" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#868686" attr: "b" }
    shape_int: { fg: "#747474" attr: "b" }
    shape_internalcall: { fg: "#868686" attr: "b" }
    shape_list: { fg: "#868686" attr: "b" }
    shape_literal: "#686868"
    shape_match_pattern: "#8e8e8e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#868686"
    shape_operator: "#a0a0a0"
    shape_or: { fg: "#747474" attr: "b" }
    shape_pipe: { fg: "#747474" attr: "b" }
    shape_range: { fg: "#a0a0a0" attr: "b" }
    shape_record: { fg: "#868686" attr: "b" }
    shape_redirection: { fg: "#747474" attr: "b" }
    shape_signature: { fg: "#8e8e8e" attr: "b" }
    shape_string: "#8e8e8e"
    shape_string_interpolation: { fg: "#868686" attr: "b" }
    shape_table: { fg: "#686868" attr: "b" }
    shape_variable: "#747474"

    background: "#f7f7f7"
    foreground: "#464646"
    cursor: "#464646"
}}