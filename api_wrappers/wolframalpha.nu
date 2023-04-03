#Fetch simple anwser from WolframAlpha API
def wolfram [...query #Your query
] {
    let appID = #YOUR APP_ID
    let query_string = ($query | str join " ")
    let result = (fetch ("https://api.wolframalpha.com/v1/result?" + ([[appid i]; [$appID $query_string]] | to url)))
    $result + ""
}

#Fetch image with full anwser from WolframAlpha API
def wolframimg [...query #Your query
] {
    let appID = #YOUR APP_ID
    let query_string = ($query | str join " ")
    let filename = ($query_string + ".png")
    let link = ("https://api.wolframalpha.com/v1/simple?" + ([[appid i]; [$appID $query_string]] | to url) + "&background=F5F5F5&fontsize=20")
    fetch $link | save $filename
    echo ("Query result saved in file: " + $filename)
}
