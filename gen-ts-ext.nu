# generate typescript from nushell commands
def gen-ts-cmds [] {
    # help commands | do -i { each { where $it.subcommands == $nothing }} | where description != '' | select name description | insert camel foo | each { update camel { build-string $it.name 'Completion' | str camel-case }}

    # const ansiCompletion = new vscode.CompletionItem('ansi');
    # ansiCompletion.commitCharacters = [' '];
    # ansiCompletion.documentation = new vscode.MarkdownString('Press <kbd>SpaceBar</kbd> to get completions');

    let cmds = $(help commands | do -i { each { where $it.subcommands == $nothing }} | where description != '' | select name description)
    let updated_cmds = $(echo $cmds | insert camel { build-string $it.name 'Completion' | str camel-case } )

    echo $updated_cmds |
    each {
        # let cmdCamelName = $(build-string $it.name 'Completion' | str camel-case)
        # update camel $cmdCamelName
        let line1 = $(build-string "const " $it.camel " = new vscode.CompletionItem('" $it.name "');" $(char newline))
        let line2 = $(build-string $it.camel ".commitCharacters = [' '];" $(char newline) $(char newline))
        build-string $line1 $line2
    } | str collect

    build-string "return [ " $(echo $updated_cmds | get camel | str collect ', ') " ];" | str collect
}

# generate typescript from nushell subcommands
def gen-ts-subs [] {
    let cmds = $(help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten)
    let updated_cmds = $(echo $cmds | insert camelProvider {build-string $it.base 'SubCommandsProvider' | str camel-case } | insert method {build-string $it.name | str camel-case})
    let subs_count = $(help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten | group-by base | pivot cmd cmd_count | update cmd_count { get cmd_count | length })
    let subs_collection = $(help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten | group-by base | pivot cmd sub_cmds)

    echo $subs_collection |
    each {
        let preamble = $(get sub_cmds | each --numbered {
            # echo `index={{$it.index}} base={{$it.item.base}} sub={{$it.item.sub}}`
            let method = $(build-string $it.item.name | str camel-case)
            let camel = $(build-string $it.item.base 'SubCommandsProvider' | str camel-case)
            if $it.index == 0 {
                let line01 = $(build-string "    const " $camel  " = vscode.languages.registerCompletionItemProvider(" $(char newline))
                let line02 = $(build-string "        'nushell'," $(char nl))
                let line03 = $(build-string "        {" $(char nl))
                let line04 = $(build-string "            provideCompletionItems(document: vscode.TextDocument, position: vscode.Position) {" $(char nl) $(char nl))
                let line05 = $(build-string "                const linePrefix = document.lineAt(position).text.substr(0, position.character);" $(char nl))
                let line06 = $(build-string "                if (linePrefix.endsWith('" $it.item.base " ')) {" $(char nl) $(char nl))
                let line07 = $(build-string "                    const " $method " = new vscode.CompletionItem('" $it.item.sub "', vscode.CompletionItemKind.Method);" $(char nl))
                let line08 = $(build-string '                    ' $method '.detail = "' $it.item.description '";' $(char nl) $(char nl))
                build-string $line01 $line02 $line03 $line04 $line05 $line06 $line07 $line08
            } {
                let line07 = $(build-string "                    const " $method " = new vscode.CompletionItem('" $it.item.sub "', vscode.CompletionItemKind.Method);" $(char nl))
                let line08 = $(build-string '                    ' $method '.detail = "' $it.item.description '";' $(char nl) $(char nl))
                build-string $line07 $line08
            }
        } | str collect)

        let methods = $(echo $it.sub_cmds.name | str camel-case | str collect ', ')

        let line09 = $(build-string "                    return [" $(char nl))
        let line10 = $(build-string "                         " $methods $(char nl))
        let line11 = $(build-string "                    ];" $(char nl))
        let line12 = $(build-string "                } else {" $(char nl))
        let line13 = $(build-string "                    return undefined;" $(char nl))
        let line14 = $(build-string "                }" $(char nl))
        let line15 = $(build-string "            }" $(char nl))
        let line16 = $(build-string "        }," $(char nl))
        let line17 = $(build-string "        ' '" $(char nl))
        let line18 = $(build-string "    );" $(char nl) $(char nl))

        build-string $preamble $line09 $line10 $line11 $line12 $line13 $line14 $line15 $line16 $line17 $line18 | autoview
    }

    echo $subs_collection |
        let post01 = $(build-string "    context.subscriptions.push(" $(char nl))
        let post02 = $(build-string "        " $(echo $updated_cmds | get camelProvider | uniq | str collect ', ') $(char nl))
        let post03 = $(build-string "    );" $(char nl))

        build-string $post01 $post02 $post03 | autoview
}

# def log [message:any] {
#     let now = $(date now | date format '%Y%m%d_%H%M%S.%f')
#     let mess = $(build-string $now '|DBG|' $message $(char newline))
#     echo $mess | autoview
# }