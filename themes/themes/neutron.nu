export def main [] { return {
    separator: "#e6e8ef"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#5ab977" attr: "b" }
    empty: "#6a7c93"
    bool: {|| if $in { "#3f94a8" } else { "light_gray" } }
    int: "#e6e8ef"
    filesize: {|e|
      if $e == 0b {
        "#e6e8ef"
      } else if $e < 1mb {
        "#3f94a8"
      } else {{ fg: "#6a7c93" }}
    }
    duration: "#e6e8ef"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#b54036" attr: "b" }
      } else if $in < 6hr {
        "#b54036"
      } else if $in < 1day {
        "#deb566"
      } else if $in < 3day {
        "#5ab977"
      } else if $in < 1wk {
        { fg: "#5ab977" attr: "b" }
      } else if $in < 6wk {
        "#3f94a8"
      } else if $in < 52wk {
        "#6a7c93"
      } else { "dark_gray" }
    }
    range: "#e6e8ef"
    float: "#e6e8ef"
    string: "#e6e8ef"
    nothing: "#e6e8ef"
    binary: "#e6e8ef"
    cellpath: "#e6e8ef"
    row_index: { fg: "#5ab977" attr: "b" }
    record: "#e6e8ef"
    list: "#e6e8ef"
    block: "#e6e8ef"
    hints: "dark_gray"

    shape_and: { fg: "#a4799d" attr: "b" }
    shape_binary: { fg: "#a4799d" attr: "b" }
    shape_block: { fg: "#6a7c93" attr: "b" }
    shape_bool: "#3f94a8"
    shape_custom: "#5ab977"
    shape_datetime: { fg: "#3f94a8" attr: "b" }
    shape_directory: "#3f94a8"
    shape_external: "#3f94a8"
    shape_externalarg: { fg: "#5ab977" attr: "b" }
    shape_filepath: "#3f94a8"
    shape_flag: { fg: "#6a7c93" attr: "b" }
    shape_float: { fg: "#a4799d" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#3f94a8" attr: "b" }
    shape_int: { fg: "#a4799d" attr: "b" }
    shape_internalcall: { fg: "#3f94a8" attr: "b" }
    shape_list: { fg: "#3f94a8" attr: "b" }
    shape_literal: "#6a7c93"
    shape_match_pattern: "#5ab977"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#3f94a8"
    shape_operator: "#deb566"
    shape_or: { fg: "#a4799d" attr: "b" }
    shape_pipe: { fg: "#a4799d" attr: "b" }
    shape_range: { fg: "#deb566" attr: "b" }
    shape_record: { fg: "#3f94a8" attr: "b" }
    shape_redirection: { fg: "#a4799d" attr: "b" }
    shape_signature: { fg: "#5ab977" attr: "b" }
    shape_string: "#5ab977"
    shape_string_interpolation: { fg: "#3f94a8" attr: "b" }
    shape_table: { fg: "#6a7c93" attr: "b" }
    shape_variable: "#a4799d"

    background: "#1c1e22"
    foreground: "#e6e8ef"
    cursor: "#e6e8ef"
}}