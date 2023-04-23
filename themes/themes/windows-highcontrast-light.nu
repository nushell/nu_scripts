export def main [] { return {
    separator: "#545454"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#008000" attr: "b" }
    empty: "#000080"
    bool: {|| if $in { "#008080" } else { "light_gray" } }
    int: "#545454"
    filesize: {|e|
      if $e == 0b {
        "#545454"
      } else if $e < 1mb {
        "#008080"
      } else {{ fg: "#000080" }}
    }
    duration: "#545454"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#800000" attr: "b" }
      } else if $in < 6hr {
        "#800000"
      } else if $in < 1day {
        "#808000"
      } else if $in < 3day {
        "#008000"
      } else if $in < 1wk {
        { fg: "#008000" attr: "b" }
      } else if $in < 6wk {
        "#008080"
      } else if $in < 52wk {
        "#000080"
      } else { "dark_gray" }
    }
    range: "#545454"
    float: "#545454"
    string: "#545454"
    nothing: "#545454"
    binary: "#545454"
    cellpath: "#545454"
    row_index: { fg: "#008000" attr: "b" }
    record: "#545454"
    list: "#545454"
    block: "#545454"
    hints: "dark_gray"

    shape_and: { fg: "#800080" attr: "b" }
    shape_binary: { fg: "#800080" attr: "b" }
    shape_block: { fg: "#000080" attr: "b" }
    shape_bool: "#008080"
    shape_custom: "#008000"
    shape_datetime: { fg: "#008080" attr: "b" }
    shape_directory: "#008080"
    shape_external: "#008080"
    shape_externalarg: { fg: "#008000" attr: "b" }
    shape_filepath: "#008080"
    shape_flag: { fg: "#000080" attr: "b" }
    shape_float: { fg: "#800080" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#008080" attr: "b" }
    shape_int: { fg: "#800080" attr: "b" }
    shape_internalcall: { fg: "#008080" attr: "b" }
    shape_list: { fg: "#008080" attr: "b" }
    shape_literal: "#000080"
    shape_match_pattern: "#008000"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#008080"
    shape_operator: "#808000"
    shape_or: { fg: "#800080" attr: "b" }
    shape_pipe: { fg: "#800080" attr: "b" }
    shape_range: { fg: "#808000" attr: "b" }
    shape_record: { fg: "#008080" attr: "b" }
    shape_redirection: { fg: "#800080" attr: "b" }
    shape_signature: { fg: "#008000" attr: "b" }
    shape_string: "#008000"
    shape_string_interpolation: { fg: "#008080" attr: "b" }
    shape_table: { fg: "#000080" attr: "b" }
    shape_variable: "#800080"

    background: "#fcfcfc"
    foreground: "#545454"
    cursor: "#545454"
}}