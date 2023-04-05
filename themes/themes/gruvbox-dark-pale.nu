export def main [] { return {
    separator: "#dab997"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#afaf00" attr: "b" }
    empty: "#83adad"
    bool: {|| if $in { "#85ad85" } else { "light_gray" } }
    int: "#dab997"
    filesize: {|e|
      if $e == 0b {
        "#dab997"
      } else if $e < 1mb {
        "#85ad85"
      } else {{ fg: "#83adad" }}
    }
    duration: "#dab997"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#d75f5f" attr: "b" }
      } else if $in < 6hr {
        "#d75f5f"
      } else if $in < 1day {
        "#ffaf00"
      } else if $in < 3day {
        "#afaf00"
      } else if $in < 1wk {
        { fg: "#afaf00" attr: "b" }
      } else if $in < 6wk {
        "#85ad85"
      } else if $in < 52wk {
        "#83adad"
      } else { "dark_gray" }
    }
    range: "#dab997"
    float: "#dab997"
    string: "#dab997"
    nothing: "#dab997"
    binary: "#dab997"
    cellpath: "#dab997"
    row_index: { fg: "#afaf00" attr: "b" }
    record: "#dab997"
    list: "#dab997"
    block: "#dab997"
    hints: "dark_gray"

    shape_and: { fg: "#d485ad" attr: "b" }
    shape_binary: { fg: "#d485ad" attr: "b" }
    shape_block: { fg: "#83adad" attr: "b" }
    shape_bool: "#85ad85"
    shape_custom: "#afaf00"
    shape_datetime: { fg: "#85ad85" attr: "b" }
    shape_directory: "#85ad85"
    shape_external: "#85ad85"
    shape_externalarg: { fg: "#afaf00" attr: "b" }
    shape_filepath: "#85ad85"
    shape_flag: { fg: "#83adad" attr: "b" }
    shape_float: { fg: "#d485ad" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#85ad85" attr: "b" }
    shape_int: { fg: "#d485ad" attr: "b" }
    shape_internalcall: { fg: "#85ad85" attr: "b" }
    shape_list: { fg: "#85ad85" attr: "b" }
    shape_literal: "#83adad"
    shape_match_pattern: "#afaf00"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#85ad85"
    shape_operator: "#ffaf00"
    shape_or: { fg: "#d485ad" attr: "b" }
    shape_pipe: { fg: "#d485ad" attr: "b" }
    shape_range: { fg: "#ffaf00" attr: "b" }
    shape_record: { fg: "#85ad85" attr: "b" }
    shape_redirection: { fg: "#d485ad" attr: "b" }
    shape_signature: { fg: "#afaf00" attr: "b" }
    shape_string: "#afaf00"
    shape_string_interpolation: { fg: "#85ad85" attr: "b" }
    shape_table: { fg: "#83adad" attr: "b" }
    shape_variable: "#d485ad"

    background: "#262626"
    foreground: "#dab997"
    cursor: "#dab997"
}}