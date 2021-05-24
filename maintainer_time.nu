let m_table = (
    [['name', 'tz', 'time']; ['andres' 'US/Eastern' ' '] ['fdncred' 'US/Central' ' '] ['gedge' 'US/Eastern' ' '] ['jturner' 'NZ' ' '] ['wycats' 'US/Pacific' ' ']]
)
let now = (date now)
$m_table | update time {
    each { |name|
        $now | date to-timezone ($name | get tz) | date format '%c'
    }
}