export def main [] { return {
    separator: "#ecf0fc"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#acf157" attr: "b" }
    empty: "#525fb8"
    bool: {|| if $in { "#a5bd86" } else { "light_gray" } }
    int: "#ecf0fc"
    filesize: {|e|
      if $e == 0b {
        "#ecf0fc"
      } else if $e < 1mb {
        "#968763"
      } else {{ fg: "#525fb8" }}
    }
    duration: "#ecf0fc"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#c6004a" attr: "b" }
      } else if $in < 6hr {
        "#c6004a"
      } else if $in < 1day {
        "#fecd5e"
      } else if $in < 3day {
        "#acf157"
      } else if $in < 1wk {
        { fg: "#acf157" attr: "b" }
      } else if $in < 6wk {
        "#968763"
      } else if $in < 52wk {
        "#525fb8"
      } else { "dark_gray" }
    }
    range: "#ecf0fc"
    float: "#ecf0fc"
    string: "#ecf0fc"
    nothing: "#ecf0fc"
    binary: "#ecf0fc"
    cellpath: "#ecf0fc"
    row_index: { fg: "#acf157" attr: "b" }
    record: "#ecf0fc"
    list: "#ecf0fc"
    block: "#ecf0fc"
    hints: "dark_gray"

    shape_and: { fg: "#986f82" attr: "b" }
    shape_binary: { fg: "#986f82" attr: "b" }
    shape_block: { fg: "#525fb8" attr: "b" }
    shape_bool: "#a5bd86"
    shape_custom: "#acf157"
    shape_datetime: { fg: "#968763" attr: "b" }
    shape_directory: "#968763"
    shape_external: "#968763"
    shape_externalarg: { fg: "#acf157" attr: "b" }
    shape_filepath: "#968763"
    shape_flag: { fg: "#525fb8" attr: "b" }
    shape_float: { fg: "#986f82" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#968763" attr: "b" }
    shape_int: { fg: "#986f82" attr: "b" }
    shape_internalcall: { fg: "#968763" attr: "b" }
    shape_list: { fg: "#968763" attr: "b" }
    shape_literal: "#525fb8"
    shape_match_pattern: "#acf157"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a5bd86"
    shape_operator: "#fecd5e"
    shape_or: { fg: "#986f82" attr: "b" }
    shape_pipe: { fg: "#986f82" attr: "b" }
    shape_range: { fg: "#fecd5e" attr: "b" }
    shape_record: { fg: "#968763" attr: "b" }
    shape_redirection: { fg: "#986f82" attr: "b" }
    shape_signature: { fg: "#acf157" attr: "b" }
    shape_string: "#acf157"
    shape_string_interpolation: { fg: "#968763" attr: "b" }
    shape_table: { fg: "#525fb8" attr: "b" }
    shape_variable: "#986f82"

    background: "#232537"
    foreground: "#ecf0fe"
    cursor: "#ecf0fe"
}}