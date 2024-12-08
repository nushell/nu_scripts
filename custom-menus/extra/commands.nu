# can be used in the REPL by adding something like the following block to `$env.config.keybindings` in your `config.nu`
# {
#     name: commands_menu
#     modifier: control
#     keycode: char_t
#     mode: [emacs, vi_normal, vi_insert]
#     event: { send: menu name: commands_menu }
# }

{
    name: commands_menu
    only_buffer_difference: false
    marker: "# "
    type: {
        layout: columnar
        columns: 4
        col_width: 20
        col_padding: 2
    }
    style: {
        text: green
        selected_text: green_reverse
        description_text: yellow
    }
    source: { |buffer, position|
        scope commands
        | where name =~ $buffer
        | each { |it| {value: $it.name description: $it.description } }
    }
}
