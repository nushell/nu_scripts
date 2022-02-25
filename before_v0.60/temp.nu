# Convert Fahrenheit to Celcius
def "temp f-to-c" [
     fahren:number # Degrees Fahrenheit
    ] {
    # (100°F − 32) × 5/9 = 37.778°C

    let celcius = (($fahren - 32) * 5 / 9)
    $"($fahren) °F is ($celcius) °C"
}

# Convert Fahrenheit to Kelvin
def "temp f-to-k" [
     fahren:number # Degrees Fahrenheit
    ] {
    # (100°F − 32) × 5/9 + 273.15 = 310.928K

    let kelvin = (($fahren - 32) * 5 / 9 + 273.15)
    $"($fahren) °F is ($kelvin) °K"
}

# Convert Celcius to Fahrenheit
def "temp c-to-f" [
     celcius:number # Degrees Celcius
    ] {
    # (100°C × 9/5) + 32 = 212°F

    let fahren = (($celcius * 9 / 5) + 32)
    $"($celcius) °C is ($fahren) °F"
}

# Convert Celcius to Kelvin
def "temp c-to-k" [
     celcius:number # Degrees Celcius
    ] {
    # 100°C + 273.15 = 373.15K

    let kelvin = ($celcius + 273.15)
    $"($celcius) °C is ($kelvin) °K"
}

# Convert Kelvin to Fahrenheit
def "temp k-to-f" [
     kelvin:number # Degrees Fahrenheit
    ] {
    # (100K − 273.15) × 9/5 + 32 = -279.7°F

    let fahren = (($kelvin - 273.15) * 9 / 5 + 32)
    $"($kelvin) °K is ($fahren) °F"
}

# Convert Kelvin to Celcius
def "temp k-to-c" [
     kelvin:number # Degrees Celcius
    ] {
    # 100K − 273.15 = -173.1°C

    let celcius = ($kelvin - 273.15)
    $"($kelvin) °K is ($celcius) °C"
}

def temp [] {
    $"temperature conversions(char nl)"
    char nl
    $"Usage:(char nl)"
    $"    > temp ...args <subcommand> {flags}(char nl)"
    char nl
    $"Subcommands:(char nl)"
    $"  temp f-to-c - converts Fahrenheit to Celcius(char nl)"
    $"  temp f-to-k - converts Fahrenheit to Kelvin(char nl)"
    $"  temp c-to-f - converts Celcius to Fahrenheit(char nl)"
    $"  temp c-to-k - converts Celcius to Kelvin(char nl)"
    $"  temp k-to-f - converts Kelvin to Fahrenheit(char nl)"
    $"  temp k-to-c - converts Kelvin to Celcius(char nl)"
    char nl
    $"Parameters:(char nl)"
    $"  ...args: optionally convert by column paths(char nl)"
    char nl
    $"Flags:(char nl)"
    $"  -h, --help: Display this help message(char nl)"
    char nl    
}

temp f-to-c 100
char nl
temp f-to-k 100
char nl
temp c-to-f 100
char nl
temp c-to-k 100
char nl
temp k-to-f 100
char nl
temp k-to-c 100
char nl
