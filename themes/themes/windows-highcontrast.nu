export def main [] { return {
    separator: "#c0c0c0"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#54fc54" attr: "b" }
    empty: "#5454fc"
    bool: {|| if $in { "#54fcfc" } else { "light_gray" } }
    int: "#c0c0c0"
    filesize: {|e|
      if $e == 0b {
        "#c0c0c0"
      } else if $e < 1mb {
        "#54fcfc"
      } else {{ fg: "#5454fc" }}
    }
    duration: "#c0c0c0"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fc5454" attr: "b" }
      } else if $in < 6hr {
        "#fc5454"
      } else if $in < 1day {
        "#fcfc54"
      } else if $in < 3day {
        "#54fc54"
      } else if $in < 1wk {
        { fg: "#54fc54" attr: "b" }
      } else if $in < 6wk {
        "#54fcfc"
      } else if $in < 52wk {
        "#5454fc"
      } else { "dark_gray" }
    }
    range: "#c0c0c0"
    float: "#c0c0c0"
    string: "#c0c0c0"
    nothing: "#c0c0c0"
    binary: "#c0c0c0"
    cellpath: "#c0c0c0"
    row_index: { fg: "#54fc54" attr: "b" }
    record: "#c0c0c0"
    list: "#c0c0c0"
    block: "#c0c0c0"
    hints: "dark_gray"

    shape_and: { fg: "#fc54fc" attr: "b" }
    shape_binary: { fg: "#fc54fc" attr: "b" }
    shape_block: { fg: "#5454fc" attr: "b" }
    shape_bool: "#54fcfc"
    shape_custom: "#54fc54"
    shape_datetime: { fg: "#54fcfc" attr: "b" }
    shape_directory: "#54fcfc"
    shape_external: "#54fcfc"
    shape_externalarg: { fg: "#54fc54" attr: "b" }
    shape_filepath: "#54fcfc"
    shape_flag: { fg: "#5454fc" attr: "b" }
    shape_float: { fg: "#fc54fc" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#54fcfc" attr: "b" }
    shape_int: { fg: "#fc54fc" attr: "b" }
    shape_internalcall: { fg: "#54fcfc" attr: "b" }
    shape_list: { fg: "#54fcfc" attr: "b" }
    shape_literal: "#5454fc"
    shape_match_pattern: "#54fc54"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#54fcfc"
    shape_operator: "#fcfc54"
    shape_or: { fg: "#fc54fc" attr: "b" }
    shape_pipe: { fg: "#fc54fc" attr: "b" }
    shape_range: { fg: "#fcfc54" attr: "b" }
    shape_record: { fg: "#54fcfc" attr: "b" }
    shape_redirection: { fg: "#fc54fc" attr: "b" }
    shape_signature: { fg: "#54fc54" attr: "b" }
    shape_string: "#54fc54"
    shape_string_interpolation: { fg: "#54fcfc" attr: "b" }
    shape_table: { fg: "#5454fc" attr: "b" }
    shape_variable: "#fc54fc"

    background: "#000000"
    foreground: "#c0c0c0"
    cursor: "#c0c0c0"
}}