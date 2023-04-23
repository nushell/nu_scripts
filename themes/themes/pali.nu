export def main [] { return {
    separator: "#f2f2f2"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#74ab8f" attr: "b" }
    empty: "#8f74ab"
    bool: {|| if $in { "#4bb8fd" } else { "light_gray" } }
    int: "#f2f2f2"
    filesize: {|e|
      if $e == 0b {
        "#f2f2f2"
      } else if $e < 1mb {
        "#748fab"
      } else {{ fg: "#8f74ab" }}
    }
    duration: "#f2f2f2"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ab8f74" attr: "b" }
      } else if $in < 6hr {
        "#ab8f74"
      } else if $in < 1day {
        "#8fab74"
      } else if $in < 3day {
        "#74ab8f"
      } else if $in < 1wk {
        { fg: "#74ab8f" attr: "b" }
      } else if $in < 6wk {
        "#748fab"
      } else if $in < 52wk {
        "#8f74ab"
      } else { "dark_gray" }
    }
    range: "#f2f2f2"
    float: "#f2f2f2"
    string: "#f2f2f2"
    nothing: "#f2f2f2"
    binary: "#f2f2f2"
    cellpath: "#f2f2f2"
    row_index: { fg: "#74ab8f" attr: "b" }
    record: "#f2f2f2"
    list: "#f2f2f2"
    block: "#f2f2f2"
    hints: "dark_gray"

    shape_and: { fg: "#ab748f" attr: "b" }
    shape_binary: { fg: "#ab748f" attr: "b" }
    shape_block: { fg: "#8f74ab" attr: "b" }
    shape_bool: "#4bb8fd"
    shape_custom: "#74ab8f"
    shape_datetime: { fg: "#748fab" attr: "b" }
    shape_directory: "#748fab"
    shape_external: "#748fab"
    shape_externalarg: { fg: "#74ab8f" attr: "b" }
    shape_filepath: "#748fab"
    shape_flag: { fg: "#8f74ab" attr: "b" }
    shape_float: { fg: "#ab748f" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#748fab" attr: "b" }
    shape_int: { fg: "#ab748f" attr: "b" }
    shape_internalcall: { fg: "#748fab" attr: "b" }
    shape_list: { fg: "#748fab" attr: "b" }
    shape_literal: "#8f74ab"
    shape_match_pattern: "#74ab8f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#4bb8fd"
    shape_operator: "#8fab74"
    shape_or: { fg: "#ab748f" attr: "b" }
    shape_pipe: { fg: "#ab748f" attr: "b" }
    shape_range: { fg: "#8fab74" attr: "b" }
    shape_record: { fg: "#748fab" attr: "b" }
    shape_redirection: { fg: "#ab748f" attr: "b" }
    shape_signature: { fg: "#74ab8f" attr: "b" }
    shape_string: "#74ab8f"
    shape_string_interpolation: { fg: "#748fab" attr: "b" }
    shape_table: { fg: "#8f74ab" attr: "b" }
    shape_variable: "#ab748f"

    background: "#232e37"
    foreground: "#d9e6f2"
    cursor: "#d9e6f2"
}}