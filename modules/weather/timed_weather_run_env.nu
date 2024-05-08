# This script will run a command, in this case get_weather, at a prescribed interval
# This is meant to be run from your prompt so that it runs every time you cd or
# run a command. Each time it will check if it's been longer than the interval and
# if so, run the command, otherwise it uses the cached weather information.
# I wrote this so I could have weather in my prompt but not pay the price of hitting
# the web for every prompt.

# this script is dependent on get-weather
use get-weather.nu get_weather

# Create a mutable weather table to hold the weather data
$env.WEATHER = (get_weather | upsert last_run_time { (date now | format date '%Y-%m-%d %H:%M:%S %z')})

#command to run at interval
def --env timed_weather_run [
    --interval(-i): duration # The interval duration
    ] {

    # get the last runtime and add my timezone difference
    let last_runtime = ($env.WEATHER | get last_run_time | into datetime)
    if $last_runtime + $interval > (date now) {
        # $"interval not met. last_runtime: [($last_runtime)](char nl)"
        let temp = ($env.WEATHER.Temperature)
        let emoji = ($env.WEATHER.Emoji)
        {
            Temperature: ($temp)
            Source: "cache"
            Emoji: ($emoji)
        }
    } else {
        # $"interval met, running command: [($command)](char nl)"

        $env.WEATHER = (get_weather | upsert last_run_time { (date now | format date '%Y-%m-%d %H:%M:%S %z')})
        let temp = ($env.WEATHER.Temperature)
        let emoji = ($env.WEATHER.Emoji)
        {
            Temperature: ($temp)
            Source: "expired-cache"
            Emoji: ($emoji)
        }
    }
}

timed_weather_run --interval 1min
