# can be used in the REPL by adding something like the following block to `$env.config.keybindings` in your `config.nu`
# {
#     name: vars_menu
#     modifier: alt
#     keycode: char_o
#     mode: [emacs, vi_normal, vi_insert]
#     event: { send: menu name: vars_menu }
# }

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
        scope variables
        | where name =~ $buffer
        | sort-by name
        | each { |it| {value: $it.name description: $it.type} }
    }
}
