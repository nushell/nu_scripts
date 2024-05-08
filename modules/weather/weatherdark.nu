# Weather Script based on IP Address
# - Weather using dark weather api
# - Air pollution condition using airvisual api
# - Street address using google maps api
# - Version 2.0
export def --env weatherds [] {
    get_weather (get_location 0)
}

# location functions thanks to https://github.com/nushell/nu_scripts/tree/main/weather
def locations [] {
    [
        [location city_column state_column country_column lat_column lon_column];
        ["http://ip-api.com/json/" city region countryCode lat lon]
        ["https://ipapi.co/json/" city region_code country_code latitude longitude]
        ["https://freegeoip.app/json/" city region_code country_code latitude longitude]
        ["https://ipwhois.app/json/" city region country_code  latitude longitude]
    ]
}

def get_location [index: int] {
    let wifi = (iwgetid -r)
    let loc_json = (http get (locations | select $index).0.location)

    # if ip address in your home isn't precise, you can force a location
    if $wifi =~ "my_wifi" { "your_lat,your_lon" } else { $"($loc_json.lat),($loc_json.lon)" }
}

# dark sky
def "http get_api" [loc] {
    let apiKey = "ds_api_key"
    let options = "?lang=en&units=si&exclude=minutely,hourly,flags"

    let url = $"https://api.darksky.net/forecast/($apiKey)/($loc)($options)"

    http get $url
}

# street address
def get_address [loc] {
    let mapsAPIkey = "maps_api_key"
    let url = $"https://maps.googleapis.com/maps/api/geocode/json?latlng=($loc)&sensor=true&key=($mapsAPIkey)"

    (http get $url).results.0.formatted_address
}

# wind description (adjust to your liking)
def desc_wind [wind] {
    if $wind < 30 { "Normal" } else if $wind < 50 { "Moderate" } else if $wind < 60 { "Strong" } else { "Very Strong" }
}

# uv description (standard)
def uv_class [uvIndex] {
    if $uvIndex < 2.9 { "Low" } else if $uvIndex < 5.9 { "Moderate" } else if $uvIndex < 7.9 { "High" } else if $uvIndex < 10.9 { "Very High" } else { "Extreme" }
}

# air pollution
def get_airCond [loc] {
    let apiKey = "airvisual_api_key"
    let lat = (echo $loc | split row ",").0
    let lon = (echo $loc | split row ",").1
    let url = $"https://api.airvisual.com/v2/nearest_city?lat=($lat)&lon=($lon)&key=($apiKey)"
    let aqius = (http get $url).data.current.pollution.aqius

    # classification (standard)
    if $aqius < 51 { "Good" } else if $aqius < 101 { "Moderate" } else if $aqius < 151 { "Unhealthy for some" } else if $aqius < 201 { "Unhealthy" } else if $aqius < 301 { "Very unhealthy" } else { "Hazardous" }
}

# parse all the information
def get_weather [loc] {

    let response = (http get_api $loc)
    let address = (get_address $loc)
    let air_cond = (get_airCond $loc)

    ## Current conditions
    let cond = $response.currently.summary
    let temp = $response.currently.temperature
    let wind = $response.currently.windSpeed * 3.6
    let humi = $response.currently.humidity * 100
    let uvIndex = $response.currently.uvIndex
    let suntimes = ($response.daily.data | select sunriseTime sunsetTime | select 0 | update cells {|f| $f | into string | into datetime -o -4 | into string})

    let sunrise = ($suntimes | get sunriseTime | get 0 | split row ' ' | get 3)
    let sunset = ($suntimes | get sunsetTime | get 0 | split row ' ' | get 3)
    let vientos = (desc_wind $wind)
    let uvClass = (uv_class $uvIndex)

    let Vientos = $"($vientos) \(($wind | into string -d 2) Km/h\)"
    let humedad = $"($humi)%"
    let temperature = $"($temp)°C"

    let current = {
        "Condition": ($cond)
        Temperature: ($temperature)
        Humidity: ($humedad)
        Wind: ($Vientos)
        "UV Index": ($uvClass)
        "Air condition": ($air_cond)
        Sunrise: ($sunrise)
        Sunset: ($sunset)
    }

    ## Forecast
    let forecast = ($response.daily.data | select summary temperatureMin temperatureMax windSpeed humidity precipProbability precipIntensity uvIndex | update windSpeed {|f| $f.windSpeed * 3.6} | update precipIntensity {|f| $f.precipIntensity * 24} | update precipProbability {|f| $f.precipProbability * 100} | update humidity {|f| $f.humidity * 100} | update uvIndex {|f| uv_class $f.uvIndex} | update windSpeed {|f| $"(desc_wind $f.windSpeed) \(($f.windSpeed | into string -d 2)\)"} | rename Summary "T° min (°C)" "T° max (°C)" "Wind Speed (Km/h)" "Humidity (%)" "Precip. Prob. (%)" "Precip. Intensity (mm)")

    ## plots (require custom command gnu-plot)
    ($forecast | select "Humidity (%)") | gnu-plot
    ($forecast | select "Precip. Intensity (mm)") | gnu-plot
    ($forecast | select "Precip. Prob. (%)") | gnu-plot
    ($forecast | select "T° max (°C)") | gnu-plot
    ($forecast | select "T° min (°C)") | gnu-plot

    ## forecast
    echo $"Forecast: ($response.daily.summary)"
    echo $forecast

    ## current
    echo $"Current conditions: ($address)"
    echo $current
}


# Get weather for right command prompt (set in config.nu)
export def --env get_weather_by_interval [INTERVAL_WEATHER] {
    let weather_runtime_file = (($env.HOME) | path join .weather_runtime_file.json)

    if ($weather_runtime_file | path exists) {
        let last_runtime_data = (open $weather_runtime_file)

        let LAST_WEATHER_TIME = ($last_runtime_data | get last_weather_time)

        if ($LAST_WEATHER_TIME | into datetime) + $INTERVAL_WEATHER < (date now) {
            let WEATHER = (get_weather_for_prompt (get_location 0))
            let NEW_WEATHER_TIME = (date now | format date '%Y-%m-%d %H:%M:%S %z')

            $last_runtime_data | upsert weather $WEATHER | upsert last_weather_time $NEW_WEATHER_TIME | save $weather_runtime_file

            $WEATHER
        } else {
            $last_runtime_data | get weather
        }
    } else {
        let WEATHER = (get_weather_for_prompt (get_location 0))
        let LAST_WEATHER_TIME = (date now | format date '%Y-%m-%d %H:%M:%S %z')

        let WEATHER_DATA = {
            "weather": ($WEATHER)
            "last_weather_time": ($LAST_WEATHER_TIME)
        }

        $WEATHER_DATA | save $weather_runtime_file
        $WEATHER
    }
}

def get_weather_for_prompt [loc] {

    let response = (http get_api $loc)

    ## current conditions
    let cond = $response.currently.summary
    let temp = $response.currently.temperature
    let temperature = $"($temp)°C"
    let icon = (get_weather_icon $response.currently.icon)

    let current = {
        Condition: ($cond)
        Temperature: ($temperature)
        Icon: ($icon)
    }

    echo $"($current.Icon) ($current.Temperature)"
}

def get_weather_icon [icon: string] {
    switch $icon {
     "clear-day": {"☀️"},
     "clear-night": {"🌑"},
     "rain": {"🌧️"},
     "snow": {"❄️"},
     "sleet": {🌨️},
     "wind": {"🌬️"},
     "fog": {"🌫"},
     "cloudy": {"☁️"},
     "partly-cloudy-day": {"🌤️"},
     "partly-cloudy-night": {"🌑☁️"},
     "hail": {🌨},
     "thunderstorm": {"🌩️"},
     "tornado": {"🌪️"}
    }
}
