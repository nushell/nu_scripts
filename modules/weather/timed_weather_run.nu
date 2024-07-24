# This script will run a command, in this case get_weather, at a prescribed interval
# This is meant to be run from your prompt so that it runs every time you cd or
# run a command. Each time it will check if it's been longer than the interval and
# if so, run the command, otherwise it uses the cached weather information.
# I wrote this so I could have weather in my prompt but not pay the price of hitting
# the web for every prompt. It will need to be tweaked to actually be used in a
# prompt, but for now it just prints the weather in these 3 ways.
# 1. if it's never been run, it runs the weather command and saves the json cache info
# 2. if the interval has not expired yet, it prints the Cached information
# 3. if the interval has expired, it runs the weather command again and caches the info

# this script is dependent on get-weather
source get-weather.nu

#command to run at interval
def timed_weather_run [
    --command(-c): string # The command to run
    --interval(-i): duration # The interval duration
    ] {

    if $nu.os-info.name == "windows" {
        # $"The system is Windows(char nl)"
        # generate temp file name
        let weather_runtime_file = (($env.TMP) | path join weather_runtime_file.json)
        # does the temp file already exist, meaning we've written it previously
        if ($weather_runtime_file | path exists) {
            # $"Weather path exists [($weather_runtime_file)](char nl)"
            # open the file and get the last weather data and run time out of it
            let last_runtime_data = (open $weather_runtime_file)
            # get the last runtime and add my timezone difference
            let last_runtime = ($last_runtime_data | get last_run_time | into datetime)
            if $last_runtime + $interval > (date now) {
                # $"interval not met. last_runtime: [($last_runtime)](char nl)"
                let temp = ($last_runtime_data.Temperature)
                let emoji = ($last_runtime_data.Emoji)
                {
                    Temperature: ($temp)
                    Source: "cache"
                    Emoji: ($emoji)
                }
            } else {
                # save the run time and run the command
                # $"interval met, running command: [($command)](char nl)"

                # it would be nice to run a dynamic command here but doesn't appear to be possible
                # let weather_table = (do { $command })
                let weather_table = (if $command == "get_weather" {(get_weather)})
                let temp = ($weather_table.Temperature)
                let emoji = ($weather_table.Emoji)
                {
                    Temperature: ($temp)
                    Source: "expired-cache"
                    Emoji: ($emoji)
                }
                $weather_table | upsert last_run_time {(date now | format date '%Y-%m-%d %H:%M:%S %z')} | save $weather_runtime_file
            }
        } else {
            # $"Unable to find [($weather_runtime_file)], creating it(char nl)"
            let weather_table = (get_weather)
            let temp = ($weather_table.Temperature)
            let emoji = ($weather_table.Emoji)
            {
                Temperature: ($temp)
                Source: "initial"
                Emoji: ($emoji)
            }
            $weather_table | upsert last_run_time {(date now | format date '%Y-%m-%d %H:%M:%S %z')} | save $weather_runtime_file
        }
    } else {
        echo "Your command did not run because you are not on Windows..."
        # ToDo: refactor the info in the Windows section into another def. The only real difference
        # is where the temp file will be located. Mac & Linux probably should be in /tmp I guess.
        # everything else is linux or mac
    }
}

timed_weather_run --command "get_weather" --interval 1min
