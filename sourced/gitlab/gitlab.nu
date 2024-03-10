#!/usr/bin/env nu

let base_url = ""
let page_size = 100
let projects = $"($base_url)/api/v4/projects/"

def call-gitlab [
  ...args: string
  --query: string
] {
  http get -H [Authorization $"Bearer ($env.GITLAB_TOKEN)"] $"($projects)($args|str join)?($query)"
}
# Search files on your GitLab server
def main [
  --base_url: string # base url of your GitLab instance
  --file: string # file (or path to file if in a subfolder) you want to scan
  --phrase: string # phrase you want to search for
  --branch: string # branch to scan
] {
    # /projects endpoint can return up to $page_size items which is why we need multiple calls to retrieve full list
  let num_of_pages = ((call-gitlab --query 'page=1&per_page=1&order_by=id&simple=true'|get id.0|into int) / $page_size|math round)
  seq 1 $num_of_pages|par-each {|page|
    call-gitlab --query $"page=($page)&per_page=($page_size)"|select name id
  }
  |flatten
  |par-each {|repo|
    let payload = (call-gitlab $repo.id '/repository/files/' $file --query $"ref=($branch)")
    if ($payload|columns|find message|is-empty) {
      $payload
      |get content
      |decode base64
      |lines
      |find $phrase
      |if ($in|length) > 0 {
          echo $"($file) in ($repo.name) repo contains ($phrase) phrase"
        }
    }
  }
}