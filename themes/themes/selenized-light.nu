export def main [] { return {
    separator: "#909995"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#489100" attr: "b" }
    empty: "#0072d4"
    bool: {|| if $in { "#00978a" } else { "light_gray" } }
    int: "#909995"
    filesize: {|e|
      if $e == 0b {
        "#909995"
      } else if $e < 1mb {
        "#009c8f"
      } else {{ fg: "#0072d4" }}
    }
    duration: "#909995"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d2212d" attr: "b" }
      } else if $in < 6hr {
        "#d2212d"
      } else if $in < 1day {
        "#ad8900"
      } else if $in < 3day {
        "#489100"
      } else if $in < 1wk {
        { fg: "#489100" attr: "b" }
      } else if $in < 6wk {
        "#009c8f"
      } else if $in < 52wk {
        "#0072d4"
      } else { "dark_gray" }
    }
    range: "#909995"
    float: "#909995"
    string: "#909995"
    nothing: "#909995"
    binary: "#909995"
    cellpath: "#909995"
    row_index: { fg: "#489100" attr: "b" }
    record: "#909995"
    list: "#909995"
    block: "#909995"
    hints: "dark_gray"

    shape_and: { fg: "#ca4898" attr: "b" }
    shape_binary: { fg: "#ca4898" attr: "b" }
    shape_block: { fg: "#0072d4" attr: "b" }
    shape_bool: "#00978a"
    shape_custom: "#489100"
    shape_datetime: { fg: "#009c8f" attr: "b" }
    shape_directory: "#009c8f"
    shape_external: "#009c8f"
    shape_externalarg: { fg: "#489100" attr: "b" }
    shape_filepath: "#009c8f"
    shape_flag: { fg: "#0072d4" attr: "b" }
    shape_float: { fg: "#ca4898" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#009c8f" attr: "b" }
    shape_int: { fg: "#ca4898" attr: "b" }
    shape_internalcall: { fg: "#009c8f" attr: "b" }
    shape_list: { fg: "#009c8f" attr: "b" }
    shape_literal: "#0072d4"
    shape_match_pattern: "#489100"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#00978a"
    shape_operator: "#ad8900"
    shape_or: { fg: "#ca4898" attr: "b" }
    shape_pipe: { fg: "#ca4898" attr: "b" }
    shape_range: { fg: "#ad8900" attr: "b" }
    shape_record: { fg: "#009c8f" attr: "b" }
    shape_redirection: { fg: "#ca4898" attr: "b" }
    shape_signature: { fg: "#489100" attr: "b" }
    shape_string: "#489100"
    shape_string_interpolation: { fg: "#009c8f" attr: "b" }
    shape_table: { fg: "#0072d4" attr: "b" }
    shape_variable: "#ca4898"

    background: "#fbf3db"
    foreground: "#53676d"
    cursor: "#53676d"
}}