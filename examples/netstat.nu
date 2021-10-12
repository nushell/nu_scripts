let ns = (netstat | lines | skip 1)

let first-batch = ($ns | keep until $it =~ Active | str collect (char nl) | from ssv -m 1)
let second-batch = ($ns |
   skip until $it =~ Active | 
   skip 1 | 
   str collect (char nl) | 
   str find-replace "\[ \]" "[]" --all | 
   from ssv -m 1 | 
   default I-Node "" | 
   default Path "" |
   each {|row| if $row.Type == DGRAM { $row | update Path { get I-Node } | update I-Node { get State } | update State "" } { $row } }
) 

$first-batch

$second-batch
