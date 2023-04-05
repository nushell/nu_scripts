export def main [] { return {
    separator: "#928080"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#139913" attr: "b" }
    empty: "#557feb"
    bool: {|| if $in { "#1da1af" } else { "light_gray" } }
    int: "#928080"
    filesize: {|e|
      if $e == 0b {
        "#928080"
      } else if $e < 1mb {
        "#009580"
      } else {{ fg: "#557feb" }}
    }
    duration: "#928080"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#fa3333" attr: "b" }
      } else if $in < 6hr {
        "#fa3333"
      } else if $in < 1day {
        "#9e8100"
      } else if $in < 3day {
        "#139913"
      } else if $in < 1wk {
        { fg: "#139913" attr: "b" }
      } else if $in < 6wk {
        "#009580"
      } else if $in < 52wk {
        "#557feb"
      } else { "dark_gray" }
    }
    range: "#928080"
    float: "#928080"
    string: "#928080"
    nothing: "#928080"
    binary: "#928080"
    cellpath: "#928080"
    row_index: { fg: "#139913" attr: "b" }
    record: "#928080"
    list: "#928080"
    block: "#928080"
    hints: "dark_gray"

    shape_and: { fg: "#d54cbf" attr: "b" }
    shape_binary: { fg: "#d54cbf" attr: "b" }
    shape_block: { fg: "#557feb" attr: "b" }
    shape_bool: "#1da1af"
    shape_custom: "#139913"
    shape_datetime: { fg: "#009580" attr: "b" }
    shape_directory: "#009580"
    shape_external: "#009580"
    shape_externalarg: { fg: "#139913" attr: "b" }
    shape_filepath: "#009580"
    shape_flag: { fg: "#557feb" attr: "b" }
    shape_float: { fg: "#d54cbf" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#009580" attr: "b" }
    shape_int: { fg: "#d54cbf" attr: "b" }
    shape_internalcall: { fg: "#009580" attr: "b" }
    shape_list: { fg: "#009580" attr: "b" }
    shape_literal: "#557feb"
    shape_match_pattern: "#139913"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#1da1af"
    shape_operator: "#9e8100"
    shape_or: { fg: "#d54cbf" attr: "b" }
    shape_pipe: { fg: "#d54cbf" attr: "b" }
    shape_range: { fg: "#9e8100" attr: "b" }
    shape_record: { fg: "#009580" attr: "b" }
    shape_redirection: { fg: "#d54cbf" attr: "b" }
    shape_signature: { fg: "#139913" attr: "b" }
    shape_string: "#139913"
    shape_string_interpolation: { fg: "#009580" attr: "b" }
    shape_table: { fg: "#557feb" attr: "b" }
    shape_variable: "#d54cbf"

    background: "#001514"
    foreground: "#a29fa0"
    cursor: "#a29fa0"
}}