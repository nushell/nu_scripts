function Set-Cursor {
    [CmdletBinding()]
    param ([int] $x, [int] $y)
    $Host.UI.RawUI.CursorPosition = @{x = $x; y = $y }
}

function Get-Character {
    [CmdletBinding()]
    param ([int]$index)
    $mystring = '                   Trevor Sullivan'
    return $index -ge ($mystring.Length) ? ' ' : $mystring[$index]
}

# write one cell at at time moving the cursor across the screen
# ~1900 ms
function main {
    # This is the same script as gradient.ps1 but hard coded
    # to 40x160 for nushell comparisions
    for ($y = 0; $y -le 39; $y++) {
        $Color = 25
        Set-Cursor -x $PSItem -y $y
        0..159 | ForEach-Object {
            Write-Host -Object ("`e[48;2;0;0;$Color`m{0}" -f (Get-Character -Index $PSItem)) -NoNewline
            $Color += 2
        }
    }
}

# Store the row in an array and then iterate the array to print it out a row at a time
# ~180 ms - This is printing double bytes or something - not sure what's going on
# Note that the x loop has half the characters so it doesn't count
function main2 {
    # This is the same script as gradient.ps1 but hard coded
    # to 40x160 for nushell comparisions
    for ($y = 0; $y -le 39; $y++) {
        $Color = 25
        $row = @()
        for ($x = 0; $x -le 79; $x++) {
            $row += ("`e[48;2;0;0;$Color`m{0}" -f (Get-Character -Index $x))
            $Color += 2
        }
        $row += "`e[0m`n"
        ,$row | foreach{Write-Host $_ -NoNewline}
    }
}

# Store the characters in a string and contatenate, then output a row at a time
# ~265 ms
function main3 {
    # This is the same script as gradient.ps1 but hard coded
    # to 40x160 for nushell comparisions
    for ($y = 0; $y -le 39; $y++) {
        $Color = 25
        $row = ""
        for ($x = 0; $x -le 159; $x++) {
            $row += ("`e[48;2;0;0;$Color`m{0}" -f (Get-Character -Index $x))
            $Color += 2
        }
        $row += "`e[0m"
        Write-Host $row
    }
}

# Store as a stringbuilder object
# ~240 ms
function main4 {
    # This is the same script as gradient.ps1 but hard coded
    # to 40x160 for nushell comparisions
    $row = [System.Text.StringBuilder]""
    for ($y = 0; $y -le 39; $y++) {
        $Color = 25
        $row.Clear() | out-null
        for ($x = 0; $x -le 159; $x++) {
            $row.Append("`e[48;2;0;0;$Color`m{0}" -f (Get-Character -Index $x)) | out-null
            $Color += 2
        }
        $row.Append("`e[0m") | out-null
        Write-Host $row.ToString()
    }
}

# measure-command -expression { .\gradient_40x160.ps1 }
# main
# main2
# main3
main4
