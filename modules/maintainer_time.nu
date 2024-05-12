let m_table = (
    [
    ['name', 'tz', 'time'];
    ['andres' 'America/Guayaquil' ' ']
    ['fdncred' 'US/Central' ' ']
    ['gedge' 'US/Eastern' ' ']
    ['jt' 'NZ' ' ']
    ['wycats' 'US/Pacific' ' ']
    ['kubouch' 'Europe/Helsinki' ' ']
    ['elferherrera' 'Europe/London' ' ']
    ['storm' 'US/Pacific' ' ']
    ]
)
let now = (date now)
$m_table | update time {|row|
    $now | date to-timezone ($row | get tz) | format date '%c'
}

