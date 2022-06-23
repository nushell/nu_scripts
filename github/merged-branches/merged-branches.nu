#!/usr/bin/env nu
gh api $"orgs/($env.OWNER)/repos"
|from json
|each {|repo|
    gh api $"repos/($env.OWNER)/($repo.name)/pulls?state=closed"
    |from json
    |if ($in|length) > 0 {
        each {|pull|
            print $"Removing branch ($pull.head.ref) from repo ($repo.name)"
            gh api -X DELETE $"repos/($env.OWNER)/($repo.name)/git/refs/heads/($pull.head.ref)"
        }
    } else {
        print $"Repo ($repo.name) has no branches to delete"
    }
}