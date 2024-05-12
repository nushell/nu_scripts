let ns = (netstat | lines | skip 1)

let first_batch = ($ns | take until {|it| $it =~ Active } | str join (char nl) | from ssv -m 1)
let second_batch = ($ns |
   skip until {|it| $it =~ Active } | 
   skip 1 | 
   str join (char nl) | 
   str replace '\[ \]' "[]" --all | 
   from ssv -m 1 | 
   default I-Node "" | 
   default Path "" 
   | each {|row| if $row.Type == DGRAM {
           $row | update Path { get I-Node } | update I-Node { get State } | update State ""
       } else {
           $row
       }
   }
)

print $first_batch
print $second_batch




