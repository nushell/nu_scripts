# Convert Fahrenheit to Celcius
def "temp f-to-c" [
     fahren:number # Degrees Fahrenheit
    ] {
    # (100°F − 32) × 5/9 = 37.778°C

    let celcius = (($fahren - 32) * 5 / 9)
    build-string $fahren ' °F is ' $celcius ' °C'
}

# Convert Fahrenheit to Kelvin
def "temp f-to-k" [
     fahren:number # Degrees Fahrenheit
    ] {
    # (100°F − 32) × 5/9 + 273.15 = 310.928K

    let kelvin = (($fahren - 32) * 5 / 9 + 273.15)
    build-string $fahren ' °F is ' $kelvin ' °K'
}

# Convert Celcius to Fahrenheit
def "temp c-to-f" [
     celcius:number # Degrees Celcius
    ] {
    # (100°C × 9/5) + 32 = 212°F

    let fahren = (($celcius * 9 / 5) + 32)
    build-string $celcius ' °C is ' $fahren ' °F'
}

# Convert Celcius to Kelvin
def "temp c-to-k" [
     celcius:number # Degrees Celcius
    ] {
    # 100°C + 273.15 = 373.15K

    let kelvin = ($celcius + 273.15)
    build-string $celcius ' °C is ' $kelvin ' °K'
}

# Convert Kelvin to Fahrenheit
def "temp k-to-f" [
     kelvin:number # Degrees Fahrenheit
    ] {
    # (100K − 273.15) × 9/5 + 32 = -279.7°F

    let fahren = (($kelvin - 273.15) * 9 / 5 + 32)
    build-string $kelvin ' °K is ' $fahren ' °F'
}

# Convert Kelvin to Celcius
def "temp k-to-c" [
     kelvin:number # Degrees Celcius
    ] {
    # 100K − 273.15 = -173.1°C

    let celcius = ($kelvin - 273.15)
    build-string $kelvin ' °K is ' $celcius ' °C'
}

temp f-to-c 100
echo (char nl)
temp f-to-k 100
echo (char nl)
temp c-to-f 100
echo (char nl)
temp c-to-k 100
echo (char nl)
temp k-to-f 100
echo (char nl)
temp k-to-c 100
echo (char nl)
