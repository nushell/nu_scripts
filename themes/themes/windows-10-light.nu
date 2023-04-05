export def main [] { return {
    separator: "#767676"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#13a10e" attr: "b" }
    empty: "#0037da"
    bool: {|| if $in { "#3a96dd" } else { "light_gray" } }
    int: "#767676"
    filesize: {|e|
      if $e == 0b {
        "#767676"
      } else if $e < 1mb {
        "#3a96dd"
      } else {{ fg: "#0037da" }}
    }
    duration: "#767676"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c50f1f" attr: "b" }
      } else if $in < 6hr {
        "#c50f1f"
      } else if $in < 1day {
        "#c19c00"
      } else if $in < 3day {
        "#13a10e"
      } else if $in < 1wk {
        { fg: "#13a10e" attr: "b" }
      } else if $in < 6wk {
        "#3a96dd"
      } else if $in < 52wk {
        "#0037da"
      } else { "dark_gray" }
    }
    range: "#767676"
    float: "#767676"
    string: "#767676"
    nothing: "#767676"
    binary: "#767676"
    cellpath: "#767676"
    row_index: { fg: "#13a10e" attr: "b" }
    record: "#767676"
    list: "#767676"
    block: "#767676"
    hints: "dark_gray"

    shape_and: { fg: "#881798" attr: "b" }
    shape_binary: { fg: "#881798" attr: "b" }
    shape_block: { fg: "#0037da" attr: "b" }
    shape_bool: "#3a96dd"
    shape_custom: "#13a10e"
    shape_datetime: { fg: "#3a96dd" attr: "b" }
    shape_directory: "#3a96dd"
    shape_external: "#3a96dd"
    shape_externalarg: { fg: "#13a10e" attr: "b" }
    shape_filepath: "#3a96dd"
    shape_flag: { fg: "#0037da" attr: "b" }
    shape_float: { fg: "#881798" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3a96dd" attr: "b" }
    shape_int: { fg: "#881798" attr: "b" }
    shape_internalcall: { fg: "#3a96dd" attr: "b" }
    shape_list: { fg: "#3a96dd" attr: "b" }
    shape_literal: "#0037da"
    shape_match_pattern: "#13a10e"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3a96dd"
    shape_operator: "#c19c00"
    shape_or: { fg: "#881798" attr: "b" }
    shape_pipe: { fg: "#881798" attr: "b" }
    shape_range: { fg: "#c19c00" attr: "b" }
    shape_record: { fg: "#3a96dd" attr: "b" }
    shape_redirection: { fg: "#881798" attr: "b" }
    shape_signature: { fg: "#13a10e" attr: "b" }
    shape_string: "#13a10e"
    shape_string_interpolation: { fg: "#3a96dd" attr: "b" }
    shape_table: { fg: "#0037da" attr: "b" }
    shape_variable: "#881798"

    background: "#f2f2f2"
    foreground: "#767676"
    cursor: "#767676"
}}