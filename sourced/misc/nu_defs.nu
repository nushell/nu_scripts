#copy current dir
def cpwd [] {pwd | tr "\n" " " | sed "s/ //g" | xclip -sel clip}

#update-upgrade system (ubuntu)
def supgrade [] {
  echo "updating..."
  sudo aptitude update -y
  echo "upgrading..."
  sudo aptitude safe-upgrade -y
  echo "autoremoving..."
  sudo apt autoremove -y
}

#open mcomix
def mcx [file] {
  bash -c $'mcomix "($file)" 2>/dev/null &'
}

#open file
def openf [file?] {
  let file = if ($file | is-empty) {$in} else {$file}

  bash -c $'xdg-open "($file)" 2>/dev/null &'
}

#search for specific process
def psn [name: string] {
  ps | find $name
}

#kill specified process in name
def killn [name: string] {
  ps | find $name | each {|| kill -f $in.pid}
}

#jdownloader downloads info (requires a jdown python script)
def nujd [] {
  jdown | lines | each { |line| $line | from nuon } | flatten | flatten
}

# Switch-case like instruction
def switch [
  var           #input var to test
  cases: record #record with all cases
  #
  # Example:
  # let x = 3
  # switch $x {
  #   1: { echo "you chose one" },
  #   2: { echo "you chose two" },
  #   3: { echo "you chose three" }
  # }
  ] {
    echo $cases | get $var | do $in
}

#post to discord
def post_to_discord [message] {
  let content = $"{\"content\": \"($message)\"}"

  let weburl = "webhook_url"

  post $weburl $content --content-type "application/json"
}

#select column of a table (to table)
def column [n] {
  transpose | select $n | transpose | select column1 | headers
}

#get column of a table (to list)
def column2 [n] {
  transpose | get $n | transpose | get column1 | skip 1
}

#short pwd
def pwd-short [] {
  $env.PWD | str replace $nu.home-path '~'
}

#string repeat
def "str repeat" [count: int] {
  each {|it| let str = $it; echo 1..$count | each {|| echo $str } }
}

#join 2 lists
def union [a: list, b: list] {
    $a | append $b | uniq
}

#nushell source files info
def 'nu-sloc' [] {
  let stats = (
    ls **/*.nu
      | select name
      | insert lines { |it| open $it.name | str stats | get lines }
      | insert blank {|s| $s.lines - (open $s.name | lines | find --regex '\S' | length) }
      | insert comments {|s| open $s.name | lines | find --regex '^\s*#' | length }
      | sort-by lines -r
  )

  let lines = ($stats | reduce -f 0 {|it, acc| $it.lines + $acc })
  let blank = ($stats | reduce -f 0 {|it, acc| $it.blank + $acc })
  let comments = ($stats | reduce -f 0 {|it, acc| $it.comments + $acc })
  let total = ($stats | length)
  let avg = ($lines / $total | math round)

  $'(char nl)(ansi pr) SLOC Summary for Nushell (ansi reset)(char nl)'
  print { 'Total Lines': $lines, 'Blank Lines': $blank, Comments: $comments, 'Total Nu Scripts': $total, 'Avg Lines/Script': $avg }
  $'(char nl)Source file stat detail:'
  print $stats
}

#go to dir (via pipe)
def --env goto [] {
    let input = $in
    cd (
        if ($input | path type) == file {
            ($input | path dirname)
        } else {
            $input
        }
    )
}

#go to custom bash bin path, must be added last in config.nu
def --env goto-bash [] {
    cd ($env.PATH | last)
}

#cd to the folder where a binary is located
def --env which-cd [program] {
  let dir = (which $program | get path | path dirname | str trim)
  cd $dir.0
}

#push to git
def git-push [m: string] {
  git add -A
  git status
  git commit -a -m $"($m)"
  git push origin main
}

#get help for custom commands
def "help my-commands" [] {
  help commands | where is_custom == true
}

#web search in terminal (requires ddgr)
def gg [...search: string] {
  ddgr -n 5 ($search | str join ' ')
}

#habitipy dailies done all (requires habitipy)
def hab-dailies-done [] {
  let to_do = (habitipy dailies | grep ✖ | awk {print $1} | tr '.\n' ' ' | split row ' ' | into int)
  habitipy dailies done $to_do
}

#update aliases backup file from config.nu
def update-aliases [] {
  let nlines = (open $nu.config-path | lines | length)

  let from = ((grep "## aliases" $nu.config-path -n | split row ':').0 | into int)

  open $nu.config-path | lines | last ($nlines - $from + 1) | save /path/to/backup/file.nu
}

#update config.nu from aliases backup
def update-config [] {
  let from = ((grep "## aliases" $nu.config-path -n | split row ':').0 | into int)
  let aliases = "/path/to/backup/file.nu"

  open $nu.config-path | lines | first ($from - 1) | append (open $aliases | lines) | save temp.nu
  mv temp.nu $nu.config-path
}

#countdown alarm (requires termdown y mpv)
def countdown [
  n: int # time in seconds
  ] {
    let BEEP = "/path/to/sound/file"
    let muted = (pacmd list-sinks | awk '/muted/ { print $2 }' | tr '\n' ' ' | split row ' ' | last)

    if $muted == 'no' {
      termdown $n;mpv --no-terminal $BEEP
    } else {
      termdown $n
      unmute
      mpv --no-terminal $BEEP
      mute
    }
}

#get aliases
def get-aliases [] {
  open $nu.config-path | lines | find alias | find -v aliases | split column '=' | select column1 column2 | rename Alias Command | update Alias {|f| $f.Alias | split row ' ' | last} | sort-by Alias
}

#compress every subfolder into separate files and delete them
def `7zfolders` [] {
  ^find . -maxdepth 1 -mindepth 1 -type d -print0 | parallel -0 --eta 7z a -t7z -sdel -bso0 -bsp0 -m0=lzma2 -mx=9 -ms=on -mmt=on {}.7z {}
}

#compress to 7z using max compression
def `7zmax` [
  filename: string  #filename without extension
  ...rest:  string  #files to compress and extra flags for 7z (add flags between quotes)
  #
  # Example:
  # compress all files in current directory and delete them
  # 7zmax * "-sdel"
] {

  if ($rest | is-empty) {
    echo "no files to compress specified"
  } else {
     7z a -t7z -m0=lzma2 -mx=9 -ms=on -mmt=on $"($filename).7z" $rest
  }
}

#add event to google calendar, also usable without arguments (requires gcalcli)
def addtogcal [
  calendar?   #to which calendar add event
  title?      #event title
  when?       #date: yyyy.MM.dd hh:mm
  where?      #location
  duration?   #duration in minutes
] {

  let calendar = if $calendar == null {echo $"calendar: ";input } else {$calendar}
  let title = if $title == null {echo $"\ntitle: ";input } else {$title}
  let when = if $when == null {echo $"\nwhen: ";input } else {$when}
  let where = if $where == null {echo $"\nwhere: ";input } else {$where}
  let duration = if $duration == null {echo $"\nduration: ";input } else {$duration}

  gcalcli --calendar $"($calendar)" add --title $"($title)" --when $"($when)" --where $"($where)" --duration $"($duration)" --default-reminders
}

#show gcal agenda in selected calendars
def agenda [
  --full: int  #show all calendars (default: 0)
  ...rest      #extra flags for gcalcli between quotes (specified full needed)
  #
  # Examples
  # agenda
  # agenda --full true
  # agenda "--details=all"
  # agenda --full true "--details=all"
] {
  let calendars = "your_selected_calendars"
  let calendars_full = "most_calendars"

  if ($full | is-empty) or ($full == 0) {
    gcalcli --calendar $"($calendars)" agenda --military $rest
  } else {
    gcalcli --calendar $"($calendars_full)" agenda --military $rest
  }
}

#show gcal week in selected calendards
def semana [
  --full: int  #show all calendars (default: 0)
  ...rest      #extra flags for gcalcli between quotes (specified full needed)
  #
  # Examples
  # semana
  # semana --full true
  # semana "--details=all"
  # semana --full true "--details=all"
] {
  let calendars = "your_selected_calendars"
  let calendars_full = "most_calendars"

  if ($full | is-empty) or ($full == 0) {
    gcalcli --calendar $"($calendars)" calw $rest --military --monday
  } else {
    gcalcli --calendar $"($calendars_full)" calw $rest --military --monday
  }
}

#show gcal month in selected calendards
def mes [
  --full: int  #show all calendars (default: 0)
  ...rest      #extra flags for gcalcli between quotes (specified full needed)
  #
  # Examples
  # mes
  # mes --full true
  # mes "--details=all"
  # mes --full true "--details=all"
] {
  let calendars = "your_selected_calendars"
  let calendars_full = "most_calendars"

  if ($full | is-empty) or ($full == 0) {
    gcalcli --calendar $"($calendars)" calm $rest --military --monday
  } else {
    gcalcli --calendar $"($calendars_full)" calm $rest --military --monday
  }
}

#get bitly short link (requires xclip)
def mbitly [longurl] {
  if ($longurl | is-empty) {
    echo "no url provided"
  } else {
    let Accesstoken = "Token"
    let username = "user"
    let url = $"https://api-ssl.bitly.com/v3/shorten?access_token=($Accesstoken)&login=($username)&longUrl=($longurl)"

    let shorturl = (http get $url | get data | get url)

    $shorturl
    $shorturl | xclip -sel clip
  }
}

#translate text using mymemmory api
def trans [
  ...search:string  #search query]
  --from:string     #from which language you are translating (default english)
  --to:string       #to which language you are translating (default spanish)
  #
  #Use ISO standard names for the languages, for example:
  #english: en-US
  #spanish: es-ES
  #italian: it-IT
  #swedish: sv-SV
  #
  #More in: https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
] {

  if ($search | is-empty) {
    echo "no search query provided"
  } else {
    let key = "api_kei"
    let user = "user_email"

    let from = if ($from | is-empty) {"en-US"} else {$from}
    let to = if ($to | is-empty) {"es-ES"} else {$to}

    let to_translate = ($search | str join "%20")

    let url = $"https://api.mymemory.translated.net/get?q=($to_translate)&langpair=($from)%7C($to)&of=json&key=($key)&de=($user)"

    http get $url | get responseData | get translatedText
  }
}

#check if drive is mounted
def is-mounted [drive:string] {
  let count = (ls "~/media" | find $"($drive)" | length)

  if $count == 0 {
    false
  } else {
    true
  }
}

#get phone number from google contacts (requires goobook)
def get-phone-number [search:string] {
  goobook dquery $search | from ssv | rename results | where results =~ '(?P<plus>\+)(?P<nums>\d+)'
}

#ping with plot (requires ttyplot)
def nu-png-plot [] {
  bash -c "ping 1.1.1.1 | sed -u 's/^.*time=//g; s/ ms//g' | ttyplot -t \'ping to 1.1.1.1\' -u ms"
}

#plot download-upload speed (requires ttyplot and fast-cli)
def nu-downup-plot [] {
  bash -c "fast --single-line --upload |  stdbuf -o0 awk '{print $2 \" \" $6}' | ttyplot -2 -t 'Download/Upload speed' -u Mbps"
}

#plot data table using gnuplot
def gnu-plot [
  data?           #1 or 2 column table
  --title:string  #title
  #
  #Example: If $x is a table with 2 columns
  #$x | gnu-plot
  #($x | column 0) | gnu-plot
  #($x | column 1) | gnu-plot
  #($x | column 0) | gnu-plot --title "My Title"
  #gnu-plot $x --title "My Title"
] {
  let x = if ($data | is-empty) {$in} else {$data}
  let n_cols = ($x | transpose | length)
  let name_cols = ($x | transpose | column2 0)

  let ylabel = if $n_cols == 1 {$name_cols | get 0} else {$name_cols | get 1}
  let xlabel = if $n_cols == 1 {""} else {$name_cols | get 0}

  let title = if ($title | is-empty) {if $n_cols == 1 {$ylabel | str upcase} else {$"($ylabel) vs ($xlabel)"}} else {$title}

  $x | to tsv | save data0.txt
  sed 1d data0.txt | save data.txt

  gnuplot -e $"set terminal dumb; unset key;set title '($title)';plot 'data.txt' w l lt 0;"

  rm data*.txt | ignore
}

# date string YYYY-MM-DD
def ymd [] {
  (date now | format date %Y-%m-%d)
}

# date string DD-MM-YYYY
def dmy [] {
  (date now | format date %d-%m-%Y)
}

# create directory and cd into it.
def --env md [dir] {
  mkdir $dir
  cd $dir
}

# Fuzzy finds a value in a newline-separated-string or a list, using an
# optional preview. If the string or the list contains only one item,
# it is returned immediately.
# Requires the external binary 'skim'.
#
# Examples:
# > "a\nb\n" | skim
# > ls | get name | skim --preview 'ls --color {}'
def skim [
  --preview (-p) = '' # command to use for the sk preview
] {
  let lst = $in
  let type = ($lst | describe)
  let s = (if ($type | str starts-with 'list<') {
             $lst | str join (char nl)
           } else if ($type == 'string') {
             $lst
           })
  if ($s | is-empty) {
    null
  } else {
    if ($preview | is-empty ) {
      ($s
      | sk
        --layout reverse
        --preview-window down:65%
        --select-1
      | str trim)
      } else {
        ($s
        | sk
          --layout reverse
          --preview-window down:65%
          --select-1
          --preview $preview
        | str trim)
      }
  }
}

# Group list values that match the next-group regex.
# This function is a useful helper to quick and dirty parse data
# that contains line-wise a 'header', followed by a variable number
# of data entries. The return value is a table of header-keys with
# a list of values in the second column. Values before a header-key
# and header-keys without values are ignored.
#
# Example:
#   [id_a 1 2 id_b 3] | group-list '^id_'
def group-list [
  regex # on match, a new group is created
] {
  let lst = $in
  def make-group [v, buf, ret, key] {
    let new_group = ($'($v)' =~ $regex)
    if $new_group {
      let is_key = (not ($key | is-empty))
      let is_buf = (not ($buf | is-empty))
      if ($is_buf and $is_key) {
        let ret = ($ret | append {key: $key, values: $buf})
        {buf: [], ret: $ret, key: $v}
      } else {
        {buf: [], ret: $ret, key: $v}
      }
    } else {
      let buf = ($buf | append $v)
      {buf: $buf, ret: $ret, key: $key}
    }
  }
  def loop [lst, buf=[], ret=[], key=''] {
    if ($lst | is-empty) {
      {ret: $ret, buf: $buf, key: $key}
    } else {
      let v = ($lst | first)
      let obj = (make-group $v $buf $ret $key)
      let rest = ($lst | skip)
      loop $rest $obj.buf $obj.ret $obj.key
    }
  }
  let obj = (loop $lst)
  let ret = $obj.ret
  let buf = $obj.buf
  let key = $obj.key
  let is_key = (not ($key | is-empty))
  let is_buf = (not ($buf | is-empty))
  if ($is_buf and $is_key) {
    $ret | append {key: $key, values: $buf}
  } else {
    $ret
  }
}
