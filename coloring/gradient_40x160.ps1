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

main
