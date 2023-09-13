
# Convert Fahrenheit to Celcius
export def f-to-c [
     fahren: number # Degrees Fahrenheit
     --round(-r): int = 2 # Digits of precision to round to
    ] {
    # (100°F − 32) × 5/9 = 37.778°C
    let $n = if ($fahren | describe) == "float" {$fahren} else {$fahren | into float }
    let celcius = ((( $n - 32.) * 5 / 9. ) | math round -p $round )
    $"($fahren) °F is ($celcius) °C"
}

# Convert Fahrenheit to Kelvin
export def f-to-k [
     fahren: number # Degrees Fahrenheit
     --round(-r): int = 2 # Digits of precision to round to
    ] {
    # (100°F − 32) × 5/9 + 273.15 = 310.928K

    let $n = if ($fahren | describe) == "float" {$fahren} else {$fahren | into float }
    let kelvin = ((($n - 32) * 5 / 9 + 273.15)| math round -p $round )
    $"($fahren) °F is ($kelvin) °K"
}

# Convert Celcius to Fahrenheit
export def c-to-f [
     celcius: number # Degrees Celcius
     --round(-r): int = 2 # Digits of precision to round to
    ] {
    # (100°C × 9/5) + 32 = 212°F

    let $n = if ($celcius | describe) == "float" {$celcius} else {$celcius | into float }
    let fahren = ((($n * 9 / 5) + 32) | math round -p $round )
    $"($celcius) °C is ($fahren) °F"
}

# Convert Celcius to Kelvin
export def c-to-k [
     celcius: number # Degrees Celcius
     --round(-r): int = 2 # Digits of precision to round to
    ] {
    # 100°C + 273.15 = 373.15K


    let $n = if ($celcius | describe) == "float" {$celcius} else {$celcius | into float }
    let kelvin = (($n + 273.15) | math round -p $round )
    $"($celcius) °C is ($kelvin) °K"
}

# Convert Kelvin to Fahrenheit
export def k-to-f [
     kelvin:number # Degrees Fahrenheit
     --round(-r): int = 2 # Digits of precision to round to
    ] {
    # (100K − 273.15) × 9/5 + 32 = -279.7°F

    let $n = if ($kelvin | describe) == "float" {$kelvin} else {$kelvin | into float }
    let fahren = ((($n - 273.15) * 9 / 5 + 32) | math round -p $round )
    $"($kelvin) °K is ($fahren) °F"
}

# Convert Kelvin to Celcius
export def k-to-c [
     kelvin:number # Degrees Celcius
     --round(-r): int = 2 # Digits of precision to round to
    ] {
    # 100K − 273.15 = -173.1°C

    let $n = if ($kelvin | describe) == "float" {$kelvin} else {$kelvin | into float }
    let celcius = (($n - 273.15) | math round -p $round )
    $"($kelvin) °K is ($celcius) °C"
}
