export def main [] { return {
    separator: "#c0c5ce"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#99c794" attr: "b" }
    empty: "#6699cc"
    bool: {|| if $in { "#5fb3b3" } else { "light_gray" } }
    int: "#c0c5ce"
    filesize: {|e|
      if $e == 0b {
        "#c0c5ce"
      } else if $e < 1mb {
        "#5fb3b3"
      } else {{ fg: "#6699cc" }}
    }
    duration: "#c0c5ce"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ec5f67" attr: "b" }
      } else if $in < 6hr {
        "#ec5f67"
      } else if $in < 1day {
        "#fac863"
      } else if $in < 3day {
        "#99c794"
      } else if $in < 1wk {
        { fg: "#99c794" attr: "b" }
      } else if $in < 6wk {
        "#5fb3b3"
      } else if $in < 52wk {
        "#6699cc"
      } else { "dark_gray" }
    }
    range: "#c0c5ce"
    float: "#c0c5ce"
    string: "#c0c5ce"
    nothing: "#c0c5ce"
    binary: "#c0c5ce"
    cellpath: "#c0c5ce"
    row_index: { fg: "#99c794" attr: "b" }
    record: "#c0c5ce"
    list: "#c0c5ce"
    block: "#c0c5ce"
    hints: "dark_gray"

    shape_and: { fg: "#c594c5" attr: "b" }
    shape_binary: { fg: "#c594c5" attr: "b" }
    shape_block: { fg: "#6699cc" attr: "b" }
    shape_bool: "#5fb3b3"
    shape_custom: "#99c794"
    shape_datetime: { fg: "#5fb3b3" attr: "b" }
    shape_directory: "#5fb3b3"
    shape_external: "#5fb3b3"
    shape_externalarg: { fg: "#99c794" attr: "b" }
    shape_filepath: "#5fb3b3"
    shape_flag: { fg: "#6699cc" attr: "b" }
    shape_float: { fg: "#c594c5" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#5fb3b3" attr: "b" }
    shape_int: { fg: "#c594c5" attr: "b" }
    shape_internalcall: { fg: "#5fb3b3" attr: "b" }
    shape_list: { fg: "#5fb3b3" attr: "b" }
    shape_literal: "#6699cc"
    shape_match_pattern: "#99c794"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#5fb3b3"
    shape_operator: "#fac863"
    shape_or: { fg: "#c594c5" attr: "b" }
    shape_pipe: { fg: "#c594c5" attr: "b" }
    shape_range: { fg: "#fac863" attr: "b" }
    shape_record: { fg: "#5fb3b3" attr: "b" }
    shape_redirection: { fg: "#c594c5" attr: "b" }
    shape_signature: { fg: "#99c794" attr: "b" }
    shape_string: "#99c794"
    shape_string_interpolation: { fg: "#5fb3b3" attr: "b" }
    shape_table: { fg: "#6699cc" attr: "b" }
    shape_variable: "#c594c5"

    background: "#1b2b34"
    foreground: "#c0c5ce"
    cursor: "#c0c5ce"
}}