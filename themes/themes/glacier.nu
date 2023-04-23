export def main [] { return {
    separator: "#ffffff"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#35a770" attr: "b" }
    empty: "#1f5872"
    bool: {|| if $in { "#a0b6d3" } else { "light_gray" } }
    int: "#ffffff"
    filesize: {|e|
      if $e == 0b {
        "#ffffff"
      } else if $e < 1mb {
        "#778397"
      } else {{ fg: "#1f5872" }}
    }
    duration: "#ffffff"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#bd0f2f" attr: "b" }
      } else if $in < 6hr {
        "#bd0f2f"
      } else if $in < 1day {
        "#fb9435"
      } else if $in < 3day {
        "#35a770"
      } else if $in < 1wk {
        { fg: "#35a770" attr: "b" }
      } else if $in < 6wk {
        "#778397"
      } else if $in < 52wk {
        "#1f5872"
      } else { "dark_gray" }
    }
    range: "#ffffff"
    float: "#ffffff"
    string: "#ffffff"
    nothing: "#ffffff"
    binary: "#ffffff"
    cellpath: "#ffffff"
    row_index: { fg: "#35a770" attr: "b" }
    record: "#ffffff"
    list: "#ffffff"
    block: "#ffffff"
    hints: "dark_gray"

    shape_and: { fg: "#bd2523" attr: "b" }
    shape_binary: { fg: "#bd2523" attr: "b" }
    shape_block: { fg: "#1f5872" attr: "b" }
    shape_bool: "#a0b6d3"
    shape_custom: "#35a770"
    shape_datetime: { fg: "#778397" attr: "b" }
    shape_directory: "#778397"
    shape_external: "#778397"
    shape_externalarg: { fg: "#35a770" attr: "b" }
    shape_filepath: "#778397"
    shape_flag: { fg: "#1f5872" attr: "b" }
    shape_float: { fg: "#bd2523" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#778397" attr: "b" }
    shape_int: { fg: "#bd2523" attr: "b" }
    shape_internalcall: { fg: "#778397" attr: "b" }
    shape_list: { fg: "#778397" attr: "b" }
    shape_literal: "#1f5872"
    shape_match_pattern: "#35a770"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#a0b6d3"
    shape_operator: "#fb9435"
    shape_or: { fg: "#bd2523" attr: "b" }
    shape_pipe: { fg: "#bd2523" attr: "b" }
    shape_range: { fg: "#fb9435" attr: "b" }
    shape_record: { fg: "#778397" attr: "b" }
    shape_redirection: { fg: "#bd2523" attr: "b" }
    shape_signature: { fg: "#35a770" attr: "b" }
    shape_string: "#35a770"
    shape_string_interpolation: { fg: "#778397" attr: "b" }
    shape_table: { fg: "#1f5872" attr: "b" }
    shape_variable: "#bd2523"

    background: "#0c1115"
    foreground: "#ffffff"
    cursor: "#6c6c6c"
}}