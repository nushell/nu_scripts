#!/usr/bin/env nu
let protections = {
    required_status_checks: {
        strict: true
        checks: [
            {
                context: 'YOUR CHECK HERE'
                app_id: 'YOUR APP ID HERE'
            }
        ]
    }
    required_pull_request_reviews: {
        dismiss_stale_reviews: true
        require_code_owner_reviews: true
        bypass_pull_request_allowances: {
            apps: [
                YOUR APP HERE
            ]
        }
    }
    restrictions: {
        users: []
        teams: []
        apps: [
           YOUR APP HERE
        ]
    }
    enforce_admins: true
    required_linear_history: true
    require_conversation_resolution: true
    allow_deletions: false
    allow_force_pushes: false
}
gh api $"orgs/($env.OWNER)/repos"
|from json
|select name default_branch
|each {|repo|
    echo $"Setting branch restrictions for ($repo.name)"
    $protections
    |to json
    |gh api -X PUT $"repos/($env.OWNER)/($repo.name)/branches/($repo.default_branch)/protection" --input -
}
