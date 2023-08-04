let table = (echo [
    [url user_login title];
    [https://api.github.com/repos/nushell/nushell/issues/3382 ammkrn 'Dont unwrap rustyline helper in cli']
    [https://api.github.com/repos/nushell/nushell/issues/3379 jonathandturner 'Simplify down to one type of context']
    [https://api.github.com/repos/nushell/nushell/issues/3377 kubouch 'Port range to engine-p']
    [https://api.github.com/repos/nushell/nushell/issues/3375 fdncred 'added check for endian-ness, added a bytes and skip']
    [https://api.github.com/repos/nushell/nushell/issues/3374 fdncred 'added ability to change ']
    [https://api.github.com/repos/nushell/nushell/issues/3370 fdncred 'add nu-pretty-hex, add into binary, update binaryview']
    [https://api.github.com/repos/nushell/nushell/issues/3367 fdncred 'tweaked the error handling to show specific errors']
])

# Show what the table looks like
print $"This is an example table (char nl)"
print $table

print $"This is markdown created from the example table (char nl)"
# Now show what the table in Markdown looks like
print $"## Nushell(char nl)(char nl)"
print ($table | group-by user_login | transpose user prs | each { |row|
    let user_name = $row.user
    let pr_count = (echo $row.prs | length)

    # only print the comma if there's another item
    let user_prs = ($row.prs | enumerate | each { |pr|
        if $pr_count == ($pr.index + 1) {
            echo $'[($pr.item.title)](char lp)($pr.item.url)(char rp)'
        } else {
            echo $'[($pr.item.title)](char lp)($pr.item.url)(char rp), and '
        }
    } | str join)

    echo $"- ($user_name) created ($user_prs) (char nl)"

} | str join)

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
    let now = (date now | format date '%Y%m%d_%H%M%S.%f')
    let mess = ([$now '|DBG|' $message (char newline)] | str join)
    echo $mess
}
