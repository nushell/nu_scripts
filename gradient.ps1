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

    for ($y = 0; $y -le ($host.ui.RawUI.BufferSize.Height - 1); $y++) {
        $Color = 25
        Set-Cursor -x $PSItem -y $y
        0..($Host.UI.RawUI.BufferSize.Width - 1) | ForEach-Object {
            Write-Host -Object ("`e[48;2;0;0;$Color`m{0}" -f (Get-Character -Index $PSItem)) -NoNewline
            $Color += 2
        }
    }
    Start-Sleep -Seconds 5
}

main
