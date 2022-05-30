# a .fish complete file usually looks like a like
# `complete -c command -n '__fish_seen_subcommand_from arg' -a arg -l long -s short -d 'description'
# attempt to loosely pasrse it and convert to nu completions

# parse every .fish file in the current directory and make a .nu completions file of it
def build-completions-from-pwd [] {
    ls *.fish | par-each { |f|
        print $"generating for ($f.name)"
        build-completion $f.name (build-string $f.name ".nu")
    }
}

# build a completion form a .fish file and generate a .nu file
def build-completion [fish-file: path, nu-file: path] {
    open $fish-file | parse-fish | make-commands-completion | str collect "\n\n" | save $nu-file
}

# parse a .fish file based on autogenerated complete syntax
# returns a table of flags to arguments
# currently only handles complete's args that don't use boolean flags (e.g. -f)
def parse-fish [] {
    let data = (
        $in | tokenize-complete-lines
        | where (($it | length) mod 2) == 1       # currently we only support complete args that all have args (pairs). including 'complete' this means an odd number of tokens
        | each { |tokens| $tokens | pair-args }   # turn the tokens into a list of pairs
        | flatten                                 # merge them all into a top level label
    )
    # default every column in the table to "" to make processing easier
    # some values having $nothing often breaks nu or requires lots of checking
    $data | columns | reduce -f $data { |c, acc|
        $acc | default "" $c
    }
    | default "" a
    | cleanup_subcommands # clean garbage subcommands
}

# tokenize each line of the fish file into a list of tokens
# make use of detect columns -n which with one like properly tokenizers arguments including across quotes
def tokenize-complete-lines [] {
    lines 
    | each { |line| 
        $line
        | where $line starts-with complete  
        | str replace -a "\\\\'" ""             # remove escaped quotes ' which break detect columns
        | str replace -a "-f " ""               # remove -f which is a boolean flag we don't support yet
        | detect columns -n 
        | transpose -i tokens                  # turn columns into items, each is a token
    } 
    | where ($it | length) > 0                 # remove any empty lines
    | get tokens                               # get the list of tokens
}

# turn a list of tokens for a line into a record of {flag: arg}
def pair-args [] {
    where $it != complete                                           # drop complete command as we don't need it
    | window 2 -s 2                                                 # group by ordered pairs, using window 2 -s 2 instead of group 2 to automatically drop any left overs
    | each { |pair| 
        [
            {$"($pair.0 | str trim -c '-')": ($pair.1 | unquote)}   # turn into a [{<flag> :<arg>}] removing quotes
        ] 
    }
    | reduce { |it, acc| $acc | merge { $it }}                      # merge the list of records into one big record
}

def unquote [] {
    str trim -c "\'"  # trim '
}

# remove any entries which contain things in subcommands that may be fish functions or incorrect parses
def cleanup_subcommands [] {
    where (not ($it.a | str contains "$")) && (not ($it.a | str starts-with "-")) && (not ($it.a starts-with "("))
}

# from a parsed fish table, create the completion for it's command and sub commands
def make-commands-completion [] {
    let fishes = $in
    $fishes
    | get c        # c is the command name
    | uniq         # is cloned on every complete line
    | each { |command|
        $fishes | where c == $command | make-subcommands-completion $command
    }
}

let quote = '"' # "

# make the action nu completion string from subcommand and args
# subcommand can be empty which will be the root command
def make-subcommands-completion [parents: list] {
    let fishes = $in
    $fishes
    | group-by a                                                                                        # group by sub command (a flag)
    | transpose name args                                                                               # turn it into a table of name to arguments
    | each {|subcommand|
        build-string (
            if (not ($subcommand.args.d | empty?)) {                                                    # (sub)command description
                build-string "# " ($subcommand.args.d.0) "\n"
            }) "extern " $quote ($parents | str collect " ") (
            if $subcommand.name != "" {
                build-string " " $subcommand.name                                                       # sub command if present
            }) $quote " [\n" (
            $fishes
            | if ('n' in ($in | columns)) && ($subcommand.name != "") {
                where ($it.n | str contains $subcommand.name) | build-flags                             # for subcommand -> any where n matches `__fish_seen_subcommand_from arg` for the subcommand name
            } else { 
                where ($it.n == "__fish_use_subcommand") && ($it.a == "") | build-flags                 # for root command -> any where n ==  __fish_use_subcommand and a is empty. otherwise a means a subcommand
            }
            | str collect "\n"
        ) "\n\t...args\n]"
    }
}

# build the list of flag string in nu syntax
def build-flags [] {
    each { |subargs|  
        if $subargs.l != "" { 
            build-string "\t--" $subargs.l (if $subargs.s != "" { 
                build-string "(-" $subargs.s ")" (if $subargs.d != "" {
                    build-string "\t\t\t# " $subargs.d
                })
            })
        }
    }
}
