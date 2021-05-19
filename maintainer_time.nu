let m_table = (
    echo [['name', 'tz', 'time']; ['andres' 'US/Eastern' ' '] ['fdncred' 'US/Central' ' '] ['gedge' 'US/Eastern' ' '] ['jturner' 'NZ' ' '] ['wycats' 'US/Pacific' ' ']]
)
let now = (date now)
echo $m_table | update time {
    echo $now | date to-timezone (get tz) | date format '%c'
}