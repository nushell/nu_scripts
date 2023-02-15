# by default vars_menu displays all the variables, inculding default ones. 
# this modification is to hide default variables, and leave only those that are set by user.

      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.vars
            | filter {|i| $i.name not-in [
              "$set_install_state", "$write_default_conf", "$sort_by_date", "$help", "$sort_by_count", 
              "$print_shell_function", "$version", "$dark_theme", "$install", "$no_dates", "$no_trim_root", 
              "$color", "$_a", "$cmd", "$whale_spotting", "$args", "$no_git_ignored", "$no_show_git_info", 
              "$show_root_fs", "$trim_root", "$has_rprompt_last_line_support", "$no_sort", "$no_only_folders", 
              "$show_git_info", "$outcmd", "$no_sizes", "$has_config_items", "$sort_by_type_dirs_first", 
              "$only_folders", "$git_status", "$permissions", "$dates", "$sort_by_size", "$hidden", 
              "$git_ignored", "$conf", "$sort_by_type_dirs_last", "$sizes", "$sort_by_type", "$light_theme", 
              "$no_hidden", "$no_permissions", "$height"
              ] }
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }