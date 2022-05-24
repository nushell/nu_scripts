let nudoc_changes = (gh api repos/nushell/nushell.github.io/compare/86c6a2cdc189ec1925dde54a84204385e1010022...main | 
  from json | 
  get commits | 
  where commit.message =~ '.+\(#(\d+)\).*' | 
  upsert pull_request { 
    |$in| $in.commit.message | 
      head -n 1 | 
      str replace '.+\(#(\d+)\).*' 'https://github.com/nushell/nushell.github.io/pull/$1'
    } | 
  upsert author_nick {$in.author.login} | 
  upsert author_name {$in.commit.author.name} | 
  upsert message {$in.commit.message} | 
  select message pull_request author_nick author_name)
