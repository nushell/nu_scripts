export def main [] { return {
    separator: "#bbaa99"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#86af80" attr: "b" }
    empty: "#6495ed"
    bool: {|| if $in { "#b0c4de" } else { "light_gray" } }
    int: "#bbaa99"
    filesize: {|e|
      if $e == 0b {
        "#bbaa99"
      } else if $e < 1mb {
        "#b0c4de"
      } else {{ fg: "#6495ed" }}
    }
    duration: "#bbaa99"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#cd5c5c" attr: "b" }
      } else if $in < 6hr {
        "#cd5c5c"
      } else if $in < 1day {
        "#e8ae5b"
      } else if $in < 3day {
        "#86af80"
      } else if $in < 1wk {
        { fg: "#86af80" attr: "b" }
      } else if $in < 6wk {
        "#b0c4de"
      } else if $in < 52wk {
        "#6495ed"
      } else { "dark_gray" }
    }
    range: "#bbaa99"
    float: "#bbaa99"
    string: "#bbaa99"
    nothing: "#bbaa99"
    binary: "#bbaa99"
    cellpath: "#bbaa99"
    row_index: { fg: "#86af80" attr: "b" }
    record: "#bbaa99"
    list: "#bbaa99"
    block: "#bbaa99"
    hints: "dark_gray"

    shape_and: { fg: "#deb887" attr: "b" }
    shape_binary: { fg: "#deb887" attr: "b" }
    shape_block: { fg: "#6495ed" attr: "b" }
    shape_bool: "#b0c4de"
    shape_custom: "#86af80"
    shape_datetime: { fg: "#b0c4de" attr: "b" }
    shape_directory: "#b0c4de"
    shape_external: "#b0c4de"
    shape_externalarg: { fg: "#86af80" attr: "b" }
    shape_filepath: "#b0c4de"
    shape_flag: { fg: "#6495ed" attr: "b" }
    shape_float: { fg: "#deb887" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#b0c4de" attr: "b" }
    shape_int: { fg: "#deb887" attr: "b" }
    shape_internalcall: { fg: "#b0c4de" attr: "b" }
    shape_list: { fg: "#b0c4de" attr: "b" }
    shape_literal: "#6495ed"
    shape_match_pattern: "#86af80"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#b0c4de"
    shape_operator: "#e8ae5b"
    shape_or: { fg: "#deb887" attr: "b" }
    shape_pipe: { fg: "#deb887" attr: "b" }
    shape_range: { fg: "#e8ae5b" attr: "b" }
    shape_record: { fg: "#b0c4de" attr: "b" }
    shape_redirection: { fg: "#deb887" attr: "b" }
    shape_signature: { fg: "#86af80" attr: "b" }
    shape_string: "#86af80"
    shape_string_interpolation: { fg: "#b0c4de" attr: "b" }
    shape_table: { fg: "#6495ed" attr: "b" }
    shape_variable: "#deb887"

    background: "#1c1c1c"
    foreground: "#ddeedd"
    cursor: "#ddeedd"
}}