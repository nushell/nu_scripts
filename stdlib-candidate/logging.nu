# This is a first attempt and some type of logging
def log [message:any] {
    let now = (date now | date format '%Y%m%d_%H%M%S.%f')
    let mess = $"($now)|DBG|($message)(char nl)"
    echo $mess | autoview
}