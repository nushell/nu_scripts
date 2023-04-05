export def main [] { return {
    separator: "#808080"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#af87d7" attr: "b" }
    empty: "#ff5faf"
    bool: {|| if $in { "#ffaf00" } else { "light_gray" } }
    int: "#808080"
    filesize: {|e|
      if $e == 0b {
        "#808080"
      } else if $e < 1mb {
        "#ffaf00"
      } else {{ fg: "#ff5faf" }}
    }
    duration: "#808080"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#585858" attr: "b" }
      } else if $in < 6hr {
        "#585858"
      } else if $in < 1day {
        "#afd700"
      } else if $in < 3day {
        "#af87d7"
      } else if $in < 1wk {
        { fg: "#af87d7" attr: "b" }
      } else if $in < 6wk {
        "#ffaf00"
      } else if $in < 52wk {
        "#ff5faf"
      } else { "dark_gray" }
    }
    range: "#808080"
    float: "#808080"
    string: "#808080"
    nothing: "#808080"
    binary: "#808080"
    cellpath: "#808080"
    row_index: { fg: "#af87d7" attr: "b" }
    record: "#808080"
    list: "#808080"
    block: "#808080"
    hints: "dark_gray"

    shape_and: { fg: "#00afaf" attr: "b" }
    shape_binary: { fg: "#00afaf" attr: "b" }
    shape_block: { fg: "#ff5faf" attr: "b" }
    shape_bool: "#ffaf00"
    shape_custom: "#af87d7"
    shape_datetime: { fg: "#ffaf00" attr: "b" }
    shape_directory: "#ffaf00"
    shape_external: "#ffaf00"
    shape_externalarg: { fg: "#af87d7" attr: "b" }
    shape_filepath: "#ffaf00"
    shape_flag: { fg: "#ff5faf" attr: "b" }
    shape_float: { fg: "#00afaf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#ffaf00" attr: "b" }
    shape_int: { fg: "#00afaf" attr: "b" }
    shape_internalcall: { fg: "#ffaf00" attr: "b" }
    shape_list: { fg: "#ffaf00" attr: "b" }
    shape_literal: "#ff5faf"
    shape_match_pattern: "#af87d7"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#ffaf00"
    shape_operator: "#afd700"
    shape_or: { fg: "#00afaf" attr: "b" }
    shape_pipe: { fg: "#00afaf" attr: "b" }
    shape_range: { fg: "#afd700" attr: "b" }
    shape_record: { fg: "#ffaf00" attr: "b" }
    shape_redirection: { fg: "#00afaf" attr: "b" }
    shape_signature: { fg: "#af87d7" attr: "b" }
    shape_string: "#af87d7"
    shape_string_interpolation: { fg: "#ffaf00" attr: "b" }
    shape_table: { fg: "#ff5faf" attr: "b" }
    shape_variable: "#00afaf"

    background: "#1c1c1c"
    foreground: "#808080"
    cursor: "#808080"
}}