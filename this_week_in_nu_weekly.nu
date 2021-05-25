# fetch https://api.github.com/repos/nushell/nushell/pulls?q=is%3Apr+merged%3A%3E%3D2021-04-20+ | select html_url user.login title body
# fetch https://api.github.com/search/issues?q=repo:nushell/nushell+is:pr+is:merged+merged:%3E2021-05-08 | get items | select html_url user.login title body
# Repos to monitor

def do-work [] {
  let site_table = [
    [site repo
    ]; [Nushell nushell
    ] [Extension vscode-nushell-lang
    ] [Documentation nushell.github.io
    ] [Wasm demo
    ] [Nu_Scripts nu_scripts
    ] [RFCs rfcs]
    # ] [Jupyter jupyter]
  ]

  let query_prefix = "https://api.github.com/search/issues?q=repo:nushell/"
  let query_date = (seq date --days 7 -r | last)
  let query_suffix = $"+is:pr+is:merged+merged:%3E%3D($query_date)"

  let entries = ($site_table | each {
      let query_string = $"($query_prefix)($it.repo)($query_suffix)"
      let site_json = (fetch $query_string | get items | select html_url user.login title)
      $"## ($it.site)(char nl)(char nl)"
      if ($site_json | all? ($it | empty?)) {
          $"none found this week(char nl)(char nl)"
      } {
          $site_json | group-by user_login | pivot user prs | each { |row|
          let user_name = $row.user
          let pr_count = ($row.prs | length)

          # only print the comma if there's another item
          let user_prs = ($row.prs | each -n { |pr|
              if $pr_count == ($pr.index + 1) {
                  $"[($pr.item.title)](char lparen)($pr.item.html_url)(char rparen)"
              } {
                  $"[($pr.item.title)](char lparen)($pr.item.html_url)(char rparen), and "
              }
          } | str collect)

          $"- ($user_name) created ($user_prs) (char nl)"
        } | str collect
        char nl
      }

      # We need 2 seconds between fetches or github's api limiting will limit us
      sleep 2sec
  })

  if ($entries | all? ($it | empty?)) {
  } {
      $entries | str collect
  }
}

# 2019-08-23 was the release of 0.2.0, the first public release
let week_num = (seq date -b '2019-08-23' -n 7 | length)
$"# This week in Nushell #($week_num)(char nl)(char nl)"
do-work | str collect
