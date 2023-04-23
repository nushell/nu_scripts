export def main [] { return {
    separator: "#c9cccd"
    leading_trailing_space_bg: { attr: "n" }
    header: { fg: "#7efdd0" attr: "b" }
    empty: "#69b4f9"
    bool: {|| if $in { "#8ce8ff" } else { "light_gray" } }
    int: "#c9cccd"
    filesize: {|e|
      if $e == 0b {
        "#c9cccd"
      } else if $e < 1mb {
        "#8ce8ff"
      } else {{ fg: "#69b4f9" }}
    }
    duration: "#c9cccd"
    date: {|| (date now) - $in |
      if $in < 1hr {
        { fg: "#ff8e8e" attr: "b" }
      } else if $in < 6hr {
        "#ff8e8e"
      } else if $in < 1day {
        "#fcad3f"
      } else if $in < 3day {
        "#7efdd0"
      } else if $in < 1wk {
        { fg: "#7efdd0" attr: "b" }
      } else if $in < 6wk {
        "#8ce8ff"
      } else if $in < 52wk {
        "#69b4f9"
      } else { "dark_gray" }
    }
    range: "#c9cccd"
    float: "#c9cccd"
    string: "#c9cccd"
    nothing: "#c9cccd"
    binary: "#c9cccd"
    cellpath: "#c9cccd"
    row_index: { fg: "#7efdd0" attr: "b" }
    record: "#c9cccd"
    list: "#c9cccd"
    block: "#c9cccd"
    hints: "dark_gray"

    shape_and: { fg: "#dd92f6" attr: "b" }
    shape_binary: { fg: "#dd92f6" attr: "b" }
    shape_block: { fg: "#69b4f9" attr: "b" }
    shape_bool: "#8ce8ff"
    shape_custom: "#7efdd0"
    shape_datetime: { fg: "#8ce8ff" attr: "b" }
    shape_directory: "#8ce8ff"
    shape_external: "#8ce8ff"
    shape_externalarg: { fg: "#7efdd0" attr: "b" }
    shape_filepath: "#8ce8ff"
    shape_flag: { fg: "#69b4f9" attr: "b" }
    shape_float: { fg: "#dd92f6" attr: "b" }
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: "b" }
    shape_globpattern: { fg: "#8ce8ff" attr: "b" }
    shape_int: { fg: "#dd92f6" attr: "b" }
    shape_internalcall: { fg: "#8ce8ff" attr: "b" }
    shape_list: { fg: "#8ce8ff" attr: "b" }
    shape_literal: "#69b4f9"
    shape_match_pattern: "#7efdd0"
    shape_matching_brackets: { attr: "u" }
    shape_nothing: "#8ce8ff"
    shape_operator: "#fcad3f"
    shape_or: { fg: "#dd92f6" attr: "b" }
    shape_pipe: { fg: "#dd92f6" attr: "b" }
    shape_range: { fg: "#fcad3f" attr: "b" }
    shape_record: { fg: "#8ce8ff" attr: "b" }
    shape_redirection: { fg: "#dd92f6" attr: "b" }
    shape_signature: { fg: "#7efdd0" attr: "b" }
    shape_string: "#7efdd0"
    shape_string_interpolation: { fg: "#8ce8ff" attr: "b" }
    shape_table: { fg: "#69b4f9" attr: "b" }
    shape_variable: "#dd92f6"

    background: "#20242d"
    foreground: "#c7c8ff"
    cursor: "#c7c8ff"
}}