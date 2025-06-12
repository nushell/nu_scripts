# This module yadm is for.
# Executing yadm scripts in a refined way.


def generate_viable_bash_string_flags [
flag_record:record # A object filled all known flags and their values.
]: nothing -> list<string> {



  const acceptable_bash_types = [string int float duration filesize binary bool]

  let not_all_flag_record_values_are_acceptable_bash_types = $flag_record
  | values
  | all { |value| ($value | describe) not-in $acceptable_bash_types }


# Since bash can only accept strings and string-like values the user must type them.
  if $not_all_flag_record_values_are_acceptable_bash_types {

    let joined_acceptable_bash_types = $acceptable_bash_types | str join " , "

    error make {
      msg: "Wrong values",
      label: {
        text: $"The values for these flags aren't good please use.
                These ($joined_acceptable_bash_types) types.
                Bash can't use any of these types at all.
              "
      span: (metadata $flag_record).span
      }

      help: $"Please use one of these ($joined_acceptable_bash_types) for each flag"
      }

  }



  $flag_record
  | items {  |key value|

  let value_type = ( $value | describe )

  let viable_types = [string int float duration filesize binary]

    # If flag value is a non-bool primitive create --key=value flag.
        if $value_type in $viable_types {

          return $"--($key)=($value)"
        }

    # If flag value is a nothing return null

      if $value_type == nothing or $value == false { return null }

    # If flag value is a bool primitive create --key flag.

        $"--($key)"


    }
  | where { |value| ( $value | describe ) != nothing }


}

alias bash_yadm = bash yadm

export def init [
  --initial-branch(-b)
  --f
  --w
  ] {

  bash_yadm init ...(
    generate_viable_bash_string_flags {
      initial-branch:$initial_branch
      f:$f
      w:$w
    }
  )

 }


export def main [
    --yadm-dir(-Y)

   --yadm-data

   --yadm-repo

   --yadm-config

   --yadm-encrypt

   --yadm-archive

   --yadm-bootstrap
] {

   bash_yadm ...(
     generate_viable_bash_string_flags {
      yadm-dir:$yadm_dir,
      yadm-data:$yadm_data,
      yadm-repo:$yadm_repo,
      yadm-config:$yadm_config,
      yadm-encrypt:$yadm_encrypt,
      yadm-archive:$yadm_archive,
      yadm-bootstrap:$yadm_bootstrap,
     }
   )

}


def generate_type_flag_completions [] {
       [
        'bool'
        'int'
        'bool-or-int'
        'bool-or-str'
        'path'
        'expiry-date'
       ]
    }



  export def clone [
     url:string
    -f
    --no-bootstrap
    --bootstrap
    -w:string
    --branch(-b):string
    ] {


          bash_yadm clone $url ...(
            generate_viable_bash_string_flags {
              f:$f
              bootstrap:$bootstrap
              no-bootstrap:$no_bootstrap
              w:$w
              branch:$branch
            }
          )


  }

export module config {

    const yadm_config_characteristics = {
        yadm:{
          alt-copy: {
            type: bool
            description: "Make alternate files copies instead of symbolic links"
            }
          auto-alt: {
            type: bool
            description: "Disable the automatic linking"
            }
          auto-exclude: {
            type: bool
            description: "Disable the automatic exclusion of patterns defined in the encryption file"
            }
          auto-perms: {
            type: bool
            description: "Disable the automatic permission changes"
            }
          auto-private-dirs: {
            type: bool
            description: "Disable the automatic creating of private directories"
            }
          cipher: {
            type: ['gpg', 'openssl']
            description: "Configure which encryption system is used by the encrypt/decrypt command"
          }
          git-program: {
            type:string
            description: "Specify an alternate program to use instead of git"
          }
          gpg-perms: {
            type: bool
            description: "Disable the permission changes to the gnupg folder"
            }
          gpg-program: {
            type: string
            description: "Specify an alternate program to use instead of gpg"
            }
          gpg-recipient: {
            type:string
            description:"Specify which cipher should be used by openssl"
            }
          openssl-ciphername: {
            type:string
            description:"Provide  a 'key ID' to specify which public key to encrypt with"
            }
          openssl-old: {
            type: bool
            description: "Use older versions of openssl"
            }
          openssl-program: {
            type:string
            description:"Specify an alternate program to use instead  of  'openssl'"
            }
          ssh-perms: {
            type: bool
            description: "Disable the permission changes to the ssh folder"
            }

        }
        local:{
          class: {
            type: string
            description: 'Specify a class for the purpose of symlinking alternate files'
          }
          arch:{
            type: string
            description: 'Override  the  architecture for the purpose of symlinking alternate files'
          }
          hostname:{
              type:string
              description: 'Override the hostname for the purpose of symlinking alternate files'
          }
          os:{
              type:string
              description: 'Override the OS for the purpose of symlinking alternate files'
          }
          user:{
              type:string
              description: 'Override the user for the purpose of symlinking alternate files'
          }
        }
      }

    def generate_dot_value_and_descriptions [] {


      $yadm_config_characteristics
      | items { |outer_key outer_value|

        $outer_value
        | items { |inner_key inner_value|

          {
            value: $"($outer_key).($inner_key)"
            description: $inner_value.description
          }

        }

      } | flatten


    }


    def get_auto_complete_value_based_on_what_context_gets_from_yadm_config_characteristics_type [context: string, ] {

    let cell_path_to_yadm_config_characteristic_key_type = $context
      | split row "."
      | append 'type'
      | into cell-path

    let yadm_config_characteristic_key_type = $yadm_config_characteristics
        | get ($cell_path_to_yadm_config_characteristic_key_type)


    match $yadm_config_characteristic_key_type {

        string => null

        bool => [true false]

        $it if ($it | describe | str starts-with list) => {

        if ($it | any { |value| $value in [true false] }) {

            error make {
                msg: "Invalid Configuration Value",
                help: "Please don't use place bool values in an array use the bool word instead"
            }

        }

        $it

        }
        _ => {

            error make {
                msg:"Invalid Configuration Value"
                help:"When it comes to cofiguaration a value must be a string boolean number or a list of strings or numbers"
            }

        }

    }



    }

export def main  [
      key:string@generate_dot_value_and_descriptions
      value?:any@get_auto_complete_value_based_on_what_context_gets_from_yadm_config_characteristics_type
      --global
      --local
      --system
      --worktree
      --list
      --edit
      --type:string@generate_type_flag_completions
      --bool
      --int
      --bool-or-int
      --bool-or-str
      --path
      --expiry-date
      --fixed-value
      --null(-z)
      --name-only
      --includes
      --show-origin
      --show-scope
      --file:string
      --blob:string
      --get:string
      --default:string
      --get-all:string
      --get-regexp:string
      --get-urlmatch:string
      --replace-all: string
      --get-color:string
      --get-colorbool:string
      --add:string
      --unset:string
      --unset-all:string
      --remove-section:string
      --rename-section:string
      --comment:string
      ] {

        if string !~ '(?<outer_key>\w+)(?<dot>\.)(?<inner_key>\w+)' {

          error make {
            msg: 'Invalid Argument',
            label:{
              text: $"This key ($key) is invalid"
              span: (metadata $key).span
            }
          }

        }



        bash_yadm config ...(
          generate_viable_bash_string_flags {
              global:$global
              local:$local
              system:$system
              worktree:$worktree
              list:$list
              edit:$edit
              bool:$bool
              int:$int
              bool-or-int:$bool_or_int
              bool-or-str:$bool_or_str
              path:$path
              expiry-date:$expiry_date
              fixed-value:$fixed_value
              'null':$null
              name-only:$name_only
              includes:$includes
              show-origin:$show_origin
              show-scope:$show_scope
              file:$file
              blob:$blob
              get:$get
              default:$default
              get-all:$get_all
              get-regexp:$get_regexp
              get-urlmatch:$get_urlmatch
              get-color:$get_color
              get-colorbool:$get_colorbool
              replace-all:$replace_all
              add:$add
              unset:$unset
              unset-all:$unset_all
              remove-section:$remove_section
              rename-section:$rename_section
              comment:$comment
            }
        )


    }


  }

export def gitconfig [
  key:string
    value?:any
    --global
    --local
    --system
    --worktree
    --list
    --edit
    --type:string@generate_type_flag_completions
    --bool
    --int
    --bool-or-int
    --bool-or-str
    --path
    --expiry-date
    --fixed-value
    --null(-z)
    --name-only
    --includes
    --show-origin
    --show-scope
    --file:string
    --blob:string
    --get:string
    --default:string
    --get-all:string
    --get-regexp:string
    --get-urlmatch:string
    --replace-all: string
    --get-color:string
    --get-colorbool:string
    --add:string
    --unset:string
    --unset-all:string
    --remove-section:string
    --rename-section:string
    --comment:string
    ] {

      bash_yadm gitconfig ...(
        generate_viable_bash_string_flags {
            global:$global
            local:$local
            system:$system
            worktree:$worktree
            list:$list
            edit:$edit
            bool:$bool
            int:$int
            bool-or-int:$bool_or_int
            bool-or-str:$bool_or_str
            path:$path
            expiry-date:$expiry_date
            fixed-value:$fixed_value
            'null':$null
            name-only:$name_only
            includes:$includes
            show-origin:$show_origin
            show-scope:$show_scope
            file:$file
            blob:$blob
            get:$get
            default:$default
            get-all:$get_all
            get-regexp:$get_regexp
            get-urlmatch:$get_urlmatch
            get-color:$get_color
            get-colorbool:$get_colorbool
            replace-all:$replace_all
            add:$add
            unset:$unset
            unset-all:$unset_all
            remove-section:$remove_section
            rename-section:$rename_section
            comment:$comment
          }
      )

  }


export module git-crypt  {


    # Share the repository using GPG
    export def add-gpg-user [user_id:string] {

      bash_yadm git-crypt add-gpg-user $user_id

    }

    # Configure a repository to use git-crypt
    export def init [] {

      bash_yadm git-crypt init

    }

    # Unlock encrypted files
    export def unlock [] {

      bash_yadm git-crypt unlock

    }

    # Export a symmetric secret key
    export def export-key [key_file_path:string] {

      bash_yadm git-crypt export-key $key_file_path

    }

  }

export def transcrypt [
    --cipher(-c):string
    --password(-p):string
    --set-openssl-path:string
    --yes(-y)
    --display(-d)
    --rekey(-r)
    --flush-credentials(-f)
    --force(-F)
    --uninstall(-u)
    --upgrade
    --list(-l)
    --show-raw(-s):string
    --export-gpg(-e):string
    --import-gpg(-i)
    --context(-C)
    --list-contexts
    --version(-v)
    --help(-h)
  ] {

  bash_yadm transcrypt (
      generate_viable_bash_string_flags {
        cipher:$cipher
        password:$password
        set-openssl-path:$set_openssl_path
        yes:$yes
        display:$display
        rekey:$rekey
        flush-credentials:$flush_credentials
        force:$force
        uninstall:$uninstall
        upgrade:$upgrade
        show-raw:$show_raw
        export-gpg:$export_gpg
        import-gpg:$import_gpg
        context:$context
        list-contexts:$list_contexts
        version:$version
        help:$help
      }
    )

  }

  export def alt [file_path:string] { bash_yadm alt $file_path }

  export def encrypt [] { bash_yadm encrypt }

  export def decrypt [] { bash_yadm decrypt }

  export def perms [file_path:string] { bash_yadm perms $file_path }

  export def bootstrap [] { bash_yadm bootstrap }

  export def enter [] { bash_yadm enter }

  export module introspect {

    const possible_subjects = [
      'commands'
      'repos'
      'switches'
      'configs'
    ]

    def get_completions_for_subject [] {
        $possible_subjects
    }

    export def main [subject:string@get_completions_for_subject ] {

      if $subject not-in $possible_subjects {

        let joined_possible_subjects = $possible_subjects
        | str join ","

        error make {
          msg: "Invalid Argument",
          label: {
            text:"This value is incorrect!"
            span:(metadata $subject).span
          }
          help: $"This value ($subject) isn't correct the ones are ($joined_possible_subjects)"
        }
      }

      bash_yadm introspect $subject

    }

  }

module git {

  export module stash {

    export def push [
      --patch(-p)
      --staged(-S)
      --keep-index(-k)
      --includes(-u)
      --all
      --quiet(-q)
      --message(-m)
      --pathspec-from-file:path
      --pathspec-file-nul
      ...pathspecs:string
    ] {

      bash_yadm stash push ...$pathspecs ...(
        generate_viable_bash_string_flags {
          patch:$patch
          staged:$staged
          keep-index:$keep_index
          includes:$includes
          all:$all
          quiet:$quiet
          message:$message
          pathspec-from-file:$pathspec_from_file
          pathspec-file-nul:$pathspec_file_nul
        }
      )

    }

    export def save [
      --patch(-p)
      --staged(-S)
      --keep-index(-k)
      --no-keep-index
      --include-untracked(-u)
      --all(-a)
      --quiet(-q)
       message?:string
     ] {

     let viable_bash_string_flags = generate_viable_bash_string_flags {
                patch:$patch
                staged: $staged
                keep-index:$keep_index
                no-keep-index:$no_keep_index
                include-untracked:$include_untracked
                all:$all
                quiet:$quiet
                }

      if ($message | describe) != nothing {

        bash_yadm stash save $message ...$viable_bash_string_flags
      }

      bash_yadm stash save ...$viable_bash_string_flags

    }


    export def list [log_options?:string ] {

      if ($log_options | describe) == string  {

        bash_yadm stash list $log_options

      }

      bash_yadm stash list

    }


export module show {


    def get-diff-algorithm-completions [] {
        ['patience' 'minimal' 'histogram' 'myers']
    }

    def get-submodule-completions [] {
        ['short' 'log' 'diff']
    }

    def get-color-completions [] {
        ['never' 'always' 'auto']
    }

    def get-color-moved-completions [] {
        ['no' 'default' 'plain' 'blocks' 'zebra' 'dimmed-zebra']
    }

    def get-color-moved-ws-completions [] {
        [
        'no'
        'ignore-space-at-eol'
        'ignore-space-change'
        'ignore-all-space'
        'allow-indentation-change'
        ]
    }

    def get-word-diff-completions [] {
        ['color' 'plain' 'porcelain' 'none']
    }

    export def main [
        --no-index
        --cached
        --merge-base
        --patch(-p)
        --no-patch(-s)
        --unified(-U)
        --output
        --output-indicator-new
        --output-indicator-context
        --raw
        --patch-with-raw
        --indent-heuristic
        --no-indent-heuristic
        --minimal
        --patience
        --histogram
        --anchored
        --diff-algorithm:string@get-diff-algorithm-completions
        --stat:string
        --stat-width:int
        --stat-count:int
        --stat-name-width:string
        --compact-summary
        --numstat
        --shortstat
        --dirstat(-X):string
        --cumulative
        --dirstat-by-file
        --summary
        --patch-with-stat
        --z
        --name-only
        --name-status
        --submodule:string@get-submodule-completions
        --output
        --color:string@get-color-completions
        --no-color
        --color-moved:string@get-color-moved-completions
        --no-color-moved
        --color-moved-ws:string@get-color-moved-ws-completions
        --no-color-moved-ws
        --word-diff:string@get-word-diff-completions
        --word-diff-regex:string
        --color-words:string
        --no-renames
        --no-rename-empty
        --check
        --ws-error-highlight:string
        --full-index
        --binary
        --abbrev:string
        --break-rewrites(-B):string
        --find-renames(-M):string
        --find-copies(-C):string
        --find-copies-harder
        --irreversible-delete(-D)
        --l:int
        --diff-filter:string
        --S:string
        --G:string
        --find-object:string
        --pickaxe-all
        --pickaxe-regex
        --O:string
        --skip-to:path
        --rotate-to:path
        --R
        --relative:path
        --no-relative
        --text(-a)
        --ignore-cr-at-eol
        --ignore-space-at-eol
        --ignore-space-change(-b)
        --ignore-all-space(-w)
        --ignore-blank-lines
        --ignore-matching-lines(-I)
        --inter-hunk-context:string
        --function-context(-W)
        --exit-code
        --quiet
        --ext-diff
        --no-ext-diff
        --textconv
        --no-textconv
        --ignore-submodules:string
        --src-prefix:string
        --dst-prefix:string
        --no-prefix
        --default-prefix
        --line-prefix
        --ita-invisible-in-index
        --base(-1)
        --ours(-2)
        --theirs(-3)
        --0
        --include-untracked(-u)
        --only-untracked
        stash?:string
        ] {

       let viable_bash_string_flags = generate_viable_bash_string_flags {
                    no-index:$no_index
                    cached:$cached
                    merge-base:$merge_base
                    patch:$patch
                    no-patch:$no_patch
                    unified:$unified
                    output:$output
                    output-indicator-new:$output_indicator_new
                    output-indicator-context:$output_indicator_context
                    raw:$raw
                    patch-with-raw:$patch_with_raw
                    indent-heuristic:$indent_heuristic
                    no-indent-heuristic:$no_indent_heuristic
                    minimal:$minimal
                    patience:$patience
                    histogram:$histogram
                    anchored:$anchored
                    diff-algorithm:$diff_algorithm
                    stat:$stat
                    stat-width:$stat_width
                    stat-count:$stat_count
                    stat-name-width:$stat_name_width
                    compact-summary:$compact_summary
                    numstat:$numstat
                    shortstat:$shortstat
                    dirstat:$dirstat
                    cumulative:$cumulative
                    dirstat-by-file:$dirstat_by_file
                    summary:$summary
                    patch-with-stat:$patch_with_stat
                    z:$z
                    name-only:$name_only
                    name-status:$name_status
                    submodule:$submodule
                    output:$output
                    color:$color
                    no-color:$no_color
                    color-moved:$color_moved
                    no-color-moved:$no_color_moved
                    color-moved-ws:$color_moved_ws
                    no-color-moved-ws:$no_color_moved_ws
                    word-diff:$word_diff
                    word-diff-regex:$word_diff_regex
                    color-words:$color_words
                    no-renames:$no_renames
                    no-rename-empty:$no_rename_empty
                    check:$check
                    ws-error-highlight:$ws_error_highlight
                    full-index:$full_index
                    binary:$binary
                    abbrev:$abbrev
                    break-rewrites:$break_rewrites
                    find-renames:$find_renames
                    find-copies:$find_copies
                    find-copies-harder:$find_copies_harder
                    irreversible-delete:$irreversible_delete
                    l:$l
                    diff-filter:$diff_filter
                    S:$S
                    G:$G
                    find-object:$find_object
                    pickaxe-all:$pickaxe_all
                    pickaxe-regex:$pickaxe_regex
                    O:$O
                    skip-to:$skip_to
                    rotate-to:$rotate_to
                    R:$R
                    relative:$relative
                    no-relative:$no_relative
                    text:$text
                    ignore-cr-at-eol:$ignore_cr_at_eol
                    ignore-space-at-eol:$ignore_space_at_eol
                    ignore-space-change:$ignore_space_change
                    ignore-all-space:$ignore_all_space
                    ignore-blank-lines:$ignore_blank_lines
                    ignore-matching-lines:$ignore_matching_lines
                    inter-hunk-context:$inter_hunk_context
                    function-context:$function_context
                    exit-code:$exit_code
                    quiet:$quiet
                    ext-diff:$ext_diff
                    no-ext-diff:$no_ext_diff
                    textconv:$textconv
                    no-textconv:$no_textconv
                    ignore-submodules:$ignore_submodules
                    src-prefix:$src_prefix
                    dst-prefix:$dst_prefix
                    no-prefix:$no_prefix
                    default-prefix:$default_prefix
                    line-prefix:$line_prefix
                    ita-invisible-in-index:$ita_invisible_in_index
                    base:$base
                    ours:$ours
                    theirs:$theirs
                    0:$0
                    include-untracked:$include_untracked
                    only-untracked:$only_untracked
                  }

       if ($stash | describe) != nothing {

         return (bash_yadm stash show $stash ...$viable_bash_string_flags)

       }

      bash_yadm stash show ...$viable_bash_string_flags

      }

     }

    export def pop [
      --index
      --quiet(-q)
      stash:string
    ] {

      bash_yadm stash pop $stash  ...(
            generate_viable_bash_string_flags {
                index:$index
                quiet:$quiet
             }
          )

    }

    export def apply [
      --index
      --quiet(-q)
      stash:string
    ] {

      bash_yadm stash apply $stash ...(
            generate_viable_bash_string_flags {
                index:$index
                quiet:$quiet
              }
          )

    }

    export def branch [branchname:string stash?:string ] {


      if ($stash | describe) != nothing {

        return (bash_yadm stash branch $branchname $stash)

      }

      bash_yadm stash branch $branchname


    }

    export def clear [param: string, ] {

      bash_yadm stash clear

    }

    export def drop [--quiet(-q) stash:string ] {

      bash_yadm stash drop $stash ...(generate_viable_bash_string_flags { quiet:$quiet })

    }

    export def create [] {

      bash_yadm stash create

    }

    export def store [] {

      bash_yadm stash store

    }

  }


  export module remote {

     export def main [--verbose(-v)] {

        bash_yadm remote ...(
          generate_viable_bash_string_flags {
            verbose:$verbose
          }
        )

      }


     export module add {

        def get-mirror-completions [] {
          ['fetch' 'push']
        }

        export def main [
          --t:string
          --m:string
          --f
          --no-tags
          --tags
          --mirror:string@get-mirror-completions
          name:string
          url:string
        ] {

            bash_yadm remote add $name $url ...(
              generate_viable_bash_string_flags {
                t:$t
                m:$m
                f:$f
                no-tags:$no_tags
                tags:$tags
                mirror:$mirror
              }
            )

        }

       }


      export def rename [
        --progress
        --no-progress
        old:string
        new:string
        ] {

            bash_yadm remote rename $old $new (
              generate_viable_bash_string_flags {
                progress:$progress
                no-progress:$no_progress


              }
            )

      }

      export def remove [name: string, ] {

          bash_yadm remote remove $name

      }

      export def set-head [
        --auto(-a):string
        --delete(-d):string
        name:string
      ] {

          bash_yadm remote set-head $name ...(
            generate_viable_bash_string_flags {
              auto:$auto
              delete:$delete
            }
          )

      }

      export def set-branches [--add name:string ...branches:string ] {

          bash_yadm remote set-branches $name ...$branches ...(
            generate_viable_bash_string_flags {
              add:$add
            }
          )

      }

      export def get-url [--all --push,name:string] {

        bash_yadm remote get-url $name ...(
          generate_viable_bash_string_flags {
            push:$push
            all:$all
          }
        )

      }


      export def set-url [
      --add
      --delete
      --push
      name:string
      new_url:string
      old_url:string
      ] {

            bash_yadm remote set-url $name $new_url $old_url ...(
              generate_viable_bash_string_flags {
                add:$add
                delete:$delete
                push:$push
              }
            )

      }

      export def show [--verbose(-v), --n name:string] {

        bash_yadm remote prune $name ...(
          generate_viable_bash_string_flags {
            verbose: $verbose
            n:$n
          }
        )

      }


      export def prune [--dry-run(-n), ...names:string] {

        bash_yadm remote prune ...$names ...(
          generate_viable_bash_string_flags {
            dry-run: $dry_run
          }
        )

      }


      export def update [
        --verbose(-v)
        --prune(-p)
        ...groups_or_remotes:string
        ] {


            bash_yadm remote update ...$groups_or_remotes ...(
              generate_viable_bash_string_flags {
                verbose:$verbose
                prune:$prune
              }
            )

      }



  }

  export module worktree {

      export def add [
        --f
        --detach
        --checkout
        --lock
        --reason:string
        --orphan
        --b(-B):string
        path:string
        commit_ish?:string
        ] {

        if ($commit_ish | describe) != nothing {

          bash_yadm worktree add $path $commit_ish ...(
            generate_viable_bash_string_flags {
              f:$f
              detach:$detach
              checkout:$checkout
              lock:$lock
              reason:$reason
              orphan:$orphan
              b:$b

            }
          )

        }

        bash_yadm worktree add $path ...(
            generate_viable_bash_string_flags {
              f:$f
              detach:$detach
              checkout:$checkout
              lock:$lock
              reason:$reason
              orphan:$orphan
              b:$b
            }
          )


      }


      export def list [-v --porcelain -z ] {

        bash_yadm worktree list ...(
          generate_viable_bash_string_flags {
            v:$v
            porcelain:$porcelain
            z:$z
          }
        )

      }

      export def lock [--reason worktree: string, ] {

        bash_yadm worktree lock $worktree ...(
          generate_viable_bash_string_flags {
          reason:$reason
          }
        )

      }

      export def move [worktree:string new_path:string] {

        bash_yadm worktree move $worktree $new_path

      }

      export def prune [--n --v --expire:string] {

        bash_yadm worktree prune ...(
          generate_viable_bash_string_flags {
            n:$n
            v:$v
            expire:$expire
          }
        )

      }

      export def remove [-f worktree:string, ] {

        bash_yadm worktree remove $worktree ...(
          generate_viable_bash_string_flags {
            f:$f
            }
        )

      }

      export def repair [ ...path:string ] {

        bash_yadm worktree repair ...$path

      }

      export def unlock [worktree:string] {

        bash_yadm worktree unlock $worktree

      }


  }

  export module bisect {


    export def start [
      --term-bad:string
      --term-new:string
      --term-good:string
      --term-old:string
      --no-checkout
      --first-parent
      bad:string
      good:string
    ] {

        bash_yadm bisect start $good $bad ...(
              generate_viable_bash_string_flags {
                  term-bad:$term_bad
                  term-new:$term_new
                  term-good:$term_good
                  term-old:$term_old
                  no-checkout:$no_checkout
                  first-parent:$first_parent
              }
        )

    }


    export def good [term:string] {

       bash_yadm bisect good $term

    }

    export def old [term:string] {

       bash_yadm bisect old $term

    }

    export def bad [term:string] {

       bash_yadm bisect bad $term

    }

    export def new [term:string] {

       bash_yadm bisect new $term

    }

    export def terms [
      --term-bad:string
      --term-new:string
      --term-good:string
      --term-old:string
    ] {

        bash_yadm bisect terms ...(
              generate_viable_bash_string_flags {
                  term-bad:$term_bad
                  term-new:$term_new
                  term-good:$term_good
                  term-old:$term_old
              }
        )

    }

    export def skip [rev_or_range:string] {

        bash_yadm bisect skip $rev_or_range

    }

    export def visualize [--stat --p] {

        bash_yadm bisect visualize ...(
          generate_viable_bash_string_flags {
            p:$p
            stat:$stat
          }
        )

    }

    export alias view = visualize

    export def replay [logfile:string] {

      bash_yadm bisect replay $logfile

    }

    export def log [] {

      bash_yadm bisect log

    }

    export def run [...cmd:string] {

      bash_yadm bisect run ...$cmd

    }

    export def help [] {

      bash_yadm bisect help

    }

  }


  export def add [
    --verbose(-v)
    --dry-run(-n)
    --force(-f)
    --interactive(-i)
    --patch(-p)
    --edit(-e)
    --no-all
    --all(-A)
    --no-ignore-removal
    --ignore-removal
    --update(-u)
    --sparse
    --intent-to-add(-N)
    --refresh
    --ignore-errors
    --ignore-missing
    --renormalize
    --chmod:string
    --pathspec-from-file:string
    --pathspec-file-nul
    ...pathspecs:string
  ] {

    bash_yadm add ...$pathspecs  ...(
      generate_viable_bash_string_flags {
        verbose:$verbose
        dry-run:$dry_run
        force:$force
        interactive:$interactive
        patch:$patch
        edit:$edit
        no-all:$no_all
        all:$all
        no-ignore-removal:$no_ignore_removal
        ignore-removal:$ignore_removal
        update:$update
        sparse:$sparse
        intent-to-add:$intent_to_add
        refresh:$refresh
        ignore-errors:$ignore_errors
        ignore-missing:$ignore_missing
        renormalize:$renormalize
        chmod:$chmod
        pathspec-from-file:$pathspec_from_file
        pathspec-file-nul:$pathspec_file_nul
      }
    )

  }

export module branch {


  def get-track-completions [] {
    ['direct' 'inherit']
  }

  export def main [
      --color:string
      --no-color
      --show-current
      --abbrev:string
      --no-abbrev
      --column:string
      --no-column
      --sort:string
      --merged:string
      --no-merged:string
      --contains:string
      --no-contains:string
      --points-at:string
      --format:string
      --remotes(-r)
      --all(-a)
      --list
      --pattern
      --track:string@get-track-completions
      --no-track
      --set-upstream-to:string
      --u:string
      --unset-upstream
      --m(-M):string
      --c(-C):string
      --d(-D):string
      --edit-description
      branch_name?:string
    ] {

      let viable_bash_string_flags = generate_viable_bash_string_flags {
              color:$color
              no-color:$no_color
              show-current:$show_current
              abbrev:$abbrev
              no-abbrev:$no_abbrev
              column:$column
              no-column:$no_column
              sort:$sort
              merged:$merged
              no-merged:$no_merged
              contains:$contains
              no-contains:$no_contains
              points-at:$points_at
              format:$format
              remotes:$remotes
              all:$all
              list:$list
              pattern:$pattern
              track:$track
              no-track:$no_track
              set-upstream-to:$set_upstream_to
              u:$u
              unset-upstream:$unset_upstream
              m:$m
              c:$c
              d:$d
              edit-description:$edit_description
            }


      if (branch_name | describe) != nothing {

        return (bash_yadm branch $branch_name ...$viable_bash_string_flags)

      }

      bash_yadm branch ...$viable_bash_string_flags

    }


   }

export def fetch [
  repository?: string
  --all
  --append(-a)
  --atomic
  --depth: int
  --deepen: int
  --shallow-since: string
  --shallow-exclude: string
  --unshallow
  --update-shallow
  --negotiation-tip: string
  --negotiate-only
  --dry-run
  --write-fetch-head
  --no-write-fetch-head
  --force(-f)
  --keep(-k)
  --multiple
  --auto-maintenance
  --no-auto-maintenance
  --auto-gc
  --no-auto-gc
  --write-commit-graph
  --no-write-commit-graph
  --prefetch
  --prune(-p)
  --prune-tags(-P)
  --no-tags(-n)
  --refmap: string
  --tags(-t)
  --recurse-submodules:string
  --jobs(-j):int
  --no-recurse-submodules
  --set-upstream
  --submodule-prefix: string
  --upload-pack: string
  --quiet(-q)
  --verbose(-v)
  --progress
  --server-option(-o): string
  --show-forced-updates
  --no-show-forced-updates
  --ipv4(-4)
  --ipv6(-6)
] {

      let viable_bash_string_flags = generate_viable_bash_string_flags {
            all:$all
            append:$append
            atomic:$atomic
            depth:$depth
            deepen:$deepen
            shallow-since:$shallow_since
            shallow-exclude:$shallow_exclude
            unshallow:$unshallow
            update-shallow:$update_shallow
            negotiation-tip:$negotiation_tip
            negotiate-only:$negotiate_only
            dry-run:$dry_run
            write-fetch-head:$write_fetch_head
            no-write-fetch-head:$no_write_fetch_head
            force:$force
            keep:$keep
            multiple:$multiple
            auto-maintenance:$auto_maintenance
            no-auto-maintenance:$no_auto_maintenance
            auto-gc:$auto_gc
            no-auto-gc:$no_auto_gc
            write-commit-graph:$write_commit_graph
            no-write-commit-graph:$no_write_commit_graph
            prefetch:$prefetch
            prune:$prune
            prune-tags:$prune_tags
            no-tags:$no_tags
            refmap:$refmap
            tags:$tags
            recurse-submodules:$recurse_submodules
            jobs:$jobs
            no-recurse-submodules:$no_recurse_submodules
            set-upstream:$set_upstream
            submodule-prefix:$submodule_prefix
            upload-pack:$upload_pack
            quiet:$quiet
            verbose:$verbose
            progress:$progress
            server-option:$server_option
            show-forced-updates:$show_forced_updates
            no-show-forced-updates:$no_show_forced_updates
            ipv4:$ipv4
            ipv6:$ipv6
          }

      if ($repository | describe) != nothing  {

        return (bash_yadm fetch $repository ...$viable_bash_string_flags)
      }

      bash_yadm fetch ...$viable_bash_string_flags

}


  export def checkout [
      --q
      --f
      --m
      --detach
      --b(-B)
      --orphan
      --pathspec-from-file:string
      --pathspec-file-nul
      --ours
      --theirs
      --conflict
      --patch
      branch:string
  ] {

    bash_yadm checkout $branch ...(
      generate_viable_bash_string_flags {
         q:$q
         f:$f
         detach:$detach
         b:$b
         orphan:$orphan
         pathspec-from-file:$pathspec_from_file
         pathspec-file-nul:$pathspec_file_nul
         ours:$ours
         theirs:$theirs
         patch:$patch
      }
    )

  }


  export module cherry-pick {

    def get-empty-completions [] {
        ['drop' 'keep' 'stop']
    }

    export def main [
        --edit(-e)
        --no-commit(-n)
        --mainline(-m):string
        --signoff(-s)
        --x
        --cleanup
        --gpg-sign(-S):string
        --ff
        --allow-empty
        --empty:string@get-empty-completions
        --allow-empty-message
        --keep-redundant-commits
        --strategy:string
        --strategy-option:string
        --rerere-autoupdate
        --no-rerere-autoupdate
        --continue
        --skip
        --quit
        --abort
        ...commits:string
        ] {

        bash_yadm cherry-pick ...$commits ...(
            generate_viable_bash_string_flags {
              edit:$edit
              no-commit:$no_commit
              cleanup:$cleanup
              mainline:$mainline
              signoff:$signoff
              x:$x
              ff:$ff
              allow-empty:$allow_empty
              allow-empty-message:$allow_empty_message
              gpg-sign:$gpg_sign
              empty:$empty
              keep-redundant-commits:$keep_redundant_commits
              strategy:$strategy
              strategy-option:$strategy_option
              rerere-autoupdate:$rerere_autoupdate
              continue:$continue
              skip:$skip
              quit:$quit
              abort:$abort
            }
          )

      }

  }


  export def clone [
    --local(-l)
    --no-hardlinks
    --shared(-s)
    --reference
    --reference-if-able
    --dissociate
    --quiet(-q)
    --verbose(-v)
    --progress
    --server-option:string
    --no-checkout(-n)
    --reject-shallow
    --no-reject-shallow
    --bare
    --sparse
    --filter:string
    --also-filter-submodules
    --mirror
    --origin(-o):string
    --branch(-b):string
    --upload-pack(-u):string
    --template:string
    --config(-c):string
    --depth
    --shallow-since:string
    --shallow-exclude:string
    --single-branch
    --no-single-branch
    --no-tags
    --recurse-submodules:string
    --shalow-submodules
    --no-shalow-submodules
    --remote-submodules
    --no-remote-submodules
    --separate-git-dir:string
    --ref-format:string
    --jobs(-j):int
    repository:string
    directory:string
  ] {

    bash_yadm clone $repository $directory ...(
      generate_viable_bash_string_flags {
          local:$local
          no-hardlinks:$no_hardlinks
          shared:$shared
          reference:$reference
          reference-if-able:$reference_if_able
          dissociate:$dissociate
          quiet:$quiet
          verbose:$verbose
          progress:$progress
          server-option:$server_option
          no-checkout:$no_checkout
          reject-shallow:$reject_shallow
          no-reject-shallow:$no_reject_shallow
          bare:$bare
          sparse:$sparse
          filter:$filter
          also-filter-submodules:$also_filter_submodules
          mirror:$mirror
          origin:$origin
          branch:$branch
          upload-pack:$upload_pack
          template:$template
          config:$config
          depth:$depth
          shallow-since:$shallow_since
          shallow-exclude:$shallow_exclude
          single-branch:$single_branch
          no-single-branch:$no_single_branch
          no-tags:$no_tags
          recurse-submodules:$recurse_submodules
          shalow-submodules:$shalow_submodules
          no-shalow-submodules:$no_shalow_submodules
          remote-submodules:$remote_submodules
          no-remote-submodules:$no_remote_submodules
          separate-git-dir:$separate_git_dir
          ref-format:$ref_format
          jobs:$jobs
      }
    )

  }


export module commit {

    def get-fixup-completions [] {
        ['amend' 'reword'] | each {|value| $"($value):<commit>" }
    }

    def get-cleanup-completions [] {
        ['strip' 'whitespace' 'verbatim' 'scissors' 'default']
    }

    export def main [
     --all(-a)
     --patch(-p)
     --reuse-message(-c):string
     --reedit-message(-C):string
     --fixup:string@get-fixup-completions
     --squash:string
     --reset-author
     --short
     --branch
     --porcelain
     --long
     --null(-z)
     --file(-F):string
     --author:string
     --date:string
     --template(-t):string
     --signoff
     --no-signoff
     --trailer:string
     --verify
     --no-verify(-n)
     --allow-empty
     --allow-empty-message
     --cleanup:string@get-cleanup-completions
     --edit(-e)
     --no-edit
     --amend
     --no-post-rewrite
     --include(-i)
     --only(-o)
     --pathspec-from-file:string
     --pathspec-file-nul
     --untracked-files(-u):string
     --verbose(-v)
     --quiet(-q)
     --dry-run
     --status
     --no-status
     --gpg-sign:string
     --no-gpg-sign
     --message(-m):string
    ...pathspec:string
      ] {

     bash_yadm commit ...$pathspec ...(

        generate_viable_bash_string_flags {
          all:$all
          patch:$patch
          reuse-message:$reuse_message
          reedit-message:$reedit_message
          fixup:$fixup
          squash:$squash
          reset-author:$reset_author
          short:$short
          branch:$branch
          porcelain:$porcelain
          long:$long
          'null':$null
          file:$file
          author:$author
          date:$date
          template:$template
          signoff:$signoff
          no-signoff:$no_signoff
          trailer:$trailer
          verify:$verify
          no-verify:$no_verify
          allow-empty:$allow_empty
          allow-empty-message:$allow_empty_message
          cleanup:$cleanup
          edit:$edit
          no-edit:$no_edit
          amend:$amend
          no-post-rewrite:$no_post_rewrite
          include:$include
          only:$only
          pathspec-from-file:$pathspec_from_file
          pathspec-file-nul:$pathspec_file_nul
          untracked-files:$untracked_files
          verbose:$verbose
          quiet:$quiet
          dry-run:$dry_run
          status:$status
          no-status:$no_status
          gpg-sign:$gpg_sign
          no-gpg-sign:$no_gpg_sign
          message:$message
        }
      )

    }

}



export module diff {

    def get-diff-algorithm-completions [] {
        ['patience' 'minimal' 'histogram' 'myers']
    }

    def get-submodule-completions [] {
        ['short' 'log' 'diff']
    }

    def get-color-completions [] {
        ['never' 'always' 'auto']
    }

    def get-color-moved-completions [] {
        ['no' 'default' 'plain' 'blocks' 'zebra' 'dimmed-zebra']
    }

    def get-color-moved-ws-completions [] {
        [
        'no'
        'ignore-space-at-eol'
        'ignore-space-change'
        'ignore-all-space'
        'allow-indentation-change'
        ]
    }

    def get-word-diff-completions [] {
        ['color' 'plain' 'porcelain' 'none']
    }

    export def main [
      --no-index
      --cached
      --merge-base
      --patch(-p)
      --no-patch(-s)
      --unified(-U)
      --output
      --output-indicator-new
      --output-indicator-context
      --raw
      --patch-with-raw
      --indent-heuristic
      --no-indent-heuristic
      --minimal
      --patience
      --histogram
      --anchored
      --diff-algorithm:string@get-diff-algorithm-completions
      --stat:string
      --stat-width:int
      --stat-count:int
      --stat-name-width:string
      --compact-summary
      --numstat
      --shortstat
      --dirstat(-X):string
      --cumulative
      --dirstat-by-file
      --summary
      --patch-with-stat
      --z
      --name-only
      --name-status
      --submodule:string@get-submodule-completions
      --output
      --color:string@get-color-completions
      --no-color
      --color-moved:string@get-color-moved-completions
      --no-color-moved
      --color-moved-ws:string@get-color-moved-ws-completions
      --no-color-moved-ws
      --word-diff:string@get-word-diff-completions
      --word-diff-regex:string
      --color-words:string
      --no-renames
      --no-rename-empty
      --check
      --ws-error-highlight:string
      --full-index
      --binary
      --abbrev:string
      --break-rewrites(-B):string
      --find-renames(-M):string
      --find-copies(-C):string
      --find-copies-harder
      --irreversible-delete(-D)
      --l:int
      --diff-filter:string
      --S:string
      --G:string
      --find-object:string
      --pickaxe-all
      --pickaxe-regex
      --O:string
      --skip-to:path
      --rotate-to:path
      --R
      --relative:path
      --no-relative
      --text(-a)
      --ignore-cr-at-eol
      --ignore-space-at-eol
      --ignore-space-change(-b)
      --ignore-all-space(-w)
      --ignore-blank-lines
      --ignore-matching-lines(-I)
      --inter-hunk-context:string
      --function-context(-W)
      --exit-code
      --quiet
      --ext-diff
      --no-ext-diff
      --textconv
      --no-textconv
      --ignore-submodules:string
      --src-prefix:string
      --dst-prefix:string
      --no-prefix
      --default-prefix
      --line-prefix
      --ita-invisible-in-index
      --base(-1)
      --ours(-2)
      --theirs(-3)
      --0
      ...rest:string
      ] {

          bash_yadm diff ...$rest ...(
            generate_viable_bash_string_flags {
                no-index:$no_index
                cached:$cached
                merge-base:$merge_base
                patch:$patch
                no-patch:$no_patch
                unified:$unified
                output:$output
                output-indicator-new:$output_indicator_new
                output-indicator-context:$output_indicator_context
                raw:$raw
                patch-with-raw:$patch_with_raw
                indent-heuristic:$indent_heuristic
                no-indent-heuristic:$no_indent_heuristic
                minimal:$minimal
                patience:$patience
                histogram:$histogram
                anchored:$anchored
                diff-algorithm:$diff_algorithm
                stat:$stat
                stat-width:$stat_width
                stat-count:$stat_count
                stat-name-width:$stat_name_width
                compact-summary:$compact_summary
                numstat:$numstat
                shortstat:$shortstat
                dirstat:$dirstat
                cumulative:$cumulative
                dirstat-by-file:$dirstat_by_file
                summary:$summary
                patch-with-stat:$patch_with_stat
                z:$z
                name-only:$name_only
                name-status:$name_status
                submodule:$submodule
                color:$color
                no-color:$no_color
                color-moved:$color_moved
                no-color-moved:$no_color_moved
                color-moved-ws:$color_moved_ws
                no-color-moved-ws:$no_color_moved_ws
                word-diff:$word_diff
                word-diff-regex:$word_diff_regex
                color-words:$color_words
                no-renames:$no_renames
                no-rename-empty:$no_rename_empty
                check:$check
                ws-error-highlight:$ws_error_highlight
                full-index:$full_index
                binary:$binary
                abbrev:$abbrev
                break-rewrites:$break_rewrites
                find-renames:$find_renames
                find-copies:$find_copies
                find-copies-harder:$find_copies_harder
                irreversible-delete:$irreversible_delete
                l:$l
                diff-filter:$diff_filter
                S:$S
                G:$G
                find-object:$find_object
                pickaxe-all:$pickaxe_all
                pickaxe-regex:$pickaxe_regex
                O:$O
                skip-to:$skip_to
                rotate-to:$rotate_to
                R:$R
                relative:$relative
                no-relative:$no_relative
                text:$text
                ignore-cr-at-eol:$ignore_cr_at_eol
                ignore-space-at-eol:$ignore_space_at_eol
                ignore-space-change:$ignore_space_change
                ignore-all-space:$ignore_all_space
                ignore-blank-lines:$ignore_blank_lines
                ignore-matching-lines:$ignore_matching_lines
                inter-hunk-context:$inter_hunk_context
                function-context:$function_context
                exit-code:$exit_code
                quiet:$quiet
                ext-diff:$ext_diff
                no-ext-diff:$no_ext_diff
                textconv:$textconv
                no-textconv:$no_textconv
                ignore-submodules:$ignore_submodules
                src-prefix:$src_prefix
                dst-prefix:$dst_prefix
                no-prefix:$no_prefix
                default-prefix:$default_prefix
                line-prefix:$line_prefix
                ita-invisible-in-index:$ita_invisible_in_index
                base:$base
                ours:$ours
                theirs:$theirs
                0:$0
            }
          )

      }
 }

}


export module grep {

    def get-color-completions [] {
        ['never' 'auto']
    }

   export def main [
     --cached
     --untracked
     --no-index
     --exclude-standard
     --no-exclude-standard
     --recurse-submodules
     --text(-a)
     --textconv
     --no-textconv
     --ignore-case(-i)
     -I
     --max-depth:int
     --recursive(-r):int
     --no-recursive
     --word-group(-w)
     --invert-match(-v)
     --h(-H)
     --full-name
     --basic-regexp(-G)
     --extended-regexp(-E)
     --perl-regexp(-P)
     --fixed-strings(-F)
     --line-number(-n)
     --column
     --files-with-machines(-l)
     --name-only(-L)
     --files-without-match
     --open-files-in-pager(-O)
     --null(-z)
     --only-matching(-o)
     --count(-c)
     --color:string@get-color-completions
     --no-color
     --break
     --heading
     --show-function(-p)
     --context(-C):int
     --after-context(-A):int
     --before-context(-B):int
     --function-context(-W)
     --max-count(-m):int
     --threads:int
     -f:string
     -e
     --and
     --or
     --not
     --all-match
     --quiet(-q)
     ...$rest:string
   ] {

        bash_yadm grep ...$rest ...(
          generate_viable_bash_string_flags {
            cached:$cached
            untracked:$untracked
            no-index:$no_index
            exclude-standard:$exclude_standard
            no-exclude-standard:$no_exclude_standard
            recurse-submodules:$recurse_submodules
            text:$text
            textconv:$textconv
            no-textconv:$no_textconv
            ignore-case:$ignore_case
            I:$I
            max-depth:$max_depth
            recursive:$recursive
            no-recursive:$no_recursive
            word-group:$word_group
            invert-match:$invert_match
            h:$h
            full-name:$full_name
            basic-regexp:$basic_regexp
            extended-regexp:$extended_regexp
            perl-regexp:$perl_regexp
            fixed-strings:$fixed_strings
            line-number:$line_number
            column:$column
            files-with-machines:$files_with_machines
            name-only:$name_only
            files-without-match:$files_without_match
            open-files-in-pager:$open_files_in_pager
            'null':$null
            only-matching:$only_matching
            count:$count
            color:$color
            no-color:$no_color
            break:$break
            heading:$heading
            show-function:$show_function
            context:$context
            after-context:$after_context
            before-context:$before_context
            function-context:$function_context
            max-count:$max_count
            threads:$threads
            f:$f
            e:$e
            and:$and
            or:$or
            not:$not
            all-match:$all_match
            quiet:$quiet
          }
        )

}

}


 export module log {

  def get-decorate-completions [] {
     ['short' 'full' 'auto' 'no']
  }

  def get-exclude-hidden-completions [] {
      ['fetch' 'receive' 'uploadpack']
  }

  def get-no-walk-completions [] {
      ['sorted' 'unsorted']
  }

  def get-pretty-completions [] {
      [
        'oneline',
        'short',
        'medium',
        'full',
        'fuller',
        'reference',
        'email',
        'mxboard',
        raw
      ]
  }

  def get-date-completions [] {
      [
        'relative'
        'local'
        'iso'
        'iso-strict'
        'rfc'
        'short'
        'raw'
        'human'
        'unix'
        'default'
      ]
  }

  def get-diff-merges-completions [] {
      [
        'off'
        'none'
        'on'
        'm'
        'first-parent'
        '1'
        'separate'
        'combined'
        'c'
        'dense-combined'
        'cc'
        'remerge'
        'r'
      ]
  }

  def get-diff-algorithm-completions [] {
      ['patience' 'minimal' 'histogram' 'myers']
  }

  def get-submodule-completions [] {
      ['short' 'log' 'diff']
  }

    def get-color-completions [] {
       ['never' 'always' 'auto']
  }

  def get-color-moved-completions [] {
      ['no' 'default' 'plain' 'blocks' 'zebra' 'dimmed-zebra']
  }

  def get-color-moved-ws-completions [] {
      [
      'no'
      'ignore-space-at-eol'
      'ignore-space-change'
      'ignore-all-space'
      'allow-indentation-change'
      ]
  }

  def get-word-diff-completions [] {
    ['color' 'plain' 'porcelain' 'none']
  }

  export def main [
     --follow
     --decorate:string@get-decorate-completions
     --no-decorate
     --decoate-refs:string
     --decorate-refs-exclude:string
     --clear-decorations
     --source
     --mailmap
     --no-mailmap
     --use-mailmap
     --no-use-mailmap
     --full-diff
     --log-size
     -L:string
     -n:int
     --max-count:int
     --skip:int
     --since:string
     --after:string
     --since-as-filter:string
     --until:string
     --before:string
     --author:string
     --grep-reflog:string
     --grep:string
     --all-match
     --invert-grep
     --regexp-ignore-case(-i)
     --basic-regexp
     --extended-regexp(-E)
     --fixed-strings(-F)
     --perl-regexp(-P)
     --remove-empty
     --merges
     --no-merges
     --min-parents:int
     --no-min-parents
     --max-parents:int
     --no-max-parents
     --first-parent
     --exclude-first-parent-only
     --all
     --branches:string
     --tags:string
     --remotes:string
     --glob:glob
     --exclude:glob
     --exclude-hidden:string@get-exclude-hidden-completions
     --reflog:string
     --alternate-refs
     --single-worktree
     --ignore-missing
     --bisect
     --stdin
     --cherry-mark
     --cherry-pick
     --left-only
     --right-only
     --cherry
     --walk-reflogs(-g)
     --merge
     --boundary
     --simplify-by-decoration
     --show-pulls
     --full-history
     --dense
     --sparse
     --simplify-merges
     --ancestry-path:string
     --date-order
     --author-date-order
     --topo-order
     --no-walk:string@get-no-walk-completions
     --do-walk
     --pretty:string@get-pretty-completions
     --format:string@get-pretty-completions
     --abbrev-commit
     --no-abbrev-commit
     --oneline
     --encoding:string
     --expand-tabs:int
     --no-expand-tabs
     --notes:string
     --no-notes
     --show-notes-by-default
     --show-notes:string
     --standard-notes
     --no-standard-notes
     --show-signature
     --relative-date
     --date:string@get-date-completions
     --parents
     --children
     --left-right
     --graph
     --show-linear-break:string
     --patch(-p)
     --patch(-u)
     --no-patch(-s)
     -m
     -c
     --cc
     --dd
     --remerge-diff
     --no-diff-merges
     --diff-merges:string@get-diff-merges-completions
     --combined-all-paths
     --unified(-U)
      --output
      --output-indicator-new
      --output-indicator-context
      --raw
      --patch-with-raw
      --indent-heuristic
      --no-indent-heuristic
      --minimal
      --patience
      --histogram
      --anchored
      --diff-algorithm:string@get-diff-algorithm-completions
      --stat:string
      --stat-width:int
      --stat-count:int
      --stat-name-width:string
      --compact-summary
      --numstat
      --shortstat
      --dirstat(-X):string
      --cumulative
      --dirstat-by-file
      --summary
      --patch-with-stat
      --z
      --name-only
      --name-status
      --submodule:string@get-submodule-completions
      --output
      --color:string@get-color-completions
      --no-color
      --color-moved:string@get-color-moved-completions
      --no-color-moved
      --color-moved-ws:string@get-color-moved-ws-completions
      --no-color-moved-ws
      --word-diff:string@get-word-diff-completions
      --word-diff-regex:string
      --color-words:string
      --no-renames
      --no-rename-empty
      --check
      --ws-error-highlight:string
      --full-index
      --binary
      --abbrev:string
      --break-rewrites(-B):string
      --find-renames(-M):string
      --find-copies(-C):string
      --find-copies-harder
      --irreversible-delete(-D)
      --l:int
      --diff-filter:string
      --S:string
      --G:string
      --find-object:string
      --pickaxe-all
      --pickaxe-regex
      --O:string
      --skip-to:path
      --rotate-to:path
      --R
      --relative:path
      --no-relative
      --text(-a)
      --ignore-cr-at-eol
      --ignore-space-at-eol
      --ignore-space-change(-b)
      --ignore-all-space(-w)
      --ignore-blank-lines
      --ignore-matching-lines(-I)
      --inter-hunk-context:string
      --function-context(-W)
      --exit-code
      --ext-diff
      --no-ext-diff
      --textconv
      --no-textconv
      --ignore-submodules:string
      --src-prefix:string
      --dst-prefix:string
      --no-prefix
      --default-prefix
      --line-prefix
      --ita-invisible-in-index
      ...rest
     ] {

        bash_yadm log ...$rest ...(
            generate_viable_bash_string_flags {
                follow:$follow
                decorate:$decorate
                no-decorate:$no_decorate
                decoate-refs:$decoate_refs
                decorate-refs-exclude:$decorate_refs_exclude
                clear-decorations:$clear_decorations
                source:$source
                mailmap:$mailmap
                no-mailmap:$no_mailmap
                use-mailmap:$use_mailmap
                no-use-mailmap:$no_use_mailmap
                full-diff:$full_diff
                log-size:$log_size
                L:$L
                n:$n
                max-count:$max_count
                skip:$skip
                since:$since
                after:$after
                since-as-filter:$since_as_filter
                until:$until
                before:$before
                author:$author
                grep-reflog:$grep_reflog
                grep:$grep
                all-match:$all_match
                invert-grep:$invert_grep
                regexp-ignore-case:$regexp_ignore_case
                basic-regexp:$basic_regexp
                extended-regexp:$extended_regexp
                fixed-strings:$fixed_strings
                perl-regexp:$perl_regexp
                remove-empty:$remove_empty
                merges:$merges
                no-merges:$no_merges
                min-parents:$min_parents
                no-min-parents:$no_min_parents
                max-parents:$max_parents
                no-max-parents:$no_max_parents
                first-parent:$first_parent
                exclude-first-parent-only:$exclude_first_parent_only
                all:$all
                branches:$branches
                tags:$tags
                remotes:$remotes
                glob:$glob
                exclude:$exclude
                exclude-hidden:$exclude_hidden
                reflog:$reflog
                alternate-refs:$alternate_refs
                single-worktree:$single_worktree
                ignore-missing:$ignore_missing
                bisect:$bisect
                stdin:$stdin
                cherry-mark:$cherry_mark
                cherry-pick:$cherry_pick
                left-only:$left_only
                right-only:$right_only
                cherry:$cherry
                walk-reflogs:$walk_reflogs
                merge:$merge
                boundary:$boundary
                simplify-by-decoration:$simplify_by_decoration
                show-pulls:$show_pulls
                full-history:$full_history
                dense:$dense
                sparse:$sparse
                simplify-merges:$simplify_merges
                ancestry-path:$ancestry_path
                date-order:$date_order
                author-date-order:$author_date_order
                topo-order:$topo_order
                no-walk:$no_walk
                do-walk:$do_walk
                pretty:$pretty
                format:$format
                abbrev-commit:$abbrev_commit
                no-abbrev-commit:$no_abbrev_commit
                oneline:$oneline
                encoding:$encoding
                expand-tabs:$expand_tabs
                no-expand-tabs:$no_expand_tabs
                notes:$notes
                no-notes:$no_notes
                show-notes-by-default:$show_notes_by_default
                show-notes:$show_notes
                standard-notes:$standard_notes
                no-standard-notes:$no_standard_notes
                show-signature:$show_signature
                relative-date:$relative_date
                date:$date
                parents:$parents
                children:$children
                left-right:$left_right
                graph:$graph
                show-linear-break:$show_linear_break
                m:$m
                c:$c
                cc:$cc
                dd:$dd
                remerge-diff:$remerge_diff
                no-diff-merges:$no_diff_merges
                diff-merges:$diff_merges
                combined-all-paths:$combined_all_paths
                patch:$patch
                no-patch:$no_patch
                unified:$unified
                output:$output
                output-indicator-new:$output_indicator_new
                output-indicator-context:$output_indicator_context
                raw:$raw
                patch-with-raw:$patch_with_raw
                indent-heuristic:$indent_heuristic
                no-indent-heuristic:$no_indent_heuristic
                minimal:$minimal
                patience:$patience
                histogram:$histogram
                anchored:$anchored
                diff-algorithm:$diff_algorithm
                stat:$stat
                stat-width:$stat_width
                stat-count:$stat_count
                stat-name-width:$stat_name_width
                compact-summary:$compact_summary
                numstat:$numstat
                shortstat:$shortstat
                dirstat:$dirstat
                cumulative:$cumulative
                dirstat-by-file:$dirstat_by_file
                summary:$summary
                patch-with-stat:$patch_with_stat
                z:$z
                name-only:$name_only
                name-status:$name_status
                submodule:$submodule
                color:$color
                no-color:$no_color
                color-moved:$color_moved
                no-color-moved:$no_color_moved
                color-moved-ws:$color_moved_ws
                no-color-moved-ws:$no_color_moved_ws
                word-diff:$word_diff
                word-diff-regex:$word_diff_regex
                color-words:$color_words
                no-renames:$no_renames
                no-rename-empty:$no_rename_empty
                check:$check
                ws-error-highlight:$ws_error_highlight
                full-index:$full_index
                binary:$binary
                abbrev:$abbrev
                break-rewrites:$break_rewrites
                find-renames:$find_renames
                find-copies:$find_copies
                find-copies-harder:$find_copies_harder
                irreversible-delete:$irreversible_delete
                l:$l
                diff-filter:$diff_filter
                S:$S
                G:$G
                find-object:$find_object
                pickaxe-all:$pickaxe_all
                pickaxe-regex:$pickaxe_regex
                O:$O
                skip-to:$skip_to
                rotate-to:$rotate_to
                R:$R
                relative:$relative
                no-relative:$no_relative
                text:$text
                ignore-cr-at-eol:$ignore_cr_at_eol
                ignore-space-at-eol:$ignore_space_at_eol
                ignore-space-change:$ignore_space_change
                ignore-all-space:$ignore_all_space
                ignore-blank-lines:$ignore_blank_lines
                ignore-matching-lines:$ignore_matching_lines
                inter-hunk-context:$inter_hunk_context
                function-context:$function_context
                exit-code:$exit_code
                ext-diff:$ext_diff
                no-ext-diff:$no_ext_diff
                textconv:$textconv
                no-textconv:$no_textconv
                ignore-submodules:$ignore_submodules
                src-prefix:$src_prefix
                dst-prefix:$dst_prefix
                no-prefix:$no_prefix
                default-prefix:$default_prefix
                line-prefix:$line_prefix
                ita-invisible-in-index:$ita_invisible_in_index
            }
          )

    }

  }

 export module reflog {

  def get-decorate-completions [] {
      ['short' 'full' 'auto' 'no']
  }

  def get-exclude-hidden-completions [] {
      ['fetch' 'receive' 'uploadpack']
  }

  def get-no-walk-completions [] {
      ['sorted' 'unsorted']
  }

  def get-pretty-completions [] {
      [
        'oneline',
        'short',
        'medium',
        'full',
        'fuller',
        'reference',
        'email',
        'mxboard',
        raw
      ]
  }

  def get-date-completions [] {
      [
        'relative'
        'local'
        'iso'
        'iso-strict'
        'rfc'
        'short'
        'raw'
        'human'
        'unix'
        'default'
      ]
  }

  def get-diff-merges-completions [] {
      [
        'off'
        'none'
        'on'
        'm'
        'first-parent'
        '1'
        'separate'
        'combined'
        'c'
        'dense-combined'
        'cc'
        'remerge'
        'r'

      ]
  }

  def get-diff-algorithm-completions [] {
      ['patience' 'minimal' 'histogram' 'myers']
    }

  def get-submodule-completions [] {
      ['short' 'log' 'diff']
    }

    def get-color-completions [] {
       ['never' 'always' 'auto']
    }

    def get-color-moved-completions [] {
        ['no' 'default' 'plain' 'blocks' 'zebra' 'dimmed-zebra']
    }

    def get-color-moved-ws-completions [] {
        [
        'no'
        'ignore-space-at-eol'
        'ignore-space-change'
        'ignore-all-space'
        'allow-indentation-change'
        ]
    }

    def get-word-diff-completions [] {
        ['color' 'plain' 'porcelain' 'none']
    }

   export def main [
     --follow
     --decorate:string@get-decorate-completions
     --no-decorate
     --decoate-refs:string
     --decorate-refs-exclude:string
     --clear-decorations
     --source
     --mailmap
     --no-mailmap
     --use-mailmap
     --no-use-mailmap
     --full-diff
     --log-size
     -L:string
     -n:int
     --max-count:int
     --skip:int
     --since:string
     --after:string
     --since-as-filter:string
     --until:string
     --before:string
     --author:string
     --grep-reflog:string
     --grep:string
     --all-match
     --invert-grep
     --regexp-ignore-case(-i)
     --basic-regexp
     --extended-regexp(-E)
     --fixed-strings(-F)
     --perl-regexp(-P)
     --remove-empty
     --merges
     --no-merges
     --min-parents:int
     --no-min-parents
     --max-parents:int
     --no-max-parents
     --first-parent
     --exclude-first-parent-only
     --all
     --branches:string
     --tags:string
     --remotes:string
     --glob:glob
     --exclude:glob
     --exclude-hidden:string@get-exclude-hidden-completions
     --reflog:string
     --alternate-refs
     --single-worktree
     --ignore-missing
     --bisect
     --stdin
     --cherry-mark
     --cherry-pick
     --left-only
     --right-only
     --cherry
     --walk-reflogs(-g)
     --merge
     --boundary
     --simplify-by-decoration
     --show-pulls
     --full-history
     --dense
     --sparse
     --simplify-merges
     --ancestry-path:string
     --date-order
     --author-date-order
     --topo-order
     --no-walk:string@get-no-walk-completions
     --do-walk
     --pretty:string@get-pretty-completions
     --format:string@get-pretty-completions
     --abbrev-commit
     --no-abbrev-commit
     --oneline
     --encoding:string
     --expand-tabs:int
     --no-expand-tabs
     --notes:string
     --no-notes
     --show-notes-by-default
     --show-notes:string
     --standard-notes
     --no-standard-notes
     --show-signature
     --relative-date
     --date:string@get-date-completions
     --parents
     --children
     --left-right
     --graph
     --show-linear-break:string
     --patch(-p)
     --patch(-u)
     --no-patch(-s)
     -m
     -c
     --cc
     --dd
     --remerge-diff
     --no-diff-merges
     --diff-merges:string@get-diff-merges-completions
     --combined-all-paths
     --unified(-U)
      --output
      --output-indicator-new
      --output-indicator-context
      --raw
      --patch-with-raw
      --indent-heuristic
      --no-indent-heuristic
      --minimal
      --patience
      --histogram
      --anchored
      --diff-algorithm:string@get-diff-algorithm-completions
      --stat:string
      --stat-width:int
      --stat-count:int
      --stat-name-width:string
      --compact-summary
      --numstat
      --shortstat
      --dirstat(-X):string
      --cumulative
      --dirstat-by-file
      --summary
      --patch-with-stat
      --z
      --name-only
      --name-status
      --submodule:string@get-submodule-completions
      --output
      --color:string@get-color-completions
      --no-color
      --color-moved:string@get-color-moved-completions
      --no-color-moved
      --color-moved-ws:string@get-color-moved-ws-completions
      --no-color-moved-ws
      --word-diff:string@get-word-diff-completions
      --word-diff-regex:string
      --color-words:string
      --no-renames
      --no-rename-empty
      --check
      --ws-error-highlight:string
      --full-index
      --binary
      --abbrev:string
      --break-rewrites(-B):string
      --find-renames(-M):string
      --find-copies(-C):string
      --find-copies-harder
      --irreversible-delete(-D)
      --l:int
      --diff-filter:string
      --S:string
      --G:string
      --find-object:string
      --pickaxe-all
      --pickaxe-regex
      --O:string
      --skip-to:path
      --rotate-to:path
      --R
      --relative:path
      --no-relative
      --text(-a)
      --ignore-cr-at-eol
      --ignore-space-at-eol
      --ignore-space-change(-b)
      --ignore-all-space(-w)
      --ignore-blank-lines
      --ignore-matching-lines(-I)
      --inter-hunk-context:string
      --function-context(-W)
      --exit-code
      --ext-diff
      --no-ext-diff
      --textconv
      --no-textconv
      --ignore-submodules:string
      --src-prefix:string
      --dst-prefix:string
      --no-prefix
      --default-prefix
      --line-prefix
      --ita-invisible-in-index
      ...rest
     ] {

        bash_yadm reflog ...$rest ...(
            generate_viable_bash_string_flags {
                follow:$follow
                decorate:$decorate
                no-decorate:$no_decorate
                decoate-refs:$decoate_refs
                decorate-refs-exclude:$decorate_refs_exclude
                clear-decorations:$clear_decorations
                source:$source
                mailmap:$mailmap
                no-mailmap:$no_mailmap
                use-mailmap:$use_mailmap
                no-use-mailmap:$no_use_mailmap
                full-diff:$full_diff
                log-size:$log_size
                L:$L
                n:$n
                max-count:$max_count
                skip:$skip
                since:$since
                after:$after
                since-as-filter:$since_as_filter
                until:$until
                before:$before
                author:$author
                grep-reflog:$grep_reflog
                grep:$grep
                all-match:$all_match
                invert-grep:$invert_grep
                regexp-ignore-case:$regexp_ignore_case
                basic-regexp:$basic_regexp
                extended-regexp:$extended_regexp
                fixed-strings:$fixed_strings
                perl-regexp:$perl_regexp
                remove-empty:$remove_empty
                merges:$merges
                no-merges:$no_merges
                min-parents:$min_parents
                no-min-parents:$no_min_parents
                max-parents:$max_parents
                no-max-parents:$no_max_parents
                first-parent:$first_parent
                exclude-first-parent-only:$exclude_first_parent_only
                all:$all
                branches:$branches
                tags:$tags
                remotes:$remotes
                glob:$glob
                exclude:$exclude
                exclude-hidden:$exclude_hidden
                reflog:$reflog
                alternate-refs:$alternate_refs
                single-worktree:$single_worktree
                ignore-missing:$ignore_missing
                bisect:$bisect
                stdin:$stdin
                cherry-mark:$cherry_mark
                cherry-pick:$cherry_pick
                left-only:$left_only
                right-only:$right_only
                cherry:$cherry
                walk-reflogs:$walk_reflogs
                merge:$merge
                boundary:$boundary
                simplify-by-decoration:$simplify_by_decoration
                show-pulls:$show_pulls
                full-history:$full_history
                dense:$dense
                sparse:$sparse
                simplify-merges:$simplify_merges
                ancestry-path:$ancestry_path
                date-order:$date_order
                author-date-order:$author_date_order
                topo-order:$topo_order
                no-walk:$no_walk
                do-walk:$do_walk
                pretty:$pretty
                format:$format
                abbrev-commit:$abbrev_commit
                no-abbrev-commit:$no_abbrev_commit
                oneline:$oneline
                encoding:$encoding
                expand-tabs:$expand_tabs
                no-expand-tabs:$no_expand_tabs
                notes:$notes
                no-notes:$no_notes
                show-notes-by-default:$show_notes_by_default
                show-notes:$show_notes
                standard-notes:$standard_notes
                no-standard-notes:$no_standard_notes
                show-signature:$show_signature
                relative-date:$relative_date
                date:$date
                parents:$parents
                children:$children
                left-right:$left_right
                graph:$graph
                show-linear-break:$show_linear_break
                m:$m
                c:$c
                cc:$cc
                dd:$dd
                remerge-diff:$remerge_diff
                no-diff-merges:$no_diff_merges
                diff-merges:$diff_merges
                combined-all-paths:$combined_all_paths
                patch:$patch
                no-patch:$no_patch
                unified:$unified
                output:$output
                output-indicator-new:$output_indicator_new
                output-indicator-context:$output_indicator_context
                raw:$raw
                patch-with-raw:$patch_with_raw
                indent-heuristic:$indent_heuristic
                no-indent-heuristic:$no_indent_heuristic
                minimal:$minimal
                patience:$patience
                histogram:$histogram
                anchored:$anchored
                diff-algorithm:$diff_algorithm
                stat:$stat
                stat-width:$stat_width
                stat-count:$stat_count
                stat-name-width:$stat_name_width
                compact-summary:$compact_summary
                numstat:$numstat
                shortstat:$shortstat
                dirstat:$dirstat
                cumulative:$cumulative
                dirstat-by-file:$dirstat_by_file
                summary:$summary
                patch-with-stat:$patch_with_stat
                z:$z
                name-only:$name_only
                name-status:$name_status
                submodule:$submodule
                color:$color
                no-color:$no_color
                color-moved:$color_moved
                no-color-moved:$no_color_moved
                color-moved-ws:$color_moved_ws
                no-color-moved-ws:$no_color_moved_ws
                word-diff:$word_diff
                word-diff-regex:$word_diff_regex
                color-words:$color_words
                no-renames:$no_renames
                no-rename-empty:$no_rename_empty
                check:$check
                ws-error-highlight:$ws_error_highlight
                full-index:$full_index
                binary:$binary
                abbrev:$abbrev
                break-rewrites:$break_rewrites
                find-renames:$find_renames
                find-copies:$find_copies
                find-copies-harder:$find_copies_harder
                irreversible-delete:$irreversible_delete
                l:$l
                diff-filter:$diff_filter
                S:$S
                G:$G
                find-object:$find_object
                pickaxe-all:$pickaxe_all
                pickaxe-regex:$pickaxe_regex
                O:$O
                skip-to:$skip_to
                rotate-to:$rotate_to
                R:$R
                relative:$relative
                no-relative:$no_relative
                text:$text
                ignore-cr-at-eol:$ignore_cr_at_eol
                ignore-space-at-eol:$ignore_space_at_eol
                ignore-space-change:$ignore_space_change
                ignore-all-space:$ignore_all_space
                ignore-blank-lines:$ignore_blank_lines
                ignore-matching-lines:$ignore_matching_lines
                inter-hunk-context:$inter_hunk_context
                function-context:$function_context
                exit-code:$exit_code
                ext-diff:$ext_diff
                no-ext-diff:$no_ext_diff
                textconv:$textconv
                no-textconv:$no_textconv
                ignore-submodules:$ignore_submodules
                src-prefix:$src_prefix
                dst-prefix:$dst_prefix
                no-prefix:$no_prefix
                default-prefix:$default_prefix
                line-prefix:$line_prefix
                ita-invisible-in-index:$ita_invisible_in_index
            }
          )

  }



    export def list [] {

      bash_yadm reflog list

    }

    export def expire [
      --all
      --single-worktree
      --expire:string
      --expire-unreachable:string
      --rewrite
      --updateref
      --stale-fix
      --dry-run(-n)
      --verbose
      ...refs:string
    ] {

      bash_yadm reflog expire ...$refs ...(
          generate_viable_bash_string_flags {
            all:$all
            single-worktree:$single_worktree
            expire:$expire
            expire-unreachable:$expire_unreachable
            rewrite:$rewrite
            updateref:$updateref
            stale-fix:$stale_fix
            dry-run:$dry_run
            verbose:$verbose
          }
      )

    }

    export def delete [
      --rewrite
      --updateref
      --stale-fix
      --dry-run(-n)
      --verbose
      ref:string
    ] {

      bash_yadm reflog delete $ref ...(
          generate_viable_bash_string_flags {
            rewrite:$rewrite
            updateref:$updateref
            stale-fix:$stale_fix
            dry-run:$dry_run
            verbose:$verbose
          }
      )

    }


    export def exists [ref:string] {

      bash_yadm reflog exists $ref

    }


  }

  export def reset [
    --quiet(-q)
    --patch(-p)
    --soft
    --mixed(-N)
    --hard
    --merge
    --keep
    --recurse-submodules
    --no-recurse-submodules
    --refresh
    --no-refresh
    --pathspec-from-file:string
    --pathspec-file-nul
    value?:string
  ] {


      let viable_bash_string_flags = generate_viable_bash_string_flags {
                quiet:$quiet
                patch:$patch
                soft:$soft
                mixed:$mixed
                hard:$hard
                merge:$merge
                keep:$keep
                recurse-submodules:$recurse_submodules
                no-recurse-submodules:$no_recurse_submodules
                refresh:$refresh
                no-refresh:$no_refresh
                pathspec-from-file:$pathspec_from_file
                pathspec-file-nul:$pathspec_file_nul
          }


    if $value != nothing {

      return (
         bash_yadm reset $value ...$viable_bash_string_flags
      )

    }

    bash_yadm reset ...$viable_bash_string_flags

  }


  export def mv [
    --force(-f)
    -k
    --dry-run(-n)
    --verbose(-v)
    source:string
    destination:string
  ] {

        bash_yadm mv $source $destination ...(
          generate_viable_bash_string_flags {
            force:$force
            k:$k
            dry-run:$dry_run
            verbose:$verbose

          }
        )

  }


  export module pull {

    def get-recurse-submodules-completions [] {
        ['yes' 'on-demand' 'no']
    }

    def get-rebase-completions [] {
        ['false' 'true' 'merges' 'interactive']
    }

    def get-negotiation-tip-completions [] {
        ['commit' 'glob']
    }

    def get-strategy-completions [] {
        [
          'ort'
        'recursive'
        'resolve'
        'octopus'
        'ours'
        'subtree'

        ]
    }

    export def main [
      --quiet(-q)
      --verbose(-v)
      --recurse-submodules:string@get-recurse-submodules-completions
      --no-recurse-submodules
      --commit
      --no-commit
      --edit(-e)
      --no-edit
      --cleanup:string
      --ff-only
      --ff
      --no-ff
      --gpg-sign(-S):string
      --no-gpg-sign
      --signoff
      --no-signoff
      --stat
      --no-stat(-n)
      --squash
      --no-squash
      --verify
      --no-verify
      --strategy(-s):string@get-strategy-completions
      --strategy-option(-X):string
      --summary
      --no-summary
      --autostash
      --no-autostash
      --allow-unrelated-histories
      --rebase(-r):string@get-rebase-completions
      --no-rebase
      --all
      --no-all
      --append(-a)
      --atomic
      --depth:int
      --deepen:int
      --shallow-since:string
      --shallow-exclude:string
      --unshallow
      --update-shallow
      --negotiation-tip:string@get-negotiation-tip-completions
      --negotiate-only
      --dry-run
      --porcelain
      --force(-f)
      --keep(-k)
      --prefetch
      --prune(-p)
      --no-tags
      --refmap:string
      --tags(-t)
      --jobs(-j):int
      --set-upstream
      --upload-pack:string
      --progress
      --server-option(-o)
      --show-forced-updates
      --no-show-forced-updates
      --ipv4(-4)
      --ipv6(-6)
      repository?:string
      refspec?:string
    ] {


        let viable_bash_string_flags = generate_viable_bash_string_flags {
                quiet:$quiet
                verbose:$verbose
                recurse-submodules:$recurse_submodules
                no-recurse-submodules:$no_recurse_submodules
                commit:$commit
                no-commit:$no_commit
                edit:$edit
                no-edit:$no_edit
                cleanup:$cleanup
                ff-only:$ff_only
                ff:$ff
                no-ff:$no_ff
                gpg-sign:$gpg_sign
                no-gpg:$no_gpg_sign
                signoff:$signoff
                no-signoff:$no_signoff
                stat:$stat
                no-stat:$no_stat
                squash:$squash
                no-squash:$no_squash
                verify:$verify
                no-verify:$no_verify
                strategy:$strategy
                strategy-option:$strategy_option
                summary:$summary
                no-summary:$no_summary
                autostash:$autostash
                no-autostash:$no_autostash
                allow-unrelated-histories:$allow_unrelated_histories
                rebase:$rebase
                no-rebase:$no_rebase
                all:$all
                no-all:$no_all
                append:$append
                atomic:$atomic
                depth:$depth
                deepen:$deepen
                shallow-since:$shallow_since
                shallow-exclude:$shallow_exclude
                unshallow:$unshallow
                update-shallow:$update_shallow
                negotiation-tip:$negotiation_tip
                negotiate-only:$negotiate_only
                dry-run:$dry_run
                porcelain:$porcelain
                force:$force
                keep:$keep
                prefetch:$prefetch
                prune:$prune
                no-tags:$no_tags
                refmap:$refmap
                tags:$tags
                jobs:$jobs
                set-upstream:$set_upstream
                upload-pack:$upload_pack
                progress:$progress
                server-option:$server_option
                show-forced-updates:$show_forced_updates
                no-show-forced-updates:$no_show_forced_updates
                ipv4:$ipv4
                ipv6:$ipv6
            }

          match [($repository | describe) ($refspec | describe)] {

          [string string] => (bash_yadm pull $repository $refspec ...$viable_bash_string_flags)

          [string nothing] => (bash_yadm pull $repository ...$viable_bash_string_flags)

          _ => (bash_yadm pull ...$viable_bash_string_flags)

         }




    }
  }


  export module push {

  def get-signed-completions [] {
      ['true' 'false' 'if-asked']
  }

  def get-recurse-submodules-completions [] {
      ['check' 'on-demand' 'only' 'no']
  }


  export def main [
    --all
    --branches
    --prune
    --mirror
    --dry-run(-n)
    --porcelain
    --delete(-d)
    --tags
    --follow-tags
    --signed:string@get-signed-completions
    --no-signed
    --atomic
    --no-atomic
    --push-option:string
    --receive-pack
    --exec
    --force-with-lease:string
    --no-force-with-lease
    --force(-f)
    --force-if-includes
    --no-force-if-includes
    --repo:string
    --set-upstream(-u)
    --thin
    --quiet(-q)
    --verbose(-v)
    --progress
    --recurse-submodules:string@get-recurse-submodules-completions
    --no-recurse-submodules
    --verify
    --no-verify
    --ipv4(-4)
    --ipv6(-6)
    repository?:string
    refspec?:string
  ] {

      let viable_bash_string_flags = generate_viable_bash_string_flags {
              all:$all
              branches:$branches
              prune:$prune
              mirror:$mirror
              dry-run:$dry_run
              porcelain:$porcelain
              delete:$delete
              tags:$tags
              follow-tags:$follow_tags
              signed:$signed
              no-signed:$no_signed
              atomic:$atomic
              no-atomic:$no_atomic
              push-option:$push_option
              receive-pack:$receive_pack
              exec:$exec
              force-with-lease:$force_with_lease
              no-force-with-lease:$no_force_with_lease
              force:$force
              force-if-includes:$force_if_includes
              no-force-if-includes:$no_force_if_includes
              repo:$repo
              set-upstream:$set_upstream
              thin:$thin
              quiet:$quiet
              verbose:$verbose
              progress:$progress
              recurse-submodules:$recurse_submodules
              no-recurse-submodules:$no_recurse_submodules
              verify:$verify
              no-verify:$no_verify
              ipv4:$ipv4
              ipv6:$ipv6
      }

      match [($repository | describe) ($refspec | describe)] {

      [string string] => (bash yadm pull $repository $refspec ...$viable_bash_string_flags)

      [string nothing] => (bash yadm pull $repository ...$viable_bash_string_flags)

      _ =>  (bash_yadm push ...$viable_bash_string_flags)

      }


    }

  }


  export module rebase {


      def get-empty-completions [] {
          ['drop' 'keep' 'stop']
      }

      def get-rebase-merges-completions [] {
          ['rebase-cousins' 'no-rebase-cousins']
      }

      def get-strategy-completions [] {
          [
            'ort'
            'recursive'
            'resolve'
            'octopus'
            'ours'
            'subtree'
          ]
      }

     export def main [
      --continue
      --skip
      --abort
      --quit
      --edit-todo
      --show-current-patch
      --onto:string
      --keep-base
      --apply
      --empty:string@get-empty-completions
      --keep-empty
      --no-keep-empty
      --reapply-cherry-picks
      --no-reapply-cherry-picks
      --allow-empty-message
      --merge(-m)
      --strategy(-s):string@get-strategy-completions
      --strategy-option(-X):string
      --rerere-autoupdate
      --no-rerere-autoupdate
      --gpg-sign:string
      --no-gpg-sign
      --quiet(-q)
      --verbose(-v)
      --stat
      --no-stat
      --no-verify
      --verify
      -C:int
      --no-ff
      --force-rebase(-f)
      --fork-point
      --no-fork-point
      --ignore-whitespace
      --whitespace
      --committer-date-is-author-date
      --ignore-date
      --reset-author-date
      --signoff
      --interactive(-i)
      --rebase-merges
      --no-rebase-merges
      --exec(-x):string
      --root
      --autosquash
      --no-autosquash
      --autostash
      --no-autostash
      --reschedule-failed-exec
      --no-reschedule-failed-exec
      --update-refs
      --no-update-refs
      branch?:string
      start_point?:string
      end_point?:string
      ] {

        let viable_bash_string_flags = generate_viable_bash_string_flags {
            continue:$continue
            skip:$skip
            abort:$abort
            quit:$quit
            edit-todo:$edit_todo
            show-current-patch:$show_current_patch
            onto:$onto
            keep-base:$keep_base
            apply:$apply
            empty:$empty
            keep-empty:$keep_empty
            no-keep-empty:$no_keep_empty
            reapply-cherry-picks:$reapply_cherry_picks
            no-reapply-cherry-picks:$no_reapply_cherry_picks
            allow-empty-message:$allow_empty_message
            merge:$merge
            strategy:$strategy
            strategy-option:$strategy_option
            rerere-autoupdate:$rerere_autoupdate
            no-rerere-autoupdate:$no_rerere_autoupdate
            gpg-sign:$gpg_sign
            no-gpg-sign:$no_gpg_sign
            quiet:$quiet
            verbose:$verbose
            stat:$stat
            no-stat:$no_stat
            no-verify:$no_verify
            verify:$verify
            C:$C
            no-ff:$no_ff
            force-rebase:$force_rebase
            fork-point:$fork_point
            no-fork-point:$no_fork_point
            ignore-whitespace:$ignore_whitespace
            whitespace:$whitespace
            committer-date-is-author-date:$committer_date_is_author_date
            ignore-date:$ignore_date
            reset-author-date:$reset_author_date
            signoff:$signoff
            interactive:$interactive
            rebase-merges:$rebase_merges
            no-rebase-merges:$no_rebase_merges
            exec:$exec
            root:$root
            autosquash:$autosquash
            no-autosquash:$no_autosquash
            autostash:$autostash
            no-autostash:$no_autostash
            reschedule-failed-exec:$reschedule_failed_exec
            no-reschedule-failed-exec:$no_reschedule_failed_exec
            update-refs:$update_refs
            no-update-refs:$no_update_refs
         }


        match [($branch | describe) ($start_point | describe) ($end_point | describe)] {

          [string string string] => (
            bash_yadm rebase $branch $start_point $end_point ...$viable_bash_string_flags
            )

          [string string nothing] => (
            bash_yadm rebase $branch $start_point ...$viable_bash_string_flags
            )

          [string nothing nothing] => (
            bash_yadm rebase $branch ...$viable_bash_string_flags
            )

          _ => (bash_yadm rebase ...$viable_bash_string_flags)
        }


      }

  }


export module restore {

     def get-conflict-completions [] {
         ['merge' 'diff3' 'zdiff3']
     }

    export def main  [
      --source(-s):string
      --parch(-p)
      --worktree(-W)
      --staged(-S)
      --quiet(-q)
      --progress
      --no-progress
      --ours
      --theirs
      --merge(-m)
      --conflict:string@get-conflict-completions
      --ignore-unmerged
      --ignore-skip-worktree-bits
      --recurse-submodules
      --no-recurse-submodules
      --overlay
      --no-overlay
      --pathspec-from-file:string
      --pathspec-file-nul
      ...pathspecs:string
    ] {

          bash_yadm restore ...$pathspecs ...(
            generate_viable_bash_string_flags {
                  source:$source
                  parch:$parch
                  worktree:$worktree
                  staged:$staged
                  quiet:$quiet
                  progress:$progress
                  no-progress:$no_progress
                  ours:$ours
                  theirs:$theirs
                  merge:$merge
                  conflict:$conflict
                  ignore-unmerged:$ignore_unmerged
                  ignore-skip-worktree-bits:$ignore_skip_worktree_bits
                  recurse-submodules:$recurse_submodules
                  no-recurse-submodules:$no_recurse_submodules
                  overlay:$overlay
                  no-overlay:$no_overlay
                  pathspec-from-file:$pathspec_from_file
                  pathspec-file-nul:$pathspec_file_nul
            }
          )

    }

  }



  export def revert [
    --force(-f)
    --dry-run(-n)
    -r
    --cached
    --ignore-unmatch
    --sparse
    --quiet
    --pathspec-from-file:string
    --pathspec-file-nul
    ...pathspecs:string
  ] {

        bash_yadm revert ...$pathspecs ...(
          generate_viable_bash_string_flags {
            force:$force
            dry-run:$dry_run
            r:$r
            cached:$cached
            ignore-unmatch:$ignore_unmatch
            sparse:$sparse
            quiet:$quiet
            pathspec-from-file:$pathspec_from_file
            pathspec-file-nul:$pathspec_file_nul
          }
        )

  }


  export def rm [
    --force(-f)
    --dry-run(-n)
    -r
    --cached
    --ignore-unmatch
    --sparse
    --quiet
    --pathspec-from-file:string
    --pathspec-file-nul
    ...pathspecs:string
  ] {

        bash_yadm rm ...$pathspecs ...(
          generate_viable_bash_string_flags {
            force:$force
            dry-run:$dry_run
            r:$r
            cached:$cached
            ignore-unmatch:$ignore_unmatch
            sparse:$sparse
            quiet:$quiet
            pathspec-from-file:$pathspec_from_file
            pathspec-file-nul:$pathspec_file_nul
          }
        )

  }


  export module show {

    def get-pretty-completions [] {
        [
          'oneline'
          'short'
          'medium'
          'full'
          'fuller'
          'reference'
          'email'
          'mxboard'
          'raw'
        ]
  }


    export def main [
      --pretty:string@get-pretty-completions
      --format:string@get-pretty-completions
      --abbrev-commit
      --no-abbrev-commit
      --oneline
      --encoding:string
      --expand-tabs:int
      --no-expand-tabs
      --notes:string
      --no-notes
      --show-notes-by-default
      --show-notes:string
      --no-standard-notes
      --show-signature
      ...objects
    ] {

          bash_yadm show ...$objects ...(
            generate_viable_bash_string_flags {
              pretty:$pretty
              format:$format
              abbrev-commit:$abbrev_commit
              no-abbrev-commit:$no_abbrev_commit
              oneline:$oneline
              encoding:$encoding
              expand-tabs:$expand_tabs
              no-expand-tabs:$no_expand_tabs
              notes:$notes
              no-notes:$no_notes
              show-notes-by-default:$show_notes_by_default
              show-notes:$show_notes
              no-standard-notes:$no_standard_notes
              show-signature:$show_signature
            }
          )

    }

  }


  export module status {

   def get-ignore-submodules-completions [] {
      ['untracked' 'dirty' 'all']
   }

   def get-ignored-completions [] {
      ['trditional' 'no' 'matching']
   }

   export def main [
      --short(-s)
      --branch(-b)
      --show-stash
      --porcelain:string
      --long
      --verbose(-v)
      --untracked-files(-u)
      --ignore-submodules:string@get-ignore-submodules-completions
      --ignored:string@get-ignored-completions
      -z
      --column:string
      --no-column
      --ahead-behind
      --no-ahead-behind
      --renames
      --no-renames
      --find-renames:int
      ...pathspecs
    ] {

            bash_yadm status ...$pathspecs ...(
                generate_viable_bash_string_flags {
                  short:$short
                  branch:$branch
                  show-stash:$show_stash
                  porcelain:$porcelain
                  long:$long
                  verbose:$verbose
                  untracked-files:$untracked_files
                  ignore-submodules:$ignore_submodules
                  ignored:$ignored
                  z:$z
                  column:$column
                  no-column:$no_column
                  ahead-behind:$ahead_behind
                  no-ahead-behind:$no_ahead_behind
                  renames:$renames
                  no-renames:$no_renames
                  find-renames:$find_renames
                }
            )
    }

  }


export module switch {

  def get-conflict-completions [] {
      ['merge' 'diff3' 'zdiff3']
  }

  def get-track-completions [] {
      ['direct' 'inherit']
  }

  export def main [
    --create(-c):string
    --force-create(-C):string
    --detach(-d)
    --guess
    --no-guess
    --force(-f)
    --discard-changes
    --merge(-m)
    --conflict:string@get-conflict-completions
    --quiet(-q)
    --progress
    --no-progress
    --track(-t):string@get-track-completions
    --no-track
    --orphan:string
    --ignore-other-worktrees
    --recurse-submodules
    --no-recurse-submodules
    branch?:string
  ] {

      let viable_bash_string_flags = generate_viable_bash_string_flags {
                  create:$create
                  force-create:$force_create
                  detach:$detach
                  guess:$guess
                  no-guess:$no_guess
                  force:$force
                  discard-changes:$discard_changes
                  merge:$merge
                  conflict:$conflict
                  quiet:$quiet
                  progress:$progress
                  no-progress:$no_progress
                  track:$track
                  no-track:$no_track
                  orphan:$orphan
                  ignore-other-worktrees:$ignore_other_worktrees
                  recurse-submodules:$recurse_submodules
                  no-recurse-submodules:$no_recurse_submodules
               }

      if ($branch | describe) != nothing {

        return (bash_yadm switch $branch ...$viable_bash_string_flags)

      }

      bash_yadm switch ...$viable_bash_string_flags


  }

}


export module tag {

  def get-color-completions [] {
      ['never' 'always' 'auto']
  }

  def get-cleanup-completions [] {
      ['strip' 'whitespace' 'verbatim']
  }

  export def main [
    --annotate(-a)
    --sign(-s)
    --no-sign
    --local-user(-u)
    --force(-f)
    --delete(-d)
    --verify(-v)
    --num:int
    --list(-l)
    --sort:string
    --color:string@get-color-completions
    --ignore-case(-i)
    --omit-empty
    --column:string
    --no-column
    --contains:string
    --no-contains:string
    --merged:string
    --no-merged:string
    --message(-m):string
    --file(-F):string
    --edit(-e)
    --cleanup:string@get-cleanup-completions
    --create-reflog
    --format:string
     tag?:string
     commit?:string
  ] {

    let viable_bash_string_flags = generate_viable_bash_string_flags {
          annotate:$annotate
          sign:$sign
          no-sign:$no_sign
          local-user:$local_user
          force:$force
          delete:$delete
          verify:$verify
          num:$num
          list:$list
          sort:$sort
          color:$color
          ignore-case:$ignore_case
          omit-empty:$omit_empty
          column:$column
          no-column:$no_column
          contains:$contains
          no-contains:$no_contains
          merged:$merged
          no-merged:$no_merged
          message:$message
          file:$file
          edit:$edit
          cleanup:$cleanup
          create-reflog:$create_reflog
          format:$format
    }

    match [($tag | describe) ($commit | describe) ] {

    [string string] => (bash_yadm tag $tag $commit ...$viable_bash_string_flags)

    [string nothing] => (bash_yadm tag $tag ...$viable_bash_string_flags)

    _ => (bash_yadm tag ...$viable_bash_string_flags)

    }

  }

}

export use git *
