def gen-ts-cmds-begin [] {
    # hooray for multi-line strings
    [ "import * as vscode from 'vscode';
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
" ] | str join
}

# generate typescript from nushell commands
def gen-ts-cmds [] {
    let cmds = (scope commands | where usage != '' | select name usage)
    let updated_cmds = (echo $cmds | insert camel {|it| $it.name + 'Completion' | str camel-case } )

    let ts = (echo $updated_cmds |
    each {|it|
        let line1 = ([ "      const " $it.camel " = new vscode.CompletionItem('" $it.name "');" (char newline) ] | str join)
        let line2 = ([ "      " $it.camel ".commitCharacters = [' '];" (char newline) (char newline) ] | str join)
        $line1 + $line2
    } | str join)

    [
        (echo $ts) (char nl) 
        "      return [ "
        (echo $updated_cmds | get camel | str join ', ')
        " ];"
        (char nl) '      },' (char nl), '    }' (char nl) '  );'
        (char nl) (char nl)
    ] | str join
}

# generate typescript from nushell subcommands
def gen-ts-subs [] {
    let cmds = (scope commands | where is_sub == true | select name usage | insert base { get name | split column ' ' base sub } | flatten --all)
    let updated_cmds = (echo $cmds | insert camelProvider {|row| $row.base + 'SubCommandsProvider' | str camel-case } | insert method {|row| $row.name | str camel-case})
    let subs_count = (scope commands | where is_sub == true | select name usage | insert base { get name | split column ' ' base sub} | flatten --all | group-by base | transpose cmd cmd_count | update cmd_count { get cmd_count | length })
    let subs_collection = (scope commands | where is_sub == true | select name usage | insert base { get name | split column ' ' base sub} | flatten --all | group-by base | transpose  cmd sub_cmds)

    let ts = ($subs_collection | each {|it|
        let preamble = (get sub_cmds | enumerate | each {|it|
            let method = ([ $it.item.name | str camel-case ] | str join)
            let camel = ([ $it.item.base 'SubCommandsProvider' | str camel-case ] | str join)
            if $it.index == 0 {
                let line01 = (["    const " $camel  " = vscode.languages.registerCompletionItemProvider(" (char newline)] | str join)
                let line02 = (["        'nushell'," (char nl)] | str join)
                let line03 = (["        {" (char nl)] | str join)
                let line04 = ([ "            provideCompletionItems(document: vscode.TextDocument, position: vscode.Position) {" (char nl) (char nl) ] | str join)
                let line05 = ([ "                const linePrefix = document.lineAt(position).text.substr(0, position.character);" (char nl) ] | str join)
                let line06 = ([ "                if (linePrefix.endsWith('" $it.item.base " ')) {" (char nl) (char nl) ] | str join)
                let line07 = ([ "                    const " $method " = new vscode.CompletionItem('" $it.item.sub "', vscode.CompletionItemKind.Method);" (char nl) ] | str join)
                let line08 = ([ '                    ' $method '.detail = "' $it.item.usage '";' (char nl) (char nl) ] | str join)
                $line01 + $line02 + $line03 + $line04 + $line05 + $line06 + $line07 + $line08
            } else {
                let line07 = ([ "                    const " $method " = new vscode.CompletionItem('" $it.item.sub "', vscode.CompletionItemKind.Method);" (char nl) ] | str join)
                let line08 = ([ '                    ' $method '.detail = "' $it.item.usage '";' (char nl) (char nl) ] | str join)
                $line07 + $line08
            }
        } | str join)

        let methods = (echo $it.sub_cmds.name | str camel-case | str join ', ')

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

        $preamble + $lines
    } | str join)

        let post01 = ("    context.subscriptions.push(" + (char nl))
        let post02 = ([ "        " (echo $updated_cmds | get camelProvider | uniq | str join ', ') (char nl) ] | str join)
        let post03 = ([ "    );" (char nl) "}" (char nl) ] | str join)

        [$ts $post01 $post02 $post03] | str join
}


[ (gen-ts-cmds-begin) (gen-ts-cmds) (gen-ts-subs) ] | str join | save -f extension.ts
