export def main [] { return {
    separator: "#d8d8d8"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#95c76f" attr: "b" }
    empty: "#8485ce"
    bool: {|| if $in { "#64878f" } else { "light_gray" } }
    int: "#d8d8d8"
    filesize: {|e|
      if $e == 0b {
        "#d8d8d8"
      } else if $e < 1mb {
        "#64878f"
      } else {{ fg: "#8485ce" }}
    }
    duration: "#d8d8d8"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#f84547" attr: "b" }
      } else if $in < 6hr {
        "#f84547"
      } else if $in < 1day {
        "#efa16b"
      } else if $in < 3day {
        "#95c76f"
      } else if $in < 1wk {
        { fg: "#95c76f" attr: "b" }
      } else if $in < 6wk {
        "#64878f"
      } else if $in < 52wk {
        "#8485ce"
      } else { "dark_gray" }
    }
    range: "#d8d8d8"
    float: "#d8d8d8"
    string: "#d8d8d8"
    nothing: "#d8d8d8"
    binary: "#d8d8d8"
    cellpath: "#d8d8d8"
    row_index: { fg: "#95c76f" attr: "b" }
    record: "#d8d8d8"
    list: "#d8d8d8"
    block: "#d8d8d8"
    hints: "dark_gray"

    shape_and: { fg: "#b74989" attr: "b" }
    shape_binary: { fg: "#b74989" attr: "b" }
    shape_block: { fg: "#8485ce" attr: "b" }
    shape_bool: "#64878f"
    shape_custom: "#95c76f"
    shape_datetime: { fg: "#64878f" attr: "b" }
    shape_directory: "#64878f"
    shape_external: "#64878f"
    shape_externalarg: { fg: "#95c76f" attr: "b" }
    shape_filepath: "#64878f"
    shape_flag: { fg: "#8485ce" attr: "b" }
    shape_float: { fg: "#b74989" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#64878f" attr: "b" }
    shape_int: { fg: "#b74989" attr: "b" }
    shape_internalcall: { fg: "#64878f" attr: "b" }
    shape_list: { fg: "#64878f" attr: "b" }
    shape_literal: "#8485ce"
    shape_match_pattern: "#95c76f"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#64878f"
    shape_operator: "#efa16b"
    shape_or: { fg: "#b74989" attr: "b" }
    shape_pipe: { fg: "#b74989" attr: "b" }
    shape_range: { fg: "#efa16b" attr: "b" }
    shape_record: { fg: "#64878f" attr: "b" }
    shape_redirection: { fg: "#b74989" attr: "b" }
    shape_signature: { fg: "#95c76f" attr: "b" }
    shape_string: "#95c76f"
    shape_string_interpolation: { fg: "#64878f" attr: "b" }
    shape_table: { fg: "#8485ce" attr: "b" }
    shape_variable: "#b74989"

    background: "#292c36"
    foreground: "#d8d8d8"
    cursor: "#d8d8d8"
}}