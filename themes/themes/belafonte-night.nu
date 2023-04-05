export def main [] { return {
    separator: "#968c83"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#858162" attr: "b" }
    empty: "#426a79"
    bool: {|| if $in { "#989a9c" } else { "light_gray" } }
    int: "#968c83"
    filesize: {|e|
      if $e == 0b {
        "#968c83"
      } else if $e < 1mb {
        "#989a9c"
      } else {{ fg: "#426a79" }}
    }
    duration: "#968c83"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#be100e" attr: "b" }
      } else if $in < 6hr {
        "#be100e"
      } else if $in < 1day {
        "#eaa549"
      } else if $in < 3day {
        "#858162"
      } else if $in < 1wk {
        { fg: "#858162" attr: "b" }
      } else if $in < 6wk {
        "#989a9c"
      } else if $in < 52wk {
        "#426a79"
      } else { "dark_gray" }
    }
    range: "#968c83"
    float: "#968c83"
    string: "#968c83"
    nothing: "#968c83"
    binary: "#968c83"
    cellpath: "#968c83"
    row_index: { fg: "#858162" attr: "b" }
    record: "#968c83"
    list: "#968c83"
    block: "#968c83"
    hints: "dark_gray"

    shape_and: { fg: "#97522c" attr: "b" }
    shape_binary: { fg: "#97522c" attr: "b" }
    shape_block: { fg: "#426a79" attr: "b" }
    shape_bool: "#989a9c"
    shape_custom: "#858162"
    shape_datetime: { fg: "#989a9c" attr: "b" }
    shape_directory: "#989a9c"
    shape_external: "#989a9c"
    shape_externalarg: { fg: "#858162" attr: "b" }
    shape_filepath: "#989a9c"
    shape_flag: { fg: "#426a79" attr: "b" }
    shape_float: { fg: "#97522c" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#989a9c" attr: "b" }
    shape_int: { fg: "#97522c" attr: "b" }
    shape_internalcall: { fg: "#989a9c" attr: "b" }
    shape_list: { fg: "#989a9c" attr: "b" }
    shape_literal: "#426a79"
    shape_match_pattern: "#858162"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#989a9c"
    shape_operator: "#eaa549"
    shape_or: { fg: "#97522c" attr: "b" }
    shape_pipe: { fg: "#97522c" attr: "b" }
    shape_range: { fg: "#eaa549" attr: "b" }
    shape_record: { fg: "#989a9c" attr: "b" }
    shape_redirection: { fg: "#97522c" attr: "b" }
    shape_signature: { fg: "#858162" attr: "b" }
    shape_string: "#858162"
    shape_string_interpolation: { fg: "#989a9c" attr: "b" }
    shape_table: { fg: "#426a79" attr: "b" }
    shape_variable: "#97522c"

    background: "#20111b"
    foreground: "#968c83"
    cursor: "#968c83"
}}