#!/usr/bin/env nu
#script to get basic info from twitter's unofficial API
def main [...usernames: string] {

let bearer = "Bearer AAAAAAAAAAAAAAAAAAAAANRILgAAAAAAnNwIzUejRCOuH5E6I8xnZz4puTs%3D1Zv7ttfk8LF81IUq16cHjhLTvJu4FA33AGWWjCpTnA"
let token_endpoint = 'https://api.twitter.com/1.1/guest/activate.json'
let user_endpoint = 'https://twitter.com/i/api/graphql/gr8Lk09afdgWo7NvzP89iQ/UserByScreenName'

#obtaining the guest token needed to perform further request

let token = (
     post -H [Authorization $bearer] $token_endpoint ''
).guest_token

for $twitter_username in $usernames {

        #getting all the useful data from the api

        let variables = {
                screen_name: $twitter_username,
                withSafetyModeUserFields: true,
                withSuperFollowsUserFields: true
        }

        post $user_endpoint -t application/x-www-form-urlencoded [ variables ($variables|to json -r) ] -H [ Authorization $bearer,  x-guest-token $token ] | get data.user.result | flatten | select name screen_name description protected verified created_at followers_count rest_id has_nft_avatar | get 0
}

}
