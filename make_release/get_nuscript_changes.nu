let nuscript_changes = (gh api repos/nushell/nu_scripts/compare/30b8a449aef8ce1b2d2d24bf96d063dd7f3cced6...main | 
  from json | 
  get commits | 
  where commit.message =~ '.+\(#(\d+)\).*' | 
  upsert pull_request { 
    |$in| $in.commit.message | 
      head -n 1 | 
      str replace '.+\(#(\d+)\).*' 'https://github.com/nushell/nu_scripts/pull/$1'
    } | 
  upsert author_nick {$in.author.login} | 
  upsert author_name {$in.commit.author.name} | 
  upsert message {$in.commit.message} | 
  select message pull_request author_nick author_name)
