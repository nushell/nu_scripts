let m_table = (
    [
    ['name', 'tz', 'time'];
    ['andres' 'US/Eastern' ' ']
    ['fdncred' 'US/Central' ' ']
    ['gedge' 'US/Eastern' ' ']
    ['jt' 'NZ' ' ']
    ['wycats' 'US/Pacific' ' ']
    ['kubouch' 'Europe/Helsinki' ' ']
    ['elferherrera' 'Europe/London' ' ']
    ]
)
let now = (date now)
$m_table | update time {
    each { |name|
        $now | date to-timezone ($name | get tz) | date format '%c'
    }
}
