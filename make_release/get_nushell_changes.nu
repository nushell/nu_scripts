let nushell_changes = (gh api repos/nushell/nushell/compare/0.62.0...main | 
  from json | 
  get commits | 
  where commit.message =~ '.+\(#(\d+)\).*' | 
  upsert pull_request { 
    |$in| $in.commit.message | 
      head -n 1 | 
      str replace '.+\(#(\d+)\).*' 'https://github.com/nushell/nushell/pull/$1'
    } | 
  upsert author_nick {$in.author.login} | 
  upsert author_name {$in.commit.author.name} | 
  upsert message {$in.commit.message} | 
  select message pull_request author_nick author_name)
