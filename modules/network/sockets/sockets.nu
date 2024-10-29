export def main [--abbreviate-java-class-paths (-j)] {
  let input = (^lsof +c 0xFFFF -i -n -P)
  let header = ($input | lines
                       | take 1
                       | each { str downcase | str replace ' name$' ' name state' })
  let body = ($input | lines
                     | skip 1
                     | each { str replace '([^)])$' '$1 (NONE)' | str replace ' \((.+)\)$' ' $1' })
  [$header] | append $body
            | to text
            | detect columns
            | upsert 'pid' { |r| $r.pid | into int }
            | rename --column { name: connection }
            | reject 'command'
            | join (ps -l) 'pid' 'pid'
            | if $abbreviate_java_class_paths {
                upsert 'classpath' { |r| $r.command | java-cmd classpath }
                | upsert 'command' { |r| $r.command | java-cmd abbreviate-classpath }
              } else { $in }
}

export def 'java-cmd classpath' [] {
  str replace '.* -classpath +(.+\.jar) +.*' '$1' | split row ':'
}

export def 'java-cmd abbreviate-classpath' [] {
  str replace '[^ ]*\.jar' '*.jar'
}
