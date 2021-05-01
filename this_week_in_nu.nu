# fetch https://api.github.com/repos/nushell/nushell/pulls?q=is%3Apr+merged%3A%3E%3D2021-04-20+ | select url user.login title body
# fetch https://api.github.com/search/issues?q=repo:nushell/vscode-nushell-lang+is:pr+is:merged+merged:%3E2021-04-01 | get items | select url user.login title body
# Repos to monitor

# TODO - group-by user so all there PRs are on one line
# TODO - automatically figure out what week it is

def do-work [] {
  let site_table = [
    [site url
    ]; [Nushell nushell
    ] [Extension vscode-nushell-lang
    ] [Documentation nushell.github.io
    ] [Wasm demo
    ] [Nu_Scripts nu_scripts
    ] [RFCs rfcs]
    # ] [Jupyter jupyter]
  ]

  let query_prefix = "https://api.github.com/search/issues?q=repo:nushell/"
  let query_date = $(seq date --days 7 -r | last)
  # let query_select = " | get items | select url user.login title"
  let query_suffix = $(build-string "+is:pr+is:merged+merged:%3E%3D" $query_date)

  # echo $site_table

  let entries = $(echo $site_table | each {
      let query_string = $(build-string $query_prefix $it.url $query_suffix)
      # debug string
      # build-string 'fetch ' $query_string $(char nl) | autoview
      # fetch $query_string
      let site_json = $(fetch $query_string | get items | select url user.login title)
      # echo $site_json | autoview
      build-string '## ' $(echo $it.site) $(char nl) $(char nl)
      if $(= $site_json | empty?) {

      } {
        echo $site_json | each {
          build-string '- ' $it.user_login ' created [' $it.title '](' $it.url ')' $(char nl)
        } | str collect
        build-string $(char nl)
        }
      # We need 2 seconds between fetches or github's api limiting will limit us
      sleep 2sec
  })
  if $(= $entries | empty?) {

  } {
    echo $entries | str collect
  }
}

# 2019-08-23 was the release of 0.2.0, the first public release
let week_num = $(seq date -b '2019-08-23' -n 7 | length)
build-string '# This week in Nushell #' $week_num $(char nl) $(char nl)
do-work | str collect
