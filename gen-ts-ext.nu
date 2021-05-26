def gen-ts-cmds-begin [] {
    # hooray for multi-line strings
    build-string "import * as vscode from 'vscode';
export function activate(context: vscode.ExtensionContext) {
  const keywordsWithSubCommandsProvider = vscode.languages.registerCompletionItemProvider(
    'nushell',
    {
      provideCompletionItems(
        document: vscode.TextDocument,
        position: vscode.Position,
        token: vscode.CancellationToken,
        context: vscode.CompletionContext
    ) {
"
}

# generate typescript from nushell commands
def gen-ts-cmds [] {
    # let cmds = (help commands | do -i { each { where $it.subcommands == $nothing }} | where description != '' | select name description)
    let cmds = (help commands | where description != '' | select name description)
    let updated_cmds = (echo $cmds | insert camel { build-string $it.name 'Completion' | str camel-case } )

    let ts = (echo $updated_cmds |
    each {
        let line1 = (build-string "      const " $it.camel " = new vscode.CompletionItem('" $it.name "');" (char newline))
        let line2 = (build-string "      " $it.camel ".commitCharacters = [' '];" (char newline) (char newline))
        $line1 + $line2
    } | str collect)

    build-string (echo $ts) (char nl) "      return [ " (echo $updated_cmds | get camel | str collect ', ') " ];" (char nl) '      },' (char nl) '    }' (char nl) '  );' (char nl) (char nl) | str collect
}

# generate typescript from nushell subcommands
def gen-ts-subs [] {
    let cmds = (help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten)
    let updated_cmds = (echo $cmds | insert camelProvider {build-string $it.base 'SubCommandsProvider' | str camel-case } | insert method {build-string $it.name | str camel-case})
    let subs_count = (help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten | group-by base | pivot cmd cmd_count | update cmd_count { get cmd_count | length })
    let subs_collection = (help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten | group-by base | pivot cmd sub_cmds)

    let ts = (echo $subs_collection |
    each {
        let preamble = (get sub_cmds | each --numbered {
            let method = (build-string $it.item.name | str camel-case)
            let camel = (build-string $it.item.base 'SubCommandsProvider' | str camel-case)
            if $it.index == 0 {
                let line01 = (build-string "    const " $camel  " = vscode.languages.registerCompletionItemProvider(" (char newline))
                let line02 = (build-string "        'nushell'," (char nl))
                let line03 = (build-string "        {" (char nl))
                let line04 = (build-string "            provideCompletionItems(document: vscode.TextDocument, position: vscode.Position) {" (char nl) (char nl))
                let line05 = (build-string "                const linePrefix = document.lineAt(position).text.substr(0, position.character);" (char nl))
                let line06 = (build-string "                if (linePrefix.endsWith('" $it.item.base " ')) {" (char nl) (char nl))
                let line07 = (build-string "                    const " $method " = new vscode.CompletionItem('" $it.item.sub "', vscode.CompletionItemKind.Method);" (char nl))
                let line08 = (build-string '                    ' $method '.detail = "' $it.item.description '";' (char nl) (char nl))
                $line01 + $line02 + $line03 + $line04 + $line05 + $line06 + $line07 + $line08
            } {
                let line07 = (build-string "                    const " $method " = new vscode.CompletionItem('" $it.item.sub "', vscode.CompletionItemKind.Method);" (char nl))
                let line08 = (build-string '                    ' $method '.detail = "' $it.item.description '";' (char nl) (char nl))
                $line07 + $line08
            }
        } | str collect)

        let methods = (echo $it.sub_cmds.name | str camel-case | str collect ', ')

        let lines = $"
                    return [
                        ($methods)
                    ];
                } else {
                    return undefined;
                }
            }
        },
        ' '
    );
    "

        build-string $preamble $lines
    } | str collect)

    echo $subs_collection |
        let post01 = (build-string "    context.subscriptions.push(" (char nl))
        let post02 = (build-string "        " (echo $updated_cmds | get camelProvider | uniq | str collect ', ') (char nl))
        let post03 = (build-string "    );" (char nl) "}" (char nl))

        build-string $ts $post01 $post02 $post03
}

# def log [message:any] {
#     let now = (date now | date format '%Y%m%d_%H%M%S.%f')
#     let mess = (build-string $now '|DBG|' $message (char newline))
#     echo $mess | autoview
# }

build-string (gen-ts-cmds-begin) (gen-ts-cmds) (gen-ts-subs) | save extension.ts