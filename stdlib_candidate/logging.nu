# This is a first attempt and some type of logging
def log [message:any] {
    let now = (date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = (build-string $now '|DBG|' $message (char newline))
    echo $mess | autoview
}