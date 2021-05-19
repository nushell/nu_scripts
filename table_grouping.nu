let table = (echo [
    [url user_login title
    ]; [https://api.github.com/repos/nushell/nushell/issues/3382 ammkrn 'Dont unwrap rustyline helper in cli'
    ] [https://api.github.com/repos/nushell/nushell/issues/3379 jonathandturner 'Simplify down to one type of context'
    ] [https://api.github.com/repos/nushell/nushell/issues/3377 kubouch 'Port range to engine-p'
    ] [https://api.github.com/repos/nushell/nushell/issues/3375 fdncred 'added check for endian-ness, added a bytes and skip'
    ] [https://api.github.com/repos/nushell/nushell/issues/3374 fdncred 'added ability to change "#" color using header_color'
    ] [https://api.github.com/repos/nushell/nushell/issues/3370 fdncred 'add nu-pretty-hex, add into binary, update binaryview'
    ] [https://api.github.com/repos/nushell/nushell/issues/3367 fdncred 'tweaked the error handling to show specific errors']
])

# Show what the table looks like
echo $table

# Now show what the table in Markdown looks like
build-string '## Nushell' (char nl) (char nl)
echo $table | group-by user_login | pivot user prs | each {
    let user_name = $it.user
    let pr_count = (echo $it.prs | length)

    # only print the comma if there's another item
    let user_prs = (echo $it.prs | each -n {
        if $pr_count == ($it.index + 1) {
            build-string '[' $it.item.title '](' $it.item.url ')'
        } {
            build-string '[' $it.item.title '](' $it.item.url '), and '
        }
    } | str collect)

    build-string '- ' $user_name ' created ' $user_prs (char nl)
} | str collect

# ╭───┬──────────────────────────────────────────────────────────┬─────────────────┬───────────────────────────────────────────────────────╮
# │ # │ url                                                      │ user_login      │ title                                                 │
# ├───┼──────────────────────────────────────────────────────────┼─────────────────┼───────────────────────────────────────────────────────┤
# │ 0 │ https://api.github.com/repos/nushell/nushell/issues/3382 │ ammkrn          │ Dont unwrap rustyline helper in cli                   │
# │ 1 │ https://api.github.com/repos/nushell/nushell/issues/3379 │ jonathandturner │ Simplify down to one type of context                  │
# │ 2 │ https://api.github.com/repos/nushell/nushell/issues/3377 │ kubouch         │ Port range to engine-p                                │
# │ 3 │ https://api.github.com/repos/nushell/nushell/issues/3375 │ fdncred         │ added check for endian-ness, added a bytes and skip   │
# │ 4 │ https://api.github.com/repos/nushell/nushell/issues/3374 │ fdncred         │ added ability to change "#" color using header_color  │
# │ 5 │ https://api.github.com/repos/nushell/nushell/issues/3370 │ fdncred         │ add nu-pretty-hex, add into binary, update binaryview │
# │ 6 │ https://api.github.com/repos/nushell/nushell/issues/3367 │ fdncred         │ tweaked the error handling to show specific errors    │
# ╰───┴──────────────────────────────────────────────────────────┴─────────────────┴───────────────────────────────────────────────────────╯

def log [message:any] {
    let now = (date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = (build-string $now '|DBG|' $message (char newline))
    echo $mess | autoview
}
