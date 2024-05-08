###################################################
## Weather Script based on IP Address v1.0
###################################################
def locations [] {
    [
        [location city_column state_column country_column lat_column lon_column];
        ["http://ip-api.com/json/" city region countryCode lat lon]
        ["https://ipapi.co/json/" city region_code country_code latitude longitude]
        ["https://freegeoip.app/json/" city region_code country_code latitude longitude]
        ["https://ipwhois.app/json/" city region country_code  latitude longitude]
    ]
}

def get_my_location [index: int] {
    let loc_json = (fetch (locations | nth $index).location)
    let city_column = (locations | nth $index).city_column
    let state_column = (locations | nth $index).state_column
    let country_column = (locations | nth $index).country_column
    let lat_column = (locations | nth $index).lat_column
    let lon_column = (locations | nth $index).lon_column

    # echo $loc_json
    if ($city_column | str length) > 1 {
        if ($state_column | str length) > 1 {
            if ($country_column | str length) > 1 {
                let lookup_state = ($loc_json | get ($state_column | into column-path))
                if ($lookup_state | str length) > 2 {
                    let state = (state_abbrev_lookup $lookup_state)
                    $"($loc_json | get ($city_column | into column-path)),($state),($loc_json | get ($country_column | into column-path))"
                } {
                    $"($loc_json | get ($city_column | into column-path)),($loc_json | get ($state_column | into column-path)),($loc_json | get ($country_column | into column-path))"
                }
            } {
                $"($loc_json | get ($city_column | into column-path)),($loc_json | get ($state_column | into column-path))"
            }
        } {
            $"($loc_json | get ($city_column | into column-path))"
        }
    } {
        "No City Found"
    }
}

let URL_QUERY_LOCATION = "https://api.openweathermap.org/geo/1.0/direct"
let TOKEN = "85a4e3c55b73909f42c6a23ec35b7147"

def get_location_by_ip [locIdx: int] {
    let location = (get_my_location $locIdx)
    let url = $"($URL_QUERY_LOCATION)?q=($location)&limit=5&appid=($TOKEN)"
    # echo $url
    fetch $url
}

let URL_WEATHER = "https://api.openweathermap.org/data/2.5/weather"

def get_weather_by_ip [locIdx: int, units: string] {
    # units
    # f = imperial aka Fahrenheit
    # c = metric aka Celsius
    let coords = (get_location_by_ip $locIdx)
    if ($coords | length) > 1 {
        [
            [msg, labels, span];
            ["Error getting location", "There were more than one locations found", ([[start, end]; [0, 1]])]
        ] | error make
    } { }

    if $units == "f" {
        let units = "imperial"
        let url = $"($URL_WEATHER)?lat=($coords.lat)&lon=($coords.lon)&units=($units)&appid=($TOKEN)"
        # echo $url (char nl)
        let weather = (fetch $url)
        # echo $weather | pivot | flatten | flatten
        [
        ['Weather Location' Longitude Latitude Temperature 'Feels Like' Humidity Pressure Emoji];
        [$"($weather.name), ($weather.sys.country)" ($weather.coord.lon) ($weather.coord.lat) $"($weather.main.temp | into string -d 1) °F" $"($weather.main.feels_like | into string -d 1) °F" ($weather.main.humidity) ($weather.main.pressure) (get_icon_from_table $weather.weather.main.0)]
        ]
    } {
        let units = "metric"
        let url = $"($URL_WEATHER)?lat=($coords.lat)&lon=($coords.lon)&units=($units)&appid=($TOKEN)"
        # echo $url (char nl)
        let weather = (fetch $url)
        # echo $weather | pivot | flatten | flatten
        [
        ['Weather Location' Longitude Latitude Temperature 'Feels Like' Humidity Pressure Emoji];
        [$"($weather.name), ($weather.sys.country)" ($weather.coord.lon) ($weather.coord.lat) $"($weather.main.temp | into string -d 1) °C" $"($weather.main.feels_like | into string -d 1) °C" ($weather.main.humidity) ($weather.main.pressure) (get_icon_from_table $weather.weather.main.0)]
        ]
    }
}

def weather_emoji_table [] {
    [
        [name, icon];
        ['Clear', (char sun)]
        ['Clouds', (char clouds)]
        ['Rain', (char rain)]
        ['Fog', (char fog)]
        ['Mist', (char mist)]
        ['Haze', (char haze)]
        ['Snow', (char snow)]
        ['Thunderstorm', (char thunderstorm)]
    ]
}

def get_icon_from_table [w] {
    weather_emoji_table | where name == $w | get icon
}

# Get the local weather by ip address
def get_weather [
    --locIdx(-l): int # The location id 0-3
    --units(-u): string # The units "f" or "c"
    ] {
    let is_loc_empty = ($locIdx | empty?)
    let is_units_empty = ($units | empty?)

    let no_loc_no_unit = ($is_loc_empty == $true and $is_units_empty == $true)
    let no_loc_with_unit = ($is_loc_empty == $true and $is_units_empty == $false)
    let with_loc_no_unit = ($is_loc_empty == $false and $is_units_empty == $true)
    let with_loc_with_unit = ($is_loc_empty == $false and $is_units_empty == $false)

    # This is a cautionary tale, the commented out code below is returning
    # and autoview is viewing the data, so no structured data is being returned.
    # The ramification to this is you can't do get_weather | select Temperature Emoji
    # like you should be able to. The following uncommented section below fixes it.

    # Hopefully we'll be able to fix this somehow because it's easy to fall into
    # this hole without knowing.

    # if $no_loc_no_unit {
    #     echo "no_loc_no_unit"
    #     (get_weather_by_ip 0 "f")
    # } { }

    # if $no_loc_with_unit {
    #     echo "no_loc_with_unit"
    #     (get_weather_by_ip 0 $units)
    # } { }

    # if $with_loc_no_unit {
    #     echo "with_loc_no_unit"
    #     (get_weather_by_ip $locIdx "f")
    # } { }

    # if $with_loc_with_unit {
    #     echo "with_loc_with_unit"
    #     (get_weather_by_ip $locIdx $units)
    # } { }

    if $no_loc_no_unit {
        (get_weather_by_ip 0 "f")
    } { if $no_loc_with_unit {
        (get_weather_by_ip 0 $units)
    } { if $with_loc_no_unit {
        (get_weather_by_ip $locIdx "f")
    } { if $with_loc_with_unit {
        (get_weather_by_ip $locIdx $units)
    } { } }}}
}

def state_abbrev_lookup [state_name: string] {
    # Weather Location 3 does not return state name abbreviations
    # so we have to convert a state full name to a state abbreviation
    let lookup_table = (
        [
            [state abbrev];
            ["Alabama" "AL"]
            ["Alaska" "AK"]
            ["Arizona" "AZ"]
            ["Arkansas" "AR"]
            ["California" "CA"]
            ["Colorado" "CO"]
            ["Connecticut" "CT"]
            ["Delaware" "DE"]
            ["Florida" "FL"]
            ["Georgia" "GA"]
            ["Hawaii" "HI"]
            ["Idaho" "ID"]
            ["Illinois" "IL"]
            ["Indiana" "IN"]
            ["Iowa" "IA"]
            ["Kansas" "KS"]
            ["Kentucky" "KY"]
            ["Louisiana" "LA"]
            ["Maine" "ME"]
            ["Maryland" "MD"]
            ["Massachusetts" "MA"]
            ["Michigan" "MI"]
            ["Minnesota" "MN"]
            ["Mississippi" "MS"]
            ["Missouri" "MO"]
            ["Montana" "MT"]
            ["Nebraska" "NE"]
            ["Nevada" "NV"]
            ["New Hampshire" "NH"]
            ["New Jersey" "NJ"]
            ["New Mexico" "NM"]
            ["New York" "NY"]
            ["North Carolina" "NC"]
            ["North Dakota" "ND"]
            ["Ohio" "OH"]
            ["Oklahoma" "OK"]
            ["Oregon" "OR"]
            ["Pennsylvania" "PA"]
            ["Rhode Island" "RI"]
            ["South Carolina" "SC"]
            ["South Dakota" "SD"]
            ["Tennessee" "TN"]
            ["Texas" "TX"]
            ["Utah" "UT"]
            ["Vermont" "VT"]
            ["Virginia" "VA"]
            ["Washington" "WA"]
            ["West Virginia" "WV"]
            ["Wisconsin" "WI"]
            ["Wyoming" "WY"]
        ]
    )

    $lookup_table | where state == $state_name | get abbrev
}

# To run this call
# > get_weather
# it will default to location 0 and Fahrenheit degrees
# > get_weather -l 1
# This changes to location 1. Locations are listed in the locations custom command above
# > get_weather -l 2 -u c
# This uses location 2 and Celsius degrees. f = Fahrenheit, c = Celsius

# Since I live in the USA I have not tested outside the country.
# We'll take PRs for things that are broke or augmentations.