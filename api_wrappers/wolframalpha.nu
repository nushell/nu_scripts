def wolfram [...query] {
    let appID = #YOUR APP_ID
    let query_string = ($query | str collect " ")
    let result = (fetch ("https://api.wolframalpha.com/v1/result?" + ([[appid i]; [$appID $query_string]] | to url)))
    $result + ""
}
