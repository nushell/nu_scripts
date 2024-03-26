export def main [
    --filter: closure
]: any -> list<any> {
    mut todo = [$in]
    mut done = []
    while ($todo | length) > 0 {
        # pop
        let value = $todo | last
        $todo = ($todo | drop)
        # save
        if $filter == null or ($value | do $filter $value) {
            $done ++= [$value]
        }
        # push
        $todo ++= (match ($value | describe --detailed | get type) {
            table => ($value | values | flatten)
            record => ($value | values)
            list => $value
            _ => continue
        } | reverse)
    }
    $done
}
