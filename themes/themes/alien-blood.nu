export def main [] { return {
    separator: "#647d75"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#2f7e25" attr: "b" }
    empty: "#2f6a7f"
    bool: {|| if $in { "#00e0c4" } else { "light_gray" } }
    int: "#647d75"
    filesize: {|e|
      if $e == 0b {
        "#647d75"
      } else if $e < 1mb {
        "#327f77"
      } else {{ fg: "#2f6a7f" }}
    }
    duration: "#647d75"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#7f2b27" attr: "b" }
      } else if $in < 6hr {
        "#7f2b27"
      } else if $in < 1day {
        "#717f24"
      } else if $in < 3day {
        "#2f7e25"
      } else if $in < 1wk {
        { fg: "#2f7e25" attr: "b" }
      } else if $in < 6wk {
        "#327f77"
      } else if $in < 52wk {
        "#2f6a7f"
      } else { "dark_gray" }
    }
    range: "#647d75"
    float: "#647d75"
    string: "#647d75"
    nothing: "#647d75"
    binary: "#647d75"
    cellpath: "#647d75"
    row_index: { fg: "#2f7e25" attr: "b" }
    record: "#647d75"
    list: "#647d75"
    block: "#647d75"
    hints: "dark_gray"

    shape_and: { fg: "#47587f" attr: "b" }
    shape_binary: { fg: "#47587f" attr: "b" }
    shape_block: { fg: "#2f6a7f" attr: "b" }
    shape_bool: "#00e0c4"
    shape_custom: "#2f7e25"
    shape_datetime: { fg: "#327f77" attr: "b" }
    shape_directory: "#327f77"
    shape_external: "#327f77"
    shape_externalarg: { fg: "#2f7e25" attr: "b" }
    shape_filepath: "#327f77"
    shape_flag: { fg: "#2f6a7f" attr: "b" }
    shape_float: { fg: "#47587f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#327f77" attr: "b" }
    shape_int: { fg: "#47587f" attr: "b" }
    shape_internalcall: { fg: "#327f77" attr: "b" }
    shape_list: { fg: "#327f77" attr: "b" }
    shape_literal: "#2f6a7f"
    shape_match_pattern: "#2f7e25"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00e0c4"
    shape_operator: "#717f24"
    shape_or: { fg: "#47587f" attr: "b" }
    shape_pipe: { fg: "#47587f" attr: "b" }
    shape_range: { fg: "#717f24" attr: "b" }
    shape_record: { fg: "#327f77" attr: "b" }
    shape_redirection: { fg: "#47587f" attr: "b" }
    shape_signature: { fg: "#2f7e25" attr: "b" }
    shape_string: "#2f7e25"
    shape_string_interpolation: { fg: "#327f77" attr: "b" }
    shape_table: { fg: "#2f6a7f" attr: "b" }
    shape_variable: "#47587f"

    background: "#0f1610"
    foreground: "#637d75"
    cursor: "#637d75"
}}