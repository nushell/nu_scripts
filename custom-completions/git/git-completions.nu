# nu-version: 0.116.1
#
# Completions for git and every git alias in your config. One `git` extern with no declared flags
# hands the whole command line to `nu-complete git`, which
#   - skips global options (and completes in the repository `-C`/`--git-dir` point at),
#   - expands git aliases (`git co` completes like `git checkout`),
#   - reads a builtin's flags from its own `-h` output when you complete a word starting with `-`
#     (never for aliases or scripts, which could run anything; see GIT_NO_HELP),
#   - completes flag values, subcommands, branches, remotes, tags, commits, stashes, worktrees,
#     submodules, config keys and changed files.
# Declaring no flags means nushell passes every argument to git exactly as typed.

module git-completion-utils {
  export const GIT_SKIPABLE_FLAGS = ['-v', '--version', '-h', '--help', '-p', '--paginate', '-P', '--no-pager', '--no-replace-objects', '--bare']

  # Run git and return its stdout lines; empty when git fails (e.g. outside a repository),
  # so completers never print git's errors over the prompt. Stdin is empty so nothing waits on it.
  export def --wrapped git-lines [...args: string]: nothing -> list<string> {
    let result = try { '' | ^git ...$args | complete } catch { return [] }
    if $result.exit_code == 0 { $result.stdout | lines } else { [] }
  }

  # Helper function to append token if non-empty
  def append-non-empty [token: string]: list<string> -> list<string> {
    if ($token | is-empty) { $in } else { $in | append $token }
  }

  # Split a string to list of args, taking quotes into account.
  # Code is copied and modified from https://github.com/nushell/nushell/issues/14582#issuecomment-2542596272
  export def args-split []: string -> list<string> {
    # Define our states
    const STATE_NORMAL = 0
    const STATE_IN_SINGLE_QUOTE = 1
    const STATE_IN_DOUBLE_QUOTE = 2
    const STATE_ESCAPE = 3
    const WHITESPACES = [" " "\t" "\n" "\r"]

    # Initialize variables
    mut state = $STATE_NORMAL
    mut current_token = ""
    mut result: list<string> = []
    mut prev_state = $STATE_NORMAL

    # Process each character
    for char in ($in | split chars) {
      if $state == $STATE_ESCAPE {
        # Handle escaped character
        $current_token = $current_token + $char
        $state = $prev_state
      } else if $char == '\' {
        # Enter escape state
        $prev_state = $state
        $state = $STATE_ESCAPE
      } else if $state == $STATE_NORMAL {
        if $char == "'" {
          $state = $STATE_IN_SINGLE_QUOTE
        } else if $char == '"' {
          $state = $STATE_IN_DOUBLE_QUOTE
        } else if ($char in $WHITESPACES) {
          # Whitespace in normal state means token boundary
          $result = $result | append-non-empty $current_token
          $current_token = ""
        } else {
          $current_token = $current_token + $char
        }
      } else if $state == $STATE_IN_SINGLE_QUOTE {
        if $char == "'" {
          $state = $STATE_NORMAL
        } else {
          $current_token = $current_token + $char
        }
      } else if $state == $STATE_IN_DOUBLE_QUOTE {
        if $char == '"' {
          $state = $STATE_NORMAL
        } else {
          $current_token = $current_token + $char
        }
      }
    }
    # Handle the last token
    $result = $result | append-non-empty $current_token
    # Return the result
    $result
  }

  # Path of the current directory inside the repository (`sub/dir/`), or '' at its top.
  export def repo-prefix []: nothing -> string {
    git-lines rev-parse --show-prefix | get -o 0 | default ''
  }

  # Turn repository-root-relative paths into paths relative to the current directory.
  export def from-repo-root [prefix?: string]: list<string> -> list<string> {
    let paths = $in
    let prefix = if $prefix == null { repo-prefix } else { $prefix }
    if ($prefix | is-empty) { return $paths }
    let up = $prefix | str trim --right --char '/' | split row '/' | each { '..' } | str join '/'
    $paths | each {|path| if ($path starts-with $prefix) { $path | str substring ($prefix | str length).. } else { $"($up)/($path)" } }
  }

  # Split `git status --porcelain=2 -z` output into records. A renamed/copied entry owns the next
  # NUL field (its original pathname), which must not be read as a record of its own.
  def status-records [text: string]: nothing -> list<string> {
    $text
    | split row "\u{0}"
    | generate {|record, skip_old_name|
        if $skip_old_name {
          {next: false}
        } else {
          {out: $record, next: ($record starts-with '2 ')}
        }
      } false
  }

  # Porcelain v2 `-z` records of `git status`; pathnames are literal (quotes and newlines kept).
  # Each row: {xy: two status letters ('??' for untracked), path: repo-root-relative path}.
  export def status-entries [--untracked, --prefix: string]: nothing -> list<record<xy: string, path: string>> {
    let entries = status-parse (if $untracked { '--untracked-files=normal' } else { '--untracked-files=no' })
    if not $untracked { return $entries }
    # Untracked directories are collapsed (`sub/`); when that is the current directory, list
    # the files inside it instead.
    let prefix = if $prefix == null { repo-prefix } else { $prefix }
    if ($prefix | is-empty) or ($entries | where {|e| $e.xy == '??' and $e.path == $prefix } | is-empty) { return $entries }
    $entries | where path != $prefix | append (status-parse '--untracked-files=all' '--' '.' | where xy == '??')
  }

  def status-parse [...args: string]: nothing -> list<record<xy: string, path: string>> {
    let result = try { '' | ^git --no-optional-locks status --porcelain=2 -z ...$args | complete } catch { return [] }
    if $result.exit_code != 0 { return [] }
    status-records $result.stdout
    | each {|record|
        let match = match ($record | str substring 0..0) {
          '1' => ($record | parse --regex '(?s)^1 (?<xy>\S\S) (?:\S+ ){6}(?<path>.+)$')
          '2' => ($record | parse --regex '(?s)^2 (?<xy>\S\S) (?:\S+ ){7}(?<path>.+)$')
          'u' => ($record | parse --regex '(?s)^u (?<xy>\S\S) (?:\S+ ){8}(?<path>.+)$')
          '?' => ($record | parse --regex '(?s)^\? (?<path>.+)$' | insert xy '??')
          _ => []
        }
        $match | get -o 0
      }
    | compact
    | select xy path
  }

  # Ordinary changes use type 1; every unmerged XY state uses type u.
  def status-paths [--include-unmerged]: nothing -> list<string> {
    let pattern = if $include_unmerged {
      '(?s)^(?:1 [.MD]{2} (?:\S+ ){6}|u (?:DD|AU|UD|UA|DU|AA|UU) (?:\S+ ){8})(?<value>.+)$'
    } else {
      '(?s)^1 [.MD]{2} (?:\S+ ){6}(?<value>.+)$'
    }
    let result = try { '' | ^git --no-optional-locks status -uno --porcelain=2 -z | complete } catch { return [] }
    if $result.exit_code != 0 { return [] }
    status-records $result.stdout | where not ($it starts-with '2 ') | parse --regex $pattern | get value
  }

  # Get changed files which can be restored by `git checkout --`.
  export def get-changed-files []: nothing -> list<string> { status-paths }

  # Include unmerged paths when checking out a tree or choosing a conflict side.
  export def get-checkoutable-files []: nothing -> list<string> { status-paths --include-unmerged }

  # Completion values are pasted as Nu source; display the literal path separately.
  export def format-checkout-files []: list<string> -> list<record<value: string, display_override: string, description: string, style: string>> {
    $in | each {|path| {value: ($path | to nuon), display_override: $path, description: File, style: green} }
  }

  # Describe a porcelain XY status pair for the completion menu.
  export def describe-status [xy: string]: nothing -> string {
    match $xy {
      '??' => 'Untracked'
      'DD' | 'AU' | 'UD' | 'UA' | 'DU' | 'AA' | 'UU' => 'Unmerged'
      _ => {
        let staged = match ($xy | str substring 0..0) {
          'M' => 'modified', 'T' => 'type changed', 'A' => 'added', 'D' => 'deleted', 'R' => 'renamed', 'C' => 'copied', _ => ''
        }
        let unstaged = match ($xy | str substring 1..1) {
          'M' => 'modified', 'T' => 'type changed', 'D' => 'deleted', 'A' => 'added', _ => ''
        }
        [(if ($staged | is-empty) { null } else { $"Staged ($staged)" }) (if ($unstaged | is-empty) { null } else { $"Unstaged ($unstaged)" })]
        | compact | str join ', '
      }
    }
  }

  # Completion rows for status entries, quoted as Nu source and relative to the current directory.
  export def format-status-files [prefix?: string]: list<record<xy: string, path: string>> -> list<record> {
    let entries = $in
    let paths = $entries | get path | from-repo-root $prefix
    $entries | zip $paths | each {|pair|
      {value: ($pair.1 | to nuon), display_override: $pair.1, description: (describe-status $pair.0.xy), style: green}
    }
  }

  export def get-all-git-local-refs []: nothing -> list<record<ref: string, obj: string, upstream: string, subject: string>> {
    git-lines for-each-ref '--format=%(refname:lstrip=2)%09%(objectname:short)%09%(upstream:remotename)%(upstream:track)%09%(contents:subject)' refs/heads | parse "{ref}\t{obj}\t{upstream}\t{subject}"
  }

  export def get-all-git-remote-refs []: nothing -> list<record<ref: string, obj: string, subject: string>> {
    git-lines for-each-ref '--format=%(refname:lstrip=2)%09%(objectname:short)%09%(contents:subject)' refs/remotes | parse "{ref}\t{obj}\t{subject}" | where ref !~ '/HEAD$'
  }

  # Get local branches, remote branches which can be passed to `git merge`
  export def get-mergable-sources []: nothing -> list<record<value: string, description: string>> {
    let local = get-all-git-local-refs | each {|x| {value: $x.ref description: $'Branch, Local, ($x.obj) ($x.subject), (if ($x.upstream | is-not-empty) { $x.upstream } else { "no upstream" } )'} } | insert style 'light_blue'
    let remote = get-all-git-remote-refs | each {|x| {value: $x.ref description: $'Branch, Remote, ($x.obj) ($x.subject)'} } | insert style 'blue_italic'
    $local | append $remote
  }

  # Branches, remote branches, tags and pseudo refs, for any argument naming a revision.
  export def get-refs []: nothing -> list<record<value: string, description: string>> {
    let refs = git-lines for-each-ref '--format=%(refname)%09%(objectname:short) %(contents:subject)' refs/heads refs/remotes refs/tags
    | parse "{ref}\t{subject}"
    | each {|row|
        let kind = if ($row.ref starts-with 'refs/heads/') { 'Branch' } else if ($row.ref starts-with 'refs/tags/') { 'Tag' } else { 'Remote branch' }
        {value: ($row.ref | str replace -r '^refs/(heads|tags|remotes)/' ''), description: $"($kind), ($row.subject)"}
      }
    | where value !~ '/HEAD$'
    $refs | append ([HEAD FETCH_HEAD ORIG_HEAD MERGE_HEAD] | each {|ref| {value: $ref, description: 'Pseudo ref'} })
  }

  # The most recent commits reachable from any branch, newest first.
  export def get-recent-commits [--limit: int = 300]: nothing -> list<record<value: string, description: string>> {
    git-lines log --branches --remotes --tags $'--max-count=($limit)' '--format=%h%x09%s'
    | parse "{value}\t{description}"
    | update description {|row| $"Commit, ($row.description)" }
  }

  # The first argument that names a configured remote, if any. `words` is `place.command`, whose
  # first element is the command name (e.g. "git pull").
  export def find-remote [words: list<string>]: nothing -> any {
    let remotes = git-lines remote
    $words | skip 1 | where {|word| $word in $remotes } | get -o 0
  }

  # One option spec as git prints it (`-F, --[no-]file <file>`, `--abbrev[=<n>]`) as records:
  # {short, long, neg, value: none|req|opt, ph}.
  export def parse-spec [spec: string]: nothing -> list<record> {
    # `-NUM`, `-<n>`: numeric shorthands such as `git log -5`.
    if ($spec =~ '^-(NUM|<)') { return [] }
    if ($spec | str contains ' | ') {
      return ($spec | split row ' | ' | each {|s| parse-spec ($s | str trim) } | flatten)
    }
    mut rest = $spec
    mut short: any = null
    mut long: any = null
    mut neg = false
    mut value = 'none'
    mut ph = ''
    if ($rest =~ '^-[^-]') {
      $short = ($rest | str substring 1..1)
      $rest = ($rest | str substring 2..)
      if ($rest | str starts-with ', ') {
        $rest = ($rest | str substring 2..)
      } else {
        # short-only option; the rest is its value spec
        if ($rest | is-not-empty) {
          $value = if ($rest | str starts-with '[') { 'opt' } else { 'req' }
          $ph = ($rest | str trim)
        }
        $rest = ''
      }
    }
    if ($rest | str starts-with '--') {
      if ($rest | str starts-with '--[no-]') {
        $neg = true
        $rest = '--' + ($rest | str substring 7..)
      }
      let m = $rest | parse --regex '^--(?<name>[A-Za-z0-9][A-Za-z0-9-]*)(?<tail>.*)$'
      if ($m | is-empty) { return [] }
      $long = $m.0.name
      let tail = $m.0.tail
      if ($tail | str starts-with '[=') {
        $value = 'opt'
      } else if ($tail | str starts-with '=') or ($tail | str starts-with ' ') {
        $value = 'req'
      } else if ($tail | is-not-empty) {
        $value = 'opt'
      }
      $ph = ($tail | str trim --left --char '=' | str trim)
    }
    let short = if $short != null and ($short =~ '^[A-Za-z0-9]$') { $short } else { null }
    if $short == null and $long == null { return [] }
    [{short: $short, long: $long, neg: $neg, value: $value, ph: $ph}]
  }

  # Options from git's parse-options `-h` output. Descriptions start at column 26, on the same
  # line or the next one.
  export def parse-help [text: string]: nothing -> list<record> {
    let lines = $text | lines
    let n = $lines | length
    mut out = []
    mut i = 0
    while $i < $n {
      let line = $lines | get $i
      if not ($line =~ '^ {2,}-') {
        $i += 1
        continue
      }
      let indent = ($line | str length) - ($line | str trim --left | str length)
      let next_line = $lines | get -o ($i + 1) | default ''
      let gap = $line | str substring 24..25
      # A one-space gap before column 26 also appears in long specs such as
      # `--[no-]color-moved-ws <mode>`, whose description is on the next line.
      let same_line = ($line | str length) > 26 and $indent == 4 and ($line | str substring 26..26) != ' ' and ($gap == '  ' or (($gap | str ends-with ' ') and not ($next_line =~ '^ {26}\S')))
      let parts = if $same_line {
        {spec: ($line | str substring ..25 | str trim), desc: ($line | str substring 26.. | str trim)}
      } else if ($line | str trim | str contains '  ') {
        # Legacy layouts (diff-tree's common diff options) separate with 2+ spaces.
        let cols = $line | str trim | split row -r '\s{2,}'
        {spec: $cols.0, desc: ($cols | skip 1 | str join ' ')}
      } else {
        {spec: ($line | str trim), desc: ''}
      }
      mut desc = $parts.desc
      mut j = $i + 1
      while $j < $n {
        let next = $lines | get $j
        let nindent = ($next | str length) - ($next | str trim --left | str length)
        if ($next | str trim | is-empty) or $nindent < 24 or ($next =~ '^ {2,}-' and $nindent < 26) { break }
        $desc = ($desc + ' ' + ($next | str trim) | str trim)
        $j += 1
      }
      let d = $desc
      $out = ($out | append (parse-spec $parts.spec | each {|o| $o | insert desc $d }))
      $i = $j
    }
    $out
  }
}

# Every command `git --list-cmds=main` knows. A word on the line that is not one of these is
# looked up as an alias.
const GIT_COMMANDS = [
  add am annotate apply archimport archive backfill bisect blame branch bugreport bundle
  cat-file check-attr check-ignore check-mailmap check-ref-format checkout checkout--worker checkout-index cherry cherry-pick clean clone
  column commit commit-graph commit-tree config count-objects credential credential-cache credential-cache--daemon credential-netrc credential-osxkeychain credential-store
  cvsexportcommit cvsimport cvsserver daemon describe diagnose diff diff-files diff-index diff-pairs diff-tree difftool
  difftool--helper fast-export fast-import fetch fetch-pack filter-branch fmt-merge-msg for-each-ref for-each-repo format-patch format-rev fsck
  fsck-objects fsmonitor--daemon gc get-tar-commit-id grep hash-object help history hook http-backend http-fetch http-push
  imap-send index-pack init init-db instaweb interpret-trailers jump last-modified log ls-files ls-remote ls-tree
  mailinfo mailsplit maintenance merge merge-base merge-file merge-index merge-octopus merge-one-file merge-ours merge-recursive merge-recursive-ours
  merge-recursive-theirs merge-resolve merge-subtree merge-tree mergetool mktag mktree multi-pack-index mv name-rev notes p4
  pack-objects pack-redundant pack-refs patch-id pickaxe prune prune-packed pull push quiltimport range-diff read-tree
  rebase receive-pack reflog refs remote remote-ext remote-fd remote-ftp remote-ftps remote-http remote-https repack
  replace replay repo request-pull rerere reset restore rev-list rev-parse revert rm send-email
  send-pack sh-i18n--envsubst shell shortlog show show-branch show-index show-ref sparse-checkout stage stash status
  stripspace submodule submodule--helper subtree switch symbolic-ref tag unpack-file unpack-objects update-index update-ref update-server-info
  upload-archive upload-archive--writer upload-pack url-parse var verify-commit verify-pack verify-tag version web--browse whatchanged worktree
  write-tree
]

# Builtins whose `-h` lists their options. Only these are ever run with `-h`: an alias or a
# script could do anything when invoked, and bisect/credential/rerere take subcommands that
# are not option parsers.
const GIT_BUILTINS = [
  add am annotate apply archive backfill blame branch bugreport bundle cat-file
  check-attr check-ignore check-mailmap check-ref-format checkout checkout-index cherry cherry-pick clean clone column commit
  commit-graph commit-tree config count-objects describe diagnose diff diff-files diff-index diff-pairs diff-tree
  difftool fast-export fast-import fetch fmt-merge-msg for-each-ref for-each-repo format-patch format-rev fsck fsck-objects gc
  grep hash-object help history hook init init-db interpret-trailers last-modified log ls-files ls-remote
  ls-tree maintenance merge merge-base merge-file merge-index merge-tree mktag mktree multi-pack-index mv name-rev
  notes pack-redundant pack-refs patch-id pickaxe prune prune-packed pull push range-diff read-tree rebase
  reflog refs remote repack replace replay repo reset restore rev-list rev-parse
  revert rm shortlog show show-branch show-ref sparse-checkout stage stash status stripspace switch
  symbolic-ref tag update-index update-ref update-server-info url-parse var verify-commit verify-pack verify-tag version whatchanged
  worktree write-tree
]

# Builtin subcommands that do not treat `-h` as a help request: `git stash create -h` writes a
# stash commit named "-h". The git tests run every other `-h` the completer can spawn and check
# that it prints usage and changes nothing.
const GIT_NO_HELP = ['stash create']

# Global options that take the next word as their value (`git -C <path> log`).
const GIT_GLOBAL_VALUED = [-C -c --git-dir --work-tree --namespace --config-env --attr-source]

# Commands that also take the revision options of `git log` / the diff options of `git diff`.
const GIT_WITH_REV = [log show whatchanged rev-list shortlog format-patch reflog "reflog show" last-modified fast-export "bisect visualize" "bisect view"]
const GIT_WITH_DIFF = [diff log show whatchanged format-patch diff-tree diff-index diff-files "stash show" reflog "reflog show" difftool "bisect visualize" "bisect view"]
# Their own `-h` is a legacy summary; the shared sets describe these options better.
const GIT_LEGACY_HELP = [rev-list diff-files diff-index diff-tree]

# Short options whose value is usually attached (`-Xtheirs`): offer `-X<value>` forms.
const GIT_STUCK_SHORTS = [X S G L I O]
# Revision options git only parses as `--opt=value`.
const GIT_EQ_ONLY = [format min-parents max-parents]
# Options documented as `--opt <commit>` whose value git lets you omit.
const GIT_LASTARG_DEFAULT = [contains no-contains with without merged no-merged points-at]

const GIT_PRETTY_FORMATS = [oneline short medium full fuller reference email raw mboxrd "format:" "tformat:"]
const GIT_DATE_FORMATS = [relative local iso iso8601 iso-strict iso8601-strict rfc rfc2822 short raw human unix default "format:" "format-local:"]
const GIT_CONFIG_TYPES = [bool int bool-or-int bool-or-str path expiry-date color]

# Values for options, by long name: an inline list, a completer kind (see `git-complete-kind`),
# `path` for nushell's own path completion, or a record keyed by command (`_` = any other).
const GIT_FLAG_VALUES = {
  onto: refs
  source: {restore: refs, checkout: refs, check-attr: refs, _: null}
  attr-source: refs
  set-upstream-to: upstreams
  contains: commits
  no-contains: commits
  with: commits
  without: commits
  merged: refs
  no-merged: refs
  points-at: refs
  strategy: {notes: [manual ours theirs union cat_sort_uniq], _: [ort recursive resolve octopus ours subtree]}
  strategy-option: [ours theirs ignore-space-change ignore-all-space ignore-space-at-eol ignore-cr-at-eol renormalize no-renormalize find-renames "find-renames=" "rename-threshold=" "subtree=" diff-algorithm=patience diff-algorithm=minimal diff-algorithm=histogram diff-algorithm=myers]
  cleanup: [strip whitespace verbatim scissors default]
  untracked-files: [no normal all]
  ignored: [traditional no matching]
  ignore-submodules: [none untracked dirty all]
  color: [always never auto]
  color-moved: [no default plain blocks zebra dimmed-zebra]
  color-moved-ws: [no ignore-space-at-eol ignore-space-change ignore-all-space allow-indentation-change]
  diff-algorithm: [default myers minimal patience histogram]
  word-diff: [color plain porcelain none]
  date: {commit: null, am: null, rebase: null, history: null, _: $GIT_DATE_FORMATS}
  pretty: $GIT_PRETTY_FORMATS
  format: {
    log: $GIT_PRETTY_FORMATS, show: $GIT_PRETTY_FORMATS, whatchanged: $GIT_PRETTY_FORMATS
    rev-list: $GIT_PRETTY_FORMATS, shortlog: $GIT_PRETTY_FORMATS, reflog: $GIT_PRETTY_FORMATS
    "reflog show": $GIT_PRETTY_FORMATS, format-rev: $GIT_PRETTY_FORMATS, format-patch: $GIT_PRETTY_FORMATS
    archive: [tar tgz tar.gz zip], "repo info": [lines nul], "repo structure": [table lines nul], _: null
  }
  decorate: [short full auto no]
  diff-merges: [off none on first-parent 1 separate m combined c dense-combined cc remerge r]
  recurse-submodules: {push: [check on-demand only no], fetch: [yes on-demand no], pull: [yes on-demand no], _: null}
  conflict: [merge diff3 zdiff3]
  rebase: {pull: [false true merges interactive], _: null}
  whitespace: [nowarn warn fix error error-all]
  empty: {rebase: [drop keep stop], cherry-pick: [drop keep stop], "history drop": [drop keep abort], "history fixup": [drop keep abort], _: null}
  rebase-merges: [rebase-cousins no-rebase-cousins]
  submodule: [short log diff]
  ws-error-highlight: [context old new all default none]
  column: [always never auto column row plain dense nodense]
  sort: [refname -refname committerdate -committerdate creatordate -creatordate authordate -authordate taggerdate -taggerdate version:refname -version:refname objectsize -objectsize objecttype upstream HEAD]
  type: {config: $GIT_CONFIG_TYPES, "config get": $GIT_CONFIG_TYPES, "config set": $GIT_CONFIG_TYPES, "config list": $GIT_CONFIG_TYPES, _: null}
  mirror: [fetch push]
  track: {"remote add": null, _: [direct inherit]}
  chmod: ["+x" "-x"]
  shared: [false true umask group all world everybody]
  object-format: [sha1 sha256]
  ref-format: [files reftable]
  filter: ["blob:none" "blob:limit=" "tree:0" "tree:1" "sparse:oid=" "object:type=blob" "object:type=tree" "combine:"]
  schedule: [hourly daily weekly]
  task: [gc commit-graph prefetch loose-objects incremental-repack pack-refs reflog-expire rerere-gc worktree-prune]
  scheduler: [auto crontab systemd-timer launchctl schtasks]
  tool: [araxis bc bc3 bc4 codecompare deltawalker diffmerge diffuse ecmerge emerge examdiff guiffy gvimdiff kdiff3 kompare meld nvimdiff opendiff p4merge smerge tkdiff tortoisemerge vimdiff vscode winmerge xxdiff]
  remote: {archive: remotes, _: null}
  repo: {push: remotes, _: null}
  author: {commit: null, _: authors}
  committer: authors
  fixup: commits
  squash: {commit: commits, _: null}
  reuse-message: commits
  reedit-message: commits
  template: {commit: path, clone: path, init: path, _: null}
  file: path
  output: path
  output-directory: path
  pathspec-from-file: path
  git-dir: path
  work-tree: path
  reference: path
  reference-if-able: path
  separate-git-dir: path
  to-stdin: path
  object-dir: path
  refs-snapshot: path
  exec-path: path
  base: {format-patch: refs, _: null}
  interdiff: refs
  range-diff: refs
  notes: notes-refs
  ref: {notes: notes-refs, _: null}
  negotiation-tip: refs
  shallow-exclude: refs
  find-object: refs
  ancestry-path: commits
  merge-base: {merge-tree: refs, _: null}
  signed: [true false if-asked]
  show-current-patch: [diff raw]
  patch-format: [mbox mboxrd stgit stgit-series hg]
  quoted-cr: [nowarn warn strip]
  update-refs: [branches head]
  exclude-hidden: [fetch receive uploadpack]
  disk-usage: [human]
  missing: [error allow-any allow-promisor print]
  confirm: [always never auto cc compose]
  suppress-cc: [author self cc bodycc sob cccmd body all]
  transfer-encoding: [7bit 8bit quoted-printable base64 auto]
  thread: [shallow deep]
  split: [no-merge replace]
  component: [protocol user password host port path]
  list-cmds: [main others alias nohelpers config parseopt]
  path-format: [absolute relative]
  show-object-format: [storage input output]
  abbrev-ref: [strict loose]
  output-object-format: [sha1 sha256]
  stdin-mode: [revs objects]
  no-walk: [sorted unsorted]
  mode: {column: [always never auto column row plain dense nodense], _: null}
  config: {clone: config-keys, _: null}
}
# Options of commands git cannot describe itself (scripts, non parse-options builtins) and the
# revision (@rev) and diff (@diff) options shared by log, show, diff, ... One option per line:
# command, short, long, value (none|req|opt), negatable (1 = also --no-<long>), placeholder, description.
const GIT_OPTIONS = r#'
	C		req		<path>	run as if git was started in <path>
	c		req		<name>=<value>	pass a configuration parameter to the command
		config-env	req		<name>=<envvar>	pass a configuration parameter from an environment variable
		exec-path	opt		[=<path>]	path to the core git programs, or print it
		html-path	none			print the path where git's HTML documentation is installed
		man-path	none			print the manpath for this version of git
		info-path	none			print the path where the Info files are installed
	p	paginate	none			pipe all output into less (or $PAGER)
	P	no-pager	none			do not pipe git output into a pager
		git-dir	req		<path>	set the path to the repository (".git" directory)
		work-tree	req		<path>	set the path to the working tree
		namespace	req		<path>	set the git namespace
		bare	none			treat the repository as a bare repository
		no-replace-objects	none			do not use replacement refs to replace git objects
		no-lazy-fetch	none			do not fetch missing objects from the promisor remote on demand
		no-optional-locks	none			do not perform optional operations that require locks
		no-advice	none			disable all advice hints from being printed
		literal-pathspecs	none			treat pathspecs literally
		glob-pathspecs	none			add "glob" magic to all pathspecs
		noglob-pathspecs	none			add "literal" magic to all pathspecs
		icase-pathspecs	none			add "icase" magic to all pathspecs
		list-cmds	req		<group>	list commands by group
		attr-source	req		<tree-ish>	read gitattributes from <tree-ish> instead of the worktree
	v	version	none			print the git suite version
bisect start		term-new	req		<term>	term for the new (bad) state
bisect start		term-bad	req		<term>	term for the bad (new) state
bisect start		term-old	req		<term>	term for the old (good) state
bisect start		term-good	req		<term>	term for the good (old) state
bisect start		no-checkout	none			do not checkout the new working tree at each iteration
bisect start		first-parent	none			follow only the first parent commit upon seeing a merge commit
bisect start		reset-when-found	opt		[=<where>]	reset the bisection when the first bad commit is found
bisect terms		term-good	none			show the term for the old state
bisect terms		term-old	none			show the term for the old state
bisect terms		term-bad	none			show the term for the new state
bisect terms		term-new	none			show the term for the new state
bisect run		reset-when-found	opt		[=<where>]	reset the bisection when the first bad commit is found
diff		cached	none			show changes staged for the next commit relative to <commit>
diff		staged	none			synonym for --cached
diff		merge-base	none			use the merge base of <commit> and HEAD instead of <commit>
diff		no-index	none			compare two paths on the filesystem
diff	1	base	none			compare the working tree with the base version
diff	2	ours	none			compare the working tree with our branch
diff	3	theirs	none			compare the working tree with their branch
diff	0		none			omit diff output for unmerged entries and just show "Unmerged"
mergetool	t	tool	req		<tool>	use the merge resolution program specified by <tool>
mergetool		tool-help	none			print a list of merge tools that may be used with --tool
mergetool	y	no-prompt	none			do not prompt before launching a merge resolution program
mergetool		prompt	none			prompt before each invocation of the merge resolution program
mergetool	g	gui	none			use the configured merge.guitool
mergetool		no-gui	none			use the configured merge.tool
mergetool	O		req		<orderfile>	process files in the order specified in <orderfile>
submodule	q	quiet	none			only print error messages
submodule		cached	none			use the commit stored in the index instead of the submodule HEAD
submodule add	b	branch	req		<branch>	branch of repository to add as submodule
submodule add	f	force	none			allow adding an otherwise ignored submodule path
submodule add		name	req		<name>	name of the new submodule
submodule add		reference	req		<repository>	reference repository
submodule add		depth	req		<depth>	create a shallow clone truncated to that many revisions
submodule add	q	quiet	none			only print error messages
submodule status		cached	none			use the commit stored in the index
submodule status		recursive	none			recurse into nested submodules
submodule status	q	quiet	none			only print error messages
submodule init	q	quiet	none			only print error messages
submodule deinit	f	force	none			unregister the submodule even if its working tree has local modifications
submodule deinit		all	none			unregister all submodules
submodule deinit	q	quiet	none			only print error messages
submodule update		init	none			initialize all submodules for which git submodule init has not been called
submodule update		filter	req		<filter-spec>	use a partial clone filter when cloning
submodule update		remote	none			use the status of the submodule's remote-tracking branch
submodule update	N	no-fetch	none			do not fetch new objects from the remote site
submodule update	f	force	none			throw away local changes in submodules when switching commits
submodule update		checkout	none			check out the superproject's recorded commit in a detached HEAD
submodule update		merge	none			merge the superproject's recorded commit into the submodule branch
submodule update		rebase	none			rebase the submodule branch onto the superproject's recorded commit
submodule update		recommend-shallow	none			use the shallow recommendation in .gitmodules
submodule update		no-recommend-shallow	none			ignore the shallow recommendation in .gitmodules
submodule update		reference	req		<repository>	reference repository
submodule update		dissociate	none			borrow objects from the reference repository only during the clone
submodule update		recursive	none			recurse into nested submodules
submodule update		depth	req		<depth>	create a shallow clone truncated to that many revisions
submodule update	j	jobs	req		<n>	number of submodules fetched at the same time
submodule update		single-branch	none			clone only one branch
submodule update		no-single-branch	none			clone all branches
submodule update		progress	none			force progress reporting
submodule update	q	quiet	none			only print error messages
submodule set-branch	d	default	none			remove the branch configuration and use the remote HEAD
submodule set-branch	b	branch	req		<branch>	branch to track
submodule set-branch	q	quiet	none			only print error messages
submodule set-url	q	quiet	none			only print error messages
submodule summary		cached	none			use the commit stored in the index
submodule summary		files	none			compare the commit in the index with the submodule HEAD
submodule summary	n	summary-limit	req		<n>	limit the summary size
submodule summary	q	quiet	none			only print error messages
submodule foreach		recursive	none			recurse into nested submodules
submodule foreach	q	quiet	none			only print error messages
submodule sync		recursive	none			recurse into nested submodules
submodule sync	q	quiet	none			only print error messages
submodule absorbgitdirs	q	quiet	none			only print error messages
request-pull	p		none			show patch text as well
jump		stdout	none			print the quickfix list to stdout instead of opening an editor
rev-parse		parseopt	none			use git rev-parse in option parsing mode
rev-parse		sq-quote	none			use git rev-parse in shell quoting mode
rev-parse		keep-dashdash	none			only meaningful in --parseopt mode
rev-parse		stop-at-non-option	none			only meaningful in --parseopt mode
rev-parse		stuck-long	none			only meaningful in --parseopt mode
rev-parse		revs-only	none			do not output flags and parameters not meant for rev-list
rev-parse		no-revs	none			do not output flags and parameters meant for rev-list
rev-parse		flags	none			do not output non-flag parameters
rev-parse		no-flags	none			do not output flag parameters
rev-parse		default	req		<arg>	use <arg> if there is no parameter given
rev-parse		prefix	req		<arg>	behave as if invoked from the <arg> subdirectory
rev-parse		verify	none			verify that exactly one parameter is given and it can be turned into a raw SHA-1
rev-parse	q	quiet	none			only meaningful in --verify mode; do not output an error message
rev-parse		sq	none			output a single line properly quoted for shell consumption
rev-parse		short	opt		[=<length>]	shorten the object name to a unique prefix
rev-parse		not	none			prefix object names with ^
rev-parse		abbrev-ref	opt		[=<mode>]	a non-ambiguous short name of the object's name
rev-parse		symbolic	none			output names in a form as close to the original input as possible
rev-parse		symbolic-full-name	none			like --symbolic, but omit input that are not refs
rev-parse		output-object-format	req		<format>	output object names in this hash format
rev-parse		all	none			show all refs found in refs/
rev-parse		branches	opt		[=<pattern>]	show all branches
rev-parse		tags	opt		[=<pattern>]	show all tags
rev-parse		remotes	opt		[=<pattern>]	show all remote-tracking branches
rev-parse		glob	req		<pattern>	show all refs matching the shell glob pattern
rev-parse		exclude	req		<pattern>	do not include refs matching the pattern
rev-parse		exclude-hidden	req		<section>	do not include refs hidden by the given section
rev-parse		disambiguate	req		<prefix>	show every object whose name begins with the given prefix
rev-parse		local-env-vars	none			list the GIT_* environment variables that are local to the repository
rev-parse		path-format	req		<format>	control whether paths are absolute or relative
rev-parse		git-dir	none			show $GIT_DIR if defined, otherwise the path to the .git directory
rev-parse		git-common-dir	none			show $GIT_COMMON_DIR if defined, else $GIT_DIR
rev-parse		resolve-git-dir	req		<path>	check if <path> is a valid repository or a gitfile
rev-parse		git-path	req		<path>	resolve $GIT_DIR/<path> taking relocation variables into account
rev-parse		show-toplevel	none			show the absolute path of the top-level directory of the working tree
rev-parse		show-superproject-working-tree	none			show the root of the superproject's working tree
rev-parse		shared-index-path	none			show the path to the shared index file in split index mode
rev-parse		absolute-git-dir	none			like --git-dir, but the output is always canonicalized
rev-parse		is-inside-git-dir	none			print true if the cwd is below the repository directory
rev-parse		is-inside-work-tree	none			print true if the cwd is inside the work tree
rev-parse		is-bare-repository	none			print true if the repository is bare
rev-parse		is-shallow-repository	none			print true if the repository is shallow
rev-parse		show-cdup	none			show the path of the top-level directory relative to the cwd
rev-parse		show-prefix	none			show the path of the cwd relative to the top-level directory
rev-parse		show-object-format	opt		[=<which>]	show the object format (hash algorithm) used for the repository
rev-parse		show-ref-format	none			show the reference storage format used for the repository
rev-parse		since	req		<date>	parse the date and output the corresponding --max-age= parameter
rev-parse		after	req		<date>	parse the date and output the corresponding --max-age= parameter
rev-parse		until	req		<date>	parse the date and output the corresponding --min-age= parameter
rev-parse		before	req		<date>	parse the date and output the corresponding --min-age= parameter
filter-branch		setup	req		<command>	setup command run once before the loop
filter-branch		subdirectory-filter	req		<directory>	only look at the history which touches the given subdirectory
filter-branch		env-filter	req		<command>	filter for modifying the commit environment
filter-branch		tree-filter	req		<command>	filter for rewriting the tree and its contents
filter-branch		index-filter	req		<command>	filter for rewriting the index
filter-branch		parent-filter	req		<command>	filter for rewriting the commit's parent list
filter-branch		msg-filter	req		<command>	filter for rewriting the commit messages
filter-branch		commit-filter	req		<command>	filter for performing the commit
filter-branch		tag-name-filter	req		<command>	filter for rewriting tag names
filter-branch		original	req		<namespace>	namespace where the original commits will be stored
filter-branch	d		req		<directory>	use this temporary directory for rewriting
filter-branch	f	force	none			start even if there is an existing temporary directory or backup
filter-branch		state-branch	req		<branch>	load and store the mapping from old to new objects in this branch
filter-branch		prune-empty	none			remove commits that become empty
rerere		rerere-autoupdate	none			register clean resolutions in index
instaweb	l	local	none	1		only bind on 127.0.0.1
instaweb	p	port	req	1	...	the port to bind to
instaweb	d	httpd	req	1	...	the command to launch
instaweb	b	browser	req	1	...	the browser to launch
instaweb	m	module-path	req	1	...	the module path (only needed for apache2)
instaweb		stop	none	1		stop the web server
instaweb		start	none	1		start the web server
instaweb		restart	none	1		restart the web server
subtree	q	quiet	none			quiet
subtree	d	debug	none			show debug messages
subtree	P	prefix	req	1	...	the name of the subdir to split out
subtree		annotate	req	1	...	add a prefix to commit message of new commits
subtree	b	branch	req		...	create a new branch from the split subtree
subtree		ignore-joins	none	1		ignore prior --rejoin commits
subtree		onto	req	1	...	try connecting new tree to an existing one
subtree		rejoin	none	1		merge the new branch back into HEAD
subtree		squash	none	1		merge subtree changes as a single commit
subtree	m	message	req		...	use the given message as the commit message for the merge commit
subtree	S	gpg-sign	opt	1	[=<key-id>]	GPG-sign commits. The keyid argument is optional and defaults to the committer identity
send-email		from	req		<str>	Email From:
send-email		to	req	1	<str>	Email To:
send-email		cc	req	1	<str>	Email Cc:
send-email		bcc	req	1	<str>	Email Bcc:
send-email		subject	req		<str>	Email "Subject:"
send-email		reply-to	req		<str>	Email "Reply-To:"
send-email		in-reply-to	req		<str>	Email "In-Reply-To:"
send-email		outlook-id-fix	none	1		The SMTP host is an Outlook server that munges the Message-ID; retrieve it from the server
send-email		xmailer	none	1		Add "X-Mailer:" header (default).
send-email		annotate	none	1		Review each patch that will be sent in an editor.
send-email		compose	none			Open an editor for introduction.
send-email		compose-encoding	req		<str>	Encoding to assume for introduction.
send-email		8bit-encoding	req		<str>	Encoding to assume 8bit mails if undeclared
send-email		transfer-encoding	req		<str>	Transfer encoding to use (quoted-printable, 8bit, base64)
send-email		mailmap	none	1		Use mailmap file to map all email addresses to canonical real names and email addresses
send-email		envelope-sender	req		<str>	Email envelope sender.
send-email		sendmail-cmd	req		<str>	Command to run to send email.
send-email		smtp-server	req		<str:int>	Outgoing SMTP server to use; the port is optional (default 'localhost')
send-email		smtp-server-option	req		<str>	Outgoing SMTP server option to use.
send-email		smtp-server-port	req		<int>	Outgoing SMTP server port.
send-email		smtp-user	req		<str>	Username for SMTP-AUTH.
send-email		smtp-pass	req		<str>	Password for SMTP-AUTH; not necessary.
send-email		smtp-encryption	req		<str>	tls or ssl; anything else disables.
send-email		smtp-ssl	none			Deprecated. Use `--smtp-encryption ssl`.
send-email		smtp-ssl-cert-path	req		<str>	Path to ca-certificates (either directory or file).
send-email		smtp-ssl-client-cert	req		<str>	Path to the client certificate file
send-email		smtp-ssl-client-key	req		<str>	Path to the private key file for the client certificate
send-email		smtp-domain	req		<str>	The domain name sent to HELO/EHLO handshake
send-email		smtp-auth	req		<str>	Space-separated list of allowed AUTH mechanisms, or "none" to disable authentication
send-email		no-smtp-auth	none			Disable SMTP authentication; shorthand for `--smtp-auth=none`
send-email		smtp-debug	req		<0|1>	Disable, enable Net::SMTP debug.
send-email		imap-sent-folder	req		<str>	IMAP folder where a copy of the emails should be sent.
send-email		use-imap-only	none	1		Only copy emails to the IMAP folder given by --imap-sent-folder instead of sending them
send-email		batch-size	req		<int>	send max <int> message per connection.
send-email		relogin-delay	req		<int>	delay <int> seconds between two successive login.
send-email		identity	req		<str>	Use the sendemail.<id> options.
send-email		to-cmd	req		<str>	Email To: via `<str> $patch_path`.
send-email		cc-cmd	req		<str>	Email Cc: via `<str> $patch_path`.
send-email		header-cmd	req		<str>	Add headers via `<str> $patch_path`.
send-email		no-header-cmd	none			Disable any header command in use.
send-email		suppress-cc	req		<str>	author, self, sob, cc, cccmd, body, bodycc, misc-by, all.
send-email		cc-cover	none	1		Email Cc: addresses in the cover letter.
send-email		to-cover	none	1		Email To: addresses in the cover letter.
send-email		signed-off-by-cc	none	1		Send to Signed-off-by: addresses. Default on.
send-email		suppress-from	none	1		Send to self. Default off.
send-email		chain-reply-to	none	1		Chain In-Reply-To: fields. Default off.
send-email		thread	none	1		Use In-Reply-To: field. Default on.
send-email		confirm	req		<str>	Confirm recipients before sending: auto, cc, compose, always or never
send-email		quiet	none			Output one line of info per email.
send-email		dry-run	none			Don't actually send the emails.
send-email		validate	none	1		Perform patch sanity checks. Default on.
send-email		format-patch	none	1		Understand any non-optional arguments as `git format-patch` ones
send-email		force	none			Send even if safety checks would prevent it.
send-email		dump-aliases	none			Dump configured aliases and exit.
send-email		translate-aliases	none			Translate aliases read from standard input using the configured alias files
@rev	n	max-count	req		<number>	limit the number of commits to output
@rev		skip	req		<number>	skip number commits before starting to show the output
@rev		since	req		<date>	show commits more recent than a specific date
@rev		after	req		<date>	show commits more recent than a specific date
@rev		since-as-filter	req		<date>	show all commits more recent than a specific date
@rev		until	req		<date>	show commits older than a specific date
@rev		before	req		<date>	show commits older than a specific date
@rev		max-age	req		<timestamp>	limit output to commits newer than a timestamp
@rev		min-age	req		<timestamp>	limit output to commits older than a timestamp
@rev		author	req		<pattern>	limit to commits whose author matches the pattern
@rev		committer	req		<pattern>	limit to commits whose committer matches the pattern
@rev		grep-reflog	req		<pattern>	limit to commits whose reflog message matches the pattern
@rev		grep	req		<pattern>	limit to commits whose log message matches the pattern
@rev		all-match	none			limit to commits that match all given --grep patterns
@rev		invert-grep	none			limit to commits whose log message does not match --grep
@rev	i	regexp-ignore-case	none			match the limiting patterns without regard to case
@rev		basic-regexp	none			treat the limiting patterns as basic regular expressions
@rev	E	extended-regexp	none			treat the limiting patterns as extended regular expressions
@rev	F	fixed-strings	none			treat the limiting patterns as fixed strings
@rev	P	perl-regexp	none			treat the limiting patterns as Perl-compatible regular expressions
@rev		remove-empty	none			stop when a given path disappears from the tree
@rev		merges	none			print only merge commits
@rev		no-merges	none			do not print commits with more than one parent
@rev		min-parents	req		<number>	show only commits with at least that many parents
@rev		max-parents	req		<number>	show only commits with at most that many parents
@rev		no-min-parents	none			reset the --min-parents limit
@rev		no-max-parents	none			reset the --max-parents limit
@rev		first-parent	none			follow only the first parent commit upon seeing a merge commit
@rev		exclude-first-parent-only	none			follow only the first parent when excluding commits
@rev		not	none			reverse the meaning of the ^ prefix for following revisions
@rev		all	none			pretend all refs in refs/ and HEAD are listed on the command line
@rev		branches	opt		[=<pattern>]	pretend all refs in refs/heads are listed
@rev		tags	opt		[=<pattern>]	pretend all refs in refs/tags are listed
@rev		remotes	opt		[=<pattern>]	pretend all refs in refs/remotes are listed
@rev		glob	req		<glob-pattern>	pretend all refs matching the shell glob are listed
@rev		exclude	req		<glob-pattern>	do not include refs matching the glob in the next --all/--branches/--tags/--remotes/--glob
@rev		exclude-hidden	req		<section>	do not include refs hidden by the given transfer section
@rev		reflog	none			pretend all objects mentioned by reflogs are listed
@rev		alternate-refs	none			pretend the tips of alternate repositories are listed
@rev		single-worktree	none			examine only the current worktree's HEAD, index and reflogs
@rev		ignore-missing	none			ignore invalid object names in the input
@rev		bisect	none			pretend the bad bisection ref and good refs are listed
@rev		stdin	none			read commits and pathspecs from standard input
@rev		cherry-mark	none			like --cherry-pick but mark equivalent commits with = instead of omitting them
@rev		cherry-pick	none			omit commits that introduce the same change as a commit on the other side
@rev		left-only	none			list only commits on the left side of a symmetric difference
@rev		right-only	none			list only commits on the right side of a symmetric difference
@rev		cherry	none			synonym for --right-only --cherry-mark --no-merges
@rev	g	walk-reflogs	none			walk reflog entries instead of the commit ancestry chain
@rev		merge	none			show commits touching conflicted paths in the range HEAD...<other>
@rev		boundary	none			output excluded boundary commits
@rev		simplify-by-decoration	none			show only commits referred to by some branch or tag
@rev		show-pulls	none			include merges that are not TREESAME to the first parent
@rev		full-history	none			do not prune history when simplifying by path
@rev		dense	none			show only commits that touch the given paths (default)
@rev		sparse	none			show all walked commits
@rev		simplify-merges	none			remove needless merges from the --full-history result
@rev		ancestry-path	opt		[=<commit>]	show only commits that are ancestors or descendants of the given commit
@rev		date-order	none			show no parents before all children, in commit timestamp order
@rev		author-date-order	none			show no parents before all children, in author timestamp order
@rev		topo-order	none			show no parents before all children, avoiding interleaved histories
@rev		reverse	none			output the selected commits in reverse order
@rev		no-walk	opt		[=<mode>]	only show the given commits, do not traverse their ancestors
@rev		do-walk	none			override a previous --no-walk
@rev		pretty	opt		[=<format>]	pretty-print the commit logs in the given format
@rev		format	req		<format>	pretty-print the commit logs in the given format
@rev		abbrev	opt		[=<n>]	show object names with at least <n> hexdigits
@rev		no-abbrev	none			show full object names
@rev		abbrev-commit	none			show a prefix of the commit object name
@rev		no-abbrev-commit	none			show the full commit object name
@rev		oneline	none			shorthand for --pretty=oneline --abbrev-commit
@rev		encoding	req		<encoding>	re-code the commit log message in this encoding
@rev		expand-tabs	opt		[=<n>]	expand tabs in the log message
@rev		no-expand-tabs	none			do not expand tabs in the log message
@rev		notes	opt		[=<ref>]	show the notes that annotate the commit
@rev		no-notes	none			do not show notes
@rev		show-notes-by-default	none			show the default notes unless options for displaying specific notes are given
@rev		show-signature	none			check the validity of a signed commit object
@rev		relative-date	none			synonym for --date=relative
@rev		date	req		<format>	format for dates shown in human-readable form
@rev		parents	none			also print the parents of the commit
@rev		children	none			also print the children of the commit
@rev		left-right	none			mark which side of a symmetric difference a commit is reachable from
@rev		graph	none			draw a text-based graphical representation of the commit history
@rev		show-linear-break	opt		[=<barrier>]	put a barrier between two consecutive commits that are not linear
@rev	c		none			show combined diff format for merge commits
@rev		cc	none			show dense combined diff format for merge commits
@rev		dd	none			show diff relative to the first parent for merges and regular commits
@rev	m		none			show diffs for merge commits in the default format
@rev		diff-merges	req		<format>	specify the diff format to be used for merge commits
@rev		no-diff-merges	none			disable output of diffs for merge commits
@rev		combined-all-paths	none			show the name of the file from all parents in combined diffs
@rev	t		none			show the tree objects in the diff output
@rev		log-size	none			include a line with the log message length in bytes
@rev		follow	none			continue listing the history of a file beyond renames
@rev		count	none			print a number stating how many commits would have been listed
@diff	p	patch	none			generate patch
@diff	s	no-patch	none			suppress diff output
@diff	u		none			generate patch
@diff	U	unified	opt		[=<n>]	generate diffs with <n> lines context
@diff	W	function-context	none	1		show the whole function as context lines
@diff		raw	none			generate the diff in raw format
@diff		patch-with-raw	none			synonym for '-p --raw'
@diff		patch-with-stat	none			synonym for '-p --stat'
@diff		numstat	none			machine friendly --stat
@diff		shortstat	none			output only the last line of --stat
@diff	X	dirstat	opt		[=<param1>,<param2>...]	output the distribution of relative amount of changes for each sub-directory
@diff		cumulative	none			synonym for --dirstat=cumulative
@diff		dirstat-by-file	opt		[=<param1>,<param2>...]	synonym for --dirstat=files,<param1>,<param2>...
@diff		check	none			warn if changes introduce conflict markers or whitespace errors
@diff		summary	none			condensed summary such as creations, renames and mode changes
@diff		name-only	none			show only names of changed files
@diff		name-status	none			show only names and status of changed files
@diff		stat	opt		[=<width>[,<name-width>[,<count>]]]	generate diffstat
@diff		stat-width	req		<width>	generate diffstat with a given width
@diff		stat-name-width	req		<width>	generate diffstat with a given name width
@diff		stat-graph-width	req		<width>	generate diffstat with a given graph width
@diff		stat-count	req		<count>	generate diffstat with limited lines
@diff		compact-summary	none	1		generate compact summary in diffstat
@diff		binary	none			output a binary diff that can be applied
@diff		full-index	none	1		show full pre- and post-image object names on the "index" lines
@diff		color	opt	1	[=<when>]	show colored diff
@diff		ws-error-highlight	req		<kind>	highlight whitespace errors in the 'context', 'old' or 'new' lines in the diff
@diff	z		none			do not munge pathnames and use NULs as output field terminators in --raw or --numstat
@diff		abbrev	opt	1	[=<n>]	use <n> digits to display object names
@diff		src-prefix	req		<prefix>	show the given source prefix instead of "a/"
@diff		dst-prefix	req		<prefix>	show the given destination prefix instead of "b/"
@diff		line-prefix	req		<prefix>	prepend an additional prefix to every line of output
@diff		no-prefix	none			do not show any source or destination prefix
@diff		default-prefix	none			use default prefixes a/ and b/
@diff		inter-hunk-context	req		<n>	show context between diff hunks up to the specified number of lines
@diff		output-indicator-new	req		<char>	specify the character to indicate a new line instead of '+'
@diff		output-indicator-old	req		<char>	specify the character to indicate an old line instead of '-'
@diff		output-indicator-context	req		<char>	specify the character to indicate a context instead of ' '
@diff	B	break-rewrites	opt		[=<n>[/<m>]]	break complete rewrite changes into pairs of delete and create
@diff	M	find-renames	opt		[=<n>]	detect renames
@diff	D	irreversible-delete	none			omit the preimage for deletes
@diff	C	find-copies	opt		[=<n>]	detect copies
@diff		find-copies-harder	none	1		use unmodified files as source to find copies
@diff		no-renames	none			disable rename detection
@diff		rename-empty	none	1		use empty blobs as rename source
@diff		follow	none	1		continue listing the history of a file beyond renames
@diff	l		req		<n>	limit to cheap rename/copy detection if the number of rename/copy targets exceeds this value
@diff		minimal	none			produce the smallest possible diff
@diff	w	ignore-all-space	none			ignore whitespace when comparing lines
@diff	b	ignore-space-change	none			ignore changes in amount of whitespace
@diff		ignore-space-at-eol	none			ignore changes in whitespace at EOL
@diff		ignore-cr-at-eol	none			ignore carrier-return at the end of line
@diff		ignore-blank-lines	none			ignore changes whose lines are all blank
@diff	I	ignore-matching-lines	req	1	<regex>	ignore changes whose all lines match <regex>
@diff		indent-heuristic	none	1		heuristic to shift diff hunk boundaries for easy reading
@diff		patience	none			generate diff using the "patience diff" algorithm
@diff		histogram	none			generate diff using the "histogram diff" algorithm
@diff		diff-algorithm	req		<algorithm>	choose a diff algorithm
@diff		anchored	req		<text>	generate diff using the "anchored diff" algorithm
@diff		word-diff	opt		[=<mode>]	show word diff, using <mode> to delimit changed words
@diff		word-diff-regex	req		<regex>	use <regex> to decide what a word is
@diff		color-words	opt		[=<regex>]	equivalent to --word-diff=color --word-diff-regex=<regex>
@diff		color-moved	opt	1	[=<mode>]	moved lines of code are colored differently
@diff		color-moved-ws	req	1	<mode>	how white spaces are ignored in --color-moved
@diff		relative	opt	1	[=<prefix>]	when run from subdir, exclude changes outside and show relative paths
@diff	a	text	none	1		treat all files as text
@diff	R		none			swap two inputs, reverse the diff
@diff		exit-code	none	1		exit with 1 if there were differences, 0 otherwise
@diff		quiet	none	1		disable all output of the program
@diff		ext-diff	none	1		allow an external diff helper to be executed
@diff		textconv	none	1		run external text conversion filters when comparing binary files
@diff		ignore-submodules	opt		[=<when>]	ignore changes to submodules in the diff generation
@diff		submodule	opt		[=<format>]	specify how differences in submodules are shown
@diff		ita-invisible-in-index	none			hide 'git add -N' entries from the index
@diff		ita-visible-in-index	none			treat 'git add -N' entries as real in the index
@diff	S		req		<string>	look for differences that change the number of occurrences of the specified string
@diff	G		req		<regex>	look for differences that change the number of occurrences of the specified regex
@diff		pickaxe-all	none			show all changes in the changeset with -S or -G
@diff		pickaxe-regex	none			treat <string> in -S as extended POSIX regular expression
@diff	O		req		<file>	control the order in which files appear in the output
@diff		rotate-to	req		<path>	show the change in the specified path first
@diff		skip-to	req		<path>	skip the output to the specified path
@diff		find-object	req		<object-id>	look for differences that change the number of occurrences of the specified object
@diff		diff-filter	req		[(A|C|D|M|R|T|U|X|B)...[*]]	select files by diff type
@diff		max-depth	req		<depth>	maximum tree depth to recurse
@diff		output	req		<file>	output to a specific file
'#

const GIT_SUBCOMMANDS = r#'
stash list	List the stash entries that you currently have
stash show	Show the changes recorded in a stash entry
stash drop	Remove a single stash entry from the list of stash entries
stash pop	Remove a single stashed state and apply it on top of the working tree
stash apply	Like pop, but do not remove the state from the stash list
stash branch	Create and check out a new branch starting from a stash entry
stash push	Save local modifications to a new stash entry and roll them back to HEAD
stash save	Save local modifications to a new stash entry (deprecated, use push)
stash clear	Remove all the stash entries
stash create	Create a stash entry and return its object name without storing it
stash store	Store a stash entry created via git stash create
stash export	Export the stash entries as a chain of commits
stash import	Import stash entries from a chain of commits
remote add	Add a remote named <name> for the repository at <url>
remote rename	Rename the remote named <old> to <new>
remote remove	Remove the remote named <name>
remote rm	Remove the remote named <name>
remote set-head	Set or delete the default branch for the named remote
remote show	Give some information about the remote <name>
remote prune	Delete stale references associated with <name>
remote update	Fetch updates for remotes or remote groups
remote set-branches	Change the list of branches tracked by the named remote
remote get-url	Retrieve the URLs for a remote
remote set-url	Change URLs for the remote
worktree add	Create a worktree at <path> and checkout <commit-ish> into it
worktree list	List details of each worktree
worktree lock	Prevent a worktree from being pruned, moved or deleted
worktree move	Move a worktree to a new location
worktree prune	Prune worktree information in $GIT_DIR/worktrees
worktree remove	Remove a worktree
worktree repair	Repair worktree administrative files
worktree unlock	Unlock a worktree, allowing it to be pruned, moved or deleted
notes list	List the notes object for a given object, or all notes
notes add	Add notes for a given object
notes copy	Copy the notes for the first object onto the second object
notes append	Append new message(s) to an existing note
notes edit	Edit the notes for a given object
notes show	Show the notes for a given object
notes merge	Merge the given notes ref into the current notes ref
notes remove	Remove the notes for given objects
notes prune	Remove all notes for non-existing/unreachable objects
notes get-ref	Print the current notes ref
reflog show	Show the log of a reference
reflog list	List all references which have a reflog
reflog exists	Check whether a ref has a reflog
reflog write	Write a new entry to the reflog of a reference
reflog delete	Delete single entries from the reflog
reflog drop	Remove the reflog of the given references completely
reflog expire	Prune older reflog entries
config list	List all variables set in config file, along with their values
config get	Emit the value of the specified key
config set	Set value for one or more config options
config unset	Unset value for one or more config options
config rename-section	Rename the given section to a new name
config remove-section	Remove the given section from the configuration file
config edit	Open an editor to modify the specified config file
bundle create	Create a bundle file
bundle verify	Check that a bundle file is valid and will apply cleanly
bundle list-heads	List the references defined in the bundle
bundle unbundle	Store the objects in the bundle in the repository
commit-graph verify	Read the commit-graph file and verify its contents
commit-graph write	Write a commit-graph file
multi-pack-index write	Write a new multi-pack-index file
multi-pack-index compact	Compact a range of incremental multi-pack-index layers
multi-pack-index verify	Verify the contents of the multi-pack-index file
multi-pack-index expire	Delete pack-files that are tracked by the multi-pack-index but unused
multi-pack-index repack	Create a new pack-file containing objects in small pack-files
maintenance run	Run one or more maintenance tasks
maintenance start	Start running maintenance on the current repository
maintenance stop	Halt the background maintenance schedule
maintenance register	Add the current repository to the maintenance.repo config
maintenance unregister	Remove the current repository from background maintenance
maintenance is-needed	Check whether maintenance needs to be run
sparse-checkout init	Enable the sparse-checkout setting (deprecated)
sparse-checkout list	Describe the directories or patterns in the sparse-checkout file
sparse-checkout set	Enable sparse-checkout and write a set of patterns
sparse-checkout add	Add directories or patterns to the sparse-checkout
sparse-checkout reapply	Reapply the sparsity pattern rules to paths in the working tree
sparse-checkout disable	Disable sparse-checkout and restore the full working tree
sparse-checkout check-rules	Check whether sparsity rules match one or more paths
sparse-checkout clean	Remove files outside the sparse-checkout definition
hook run	Run the hook with the given name
hook list	List the commands configured for the given hook
refs migrate	Migrate ref store between different formats
refs verify	Verify reference database consistency
refs list	List references in the repository
refs exists	Check whether the given reference exists
refs optimize	Optimize references to improve repository performance
refs create	Create a reference
refs delete	Delete a reference
refs update	Update a reference
repo info	Retrieve metadata-related information about the repository
repo structure	Retrieve statistics about the repository structure
history drop	Drop a commit from the history
history fixup	Fix up a commit with the staged changes
history reword	Rewrite the commit message of a commit
history split	Split a commit into two
bisect start	Start a bisect session
bisect bad	Mark a revision as bad (containing the change)
bisect new	Mark a revision as new (containing the change)
bisect good	Mark revisions as good (before the change)
bisect old	Mark revisions as old (before the change)
bisect terms	Show the terms used for the current bisect session
bisect skip	Skip the current or the given revisions
bisect next	Find the next bisection commit to test
bisect reset	End the bisect session and return to the original or given commit
bisect visualize	Show the remaining suspects in a viewer
bisect view	Show the remaining suspects in a viewer
bisect replay	Replay a bisect log
bisect log	Show the bisect log
bisect run	Bisect automatically using a script
bisect help	Show a short usage summary
submodule add	Add the given repository as a submodule
submodule status	Show the status of the submodules
submodule init	Initialize the submodules recorded in the index
submodule deinit	Unregister the given submodules
submodule update	Update the registered submodules to match the superproject
submodule set-branch	Set the default remote tracking branch for the submodule
submodule set-url	Set the URL of the specified submodule
submodule summary	Show a commit summary between the given commit and the working tree/index
submodule foreach	Evaluate an arbitrary shell command in each checked out submodule
submodule sync	Synchronize submodules' remote URL configuration
submodule absorbgitdirs	Move the git directory of submodules into the superproject
subtree add	Create the <prefix> subtree by importing its contents
subtree merge	Merge recent changes up to <commit> into the <prefix> subtree
subtree split	Extract a new, synthetic project history from the <prefix> subtree
subtree pull	Fetch from <repository> and merge <ref> into the <prefix> subtree
subtree push	Split the <prefix> subtree and push it to <repository>
rerere clear	Reset the metadata used by rerere
rerere forget	Reset the conflict resolutions which rerere has recorded
rerere diff	Display diffs for the current state of the resolution
rerere status	Print paths with conflicts whose resolution rerere will record
rerere remaining	Print paths with conflicts that have not been autoresolved by rerere
rerere gc	Prune records of conflicted merges that occurred a long time ago
credential fill	Fill in missing credential fields
credential approve	Store a credential as good
credential reject	Erase a credential
credential capability	Announce the capabilities of git credential
'#

const GIT_POSITIONALS = r#'
	command?:git-command
add	...pathspec:add
stage	...pathspec:add
am	...mbox:paths
annotate	...args:paths-or-refs
apply	...patch:paths
archive	tree_ish?:refs ...path:paths
bisect	...args:none
bisect start	...rev:commits
bisect bad	rev?:commits
bisect new	rev?:commits
bisect good	...rev:commits
bisect old	...rev:commits
bisect skip	...rev:commits
bisect reset	commit?:commits
bisect replay	logfile:paths
bisect run	cmd:paths ...args:paths
bisect visualize	...args:refs-or-paths
bisect view	...args:refs-or-paths
blame	...args:paths-or-refs
branch	...args:branch
bundle create	file:paths ...rev:refs
bundle verify	file:paths
bundle list-heads	file:paths ...refname:full-refs
bundle unbundle	file:paths ...refname:full-refs
cat-file	...object:refs
check-attr	...pathname:paths
check-ignore	...pathname:paths
checkout	...targets:checkout
cherry	upstream?:mergeable head?:mergeable limit?:commits
cherry-pick	...commit:commits
clean	...pathspec:untracked
clone	repository?:none directory?:paths
commit	...pathspec:commit-files
commit-tree	tree:refs
config	name?:config-keys value?:none
config get	name:config-keys
config set	name:config-keys value:none
config unset	name:config-keys
config rename-section	old_name:config-sections new_name:none
config remove-section	name:config-sections
credential	...args:none
daemon	...directory:paths
describe	...commit_ish:refs
diff	...args:diff
diff-files	...path:paths
diff-index	tree_ish?:refs ...path:paths
diff-tree	tree_ish?:refs ...args:refs-or-paths
difftool	...args:diff
fast-export	...rev:refs
fetch	repository?:remotes ...refspec:remote-refs
filter-branch	...rev:refs
for-each-ref	...pattern:full-refs
format-patch	...revision:refs
fsck	...object:refs
grep	...args:paths-or-refs
hash-object	...file:paths
help	command?:help
history drop	commit:commits
history fixup	commit:commits
history reword	commit:commits
history split	commit:commits ...pathspec:paths
hook run	hook_name:hooks ...args:none
hook list	hook_name:hooks
init	directory?:paths
interpret-trailers	...file:paths
jump	mode?:jump-mode ...args:paths
last-modified	...args:refs-or-paths
log	...args:refs-or-paths
ls-files	...file:paths
ls-remote	repository?:remotes ...patterns:none
ls-tree	tree_ish:refs ...path:paths
merge	...commit:mergeable
merge-base	...commit:refs
merge-file	current:paths base:paths other:paths
merge-tree	...commit:refs
mergetool	...file:conflicted
mv	...source:paths
name-rev	...commit:refs
notes	...args:none
notes list	object?:refs
notes add	object?:refs
notes copy	from_object:refs to_object:refs
notes append	object?:refs
notes edit	object?:refs
notes show	object?:refs
notes merge	notes_ref?:notes-refs
notes remove	...object:refs
prune	...head:refs
pull	repository?:remotes ...refspec:remote-refs
push	remote?:remotes ...refs:push
range-diff	...range:refs
read-tree	...tree_ish:refs
rebase	upstream?:rebase branch?:branches
reflog	ref?:refs ...args:refs-or-paths
reflog show	ref?:refs ...args:refs-or-paths
reflog exists	ref:full-refs
reflog write	ref:full-refs old_oid:refs new_oid:refs message:none
reflog delete	...entry:reflog
reflog drop	...ref:full-refs
reflog expire	...ref:full-refs
refs exists	ref:full-refs
refs list	...pattern:full-refs
refs create	ref:full-refs new_value:refs
refs delete	ref:full-refs old_value?:refs
refs update	ref:full-refs new_value:refs old_value?:refs
remote	...args:none
remote add	name:none url:none
remote rename	old:remotes new:none
remote remove	name:remotes
remote rm	name:remotes
remote set-head	name:remotes branch?:remote-refs
remote show	...name:remotes
remote prune	...name:remotes
remote update	...group_or_remote:remotes
remote set-branches	name:remotes ...branch:remote-refs
remote get-url	name:remotes
remote set-url	name:remotes newurl:none oldurl?:none
replace	object?:refs replacement?:refs
replay	...revision_range:refs
repo info	...key:repo-keys
request-pull	start:refs url:none end?:refs
rerere forget	...pathspec:paths
reset	...targets:reset
restore	...pathspec:restore
rev-list	...commit:refs
rev-parse	...args:refs
revert	...commit:commits
rm	...pathspec:paths
send-email	...file:paths
shortlog	...revision_range:refs
show	...object:refs-or-paths
show-branch	...rev:refs
show-ref	...pattern:refs
sparse-checkout set	...dir:paths
sparse-checkout add	...dir:paths
stash	...pathspec:paths
stash show	stash?:stashes
stash drop	stash?:stashes
stash pop	stash?:stashes
stash apply	stash?:stashes
stash branch	branchname:none stash?:stashes
stash push	...pathspec:paths
stash save	message?:none
stash create	message?:none
stash store	commit:refs
stash export	...stash:stashes
stash import	commit:refs
status	...pathspec:paths
submodule	...args:none
submodule add	repository:none path?:paths
submodule status	...path:submodules
submodule init	...path:submodules
submodule deinit	...path:submodules
submodule update	...path:submodules
submodule set-branch	path:submodules
submodule set-url	path:submodules newurl:none
submodule summary	commit?:refs ...path:submodules
submodule foreach	command:none ...args:none
submodule sync	...path:submodules
submodule absorbgitdirs	...path:submodules
subtree add	repository_or_commit:remotes ref?:none
subtree merge	commit:refs
subtree split	commit?:refs
subtree pull	repository:remotes ref:none
subtree push	repository:remotes refspec:none
switch	branch?:switch start_point?:refs
symbolic-ref	name:full-refs ref?:full-refs
tag	...args:tag
update-index	...file:paths
update-ref	ref:full-refs new_value?:refs old_value?:refs
var	variable?:git-var
verify-commit	...commit:commits
verify-tag	...tag:tags
whatchanged	...args:refs-or-paths
worktree	...args:none
worktree add	path:paths commit_ish?:refs
worktree lock	worktree:worktrees
worktree move	worktree:worktrees new_path:paths
worktree remove	worktree:worktrees
worktree repair	...path:paths
worktree unlock	worktree:worktrees
'#

const GIT_DESC_FALLBACK = r#'
grep or	combine the surrounding patterns with OR (the default)
grep not	negate the following pattern
grep and	combine the surrounding patterns with AND
combined-all-paths	show the name of the file from all parents in combined diffs
rev-list quiet	do not print anything to standard output
rev-list objects	also print the IDs of objects referenced by the listed commits
rev-list objects-edge	like --objects, but also print the IDs of excluded commits
rev-list unpacked	only print objects that are not in packs
rev-list header	print the contents of the commit in raw format
rev-list object-names	print the names of objects found by --objects
rev-list z	separate commits and objects with NUL characters
rev-list bisect-vars	print variables ready to be eval'ed by the shell for bisection
rev-list bisect-all	output all commits between included and excluded commits, ordered by distance
'#

def "nu-complete git available upstream" [] {
  use git-completion-utils [git-lines]
  git-lines for-each-ref '--format=%(refname:short)' refs/heads refs/remotes
}

def "nu-complete git remotes" [] {
  use git-completion-utils [git-lines]
  git-lines remote --verbose
  | parse --regex '^(?<value>\S+)\s+(?<description>.+) \((?:fetch|push)\)$'
  | uniq-by value # Deduplicate where fetch and push remotes are the same
}

# Branches of the remote named earlier on the line (`git pull origin <tab>`).
def "nu-complete git remote refs" [place?: record] {
  use git-completion-utils [git-lines find-remote]
  let remote = find-remote ($place.command? | default [])
  if $remote == null { return (git-lines for-each-ref '--format=%(refname:short)' refs/heads) }
  let prefix = $'refs/remotes/($remote)/'
  git-lines for-each-ref '--format=%(refname)' $prefix
  | each {|ref| $ref | str replace $prefix '' }
  | where $it != 'HEAD'
}

# Yield local branches like `main`, `feature/typo_fix`
def "nu-complete git local branches" [] {
  use git-completion-utils [git-lines]
  git-lines for-each-ref '--format=%(refname:short)' refs/heads
}

# Yield local and remote branch names which can be passed to `git merge`
def "nu-complete git mergable sources" [] {
  use git-completion-utils [get-mergable-sources]
  {
    options: {
        case_sensitive: false,
        completion_algorithm: prefix,
        sort: false,
    },
    completions: (get-mergable-sources)
  }
}

# Any revision: branches, remote branches, tags and pseudo refs.
def "nu-complete git refs" [] {
  use git-completion-utils [get-refs]
  {options: {sort: false}, completions: (get-refs)}
}

# Revisions plus recent commits, for commands that usually take a single commit.
def "nu-complete git commits" [] {
  use git-completion-utils [get-refs get-recent-commits]
  {options: {sort: false}, completions: (get-refs | append (get-recent-commits))}
}

# Fully qualified ref names, for plumbing that wants `refs/heads/main` rather than `main`.
def "nu-complete git full refs" [] {
  use git-completion-utils [git-lines]
  ['HEAD'] | append (git-lines for-each-ref '--format=%(refname)')
}

# `git checkout` arguments. `words` are the arguments after `checkout`, ending with the word
# being completed.
def git-checkout-candidates [words: list<string>]: nothing -> any {
  use git-completion-utils [git-lines get-changed-files get-checkoutable-files format-checkout-files get-mergable-sources GIT_SKIPABLE_FLAGS]
  # Earlier arguments, without flags that do not change what comes next.
  let prev = $words | drop 1 | where ($it not-in $GIT_SKIPABLE_FLAGS)
  # Only paths after `--`; right after a leading `--` only changed files (about to be reset).
  if $prev.0? == '--' {
    return (get-changed-files | format-checkout-files)
  }
  if '--' in $prev {
    return (get-checkoutable-files | format-checkout-files)
  }
  # Past the first argument only paths follow, unless a new branch still takes a start point.
  if ($prev | is-not-empty) and ([-b -B --orphan] | all {|flag| $flag not-in $prev }) {
    return (get-checkoutable-files | format-checkout-files)
  }
  # The first argument can be local branches, remote branches, files and commits
  let branches = get-mergable-sources
  let files = get-checkoutable-files | format-checkout-files
  let commits = git-lines rev-list -n 400 --remotes --oneline | split column -n 2 ' ' value description | upsert description {|x| $'Commit, ($x.value) ($x.description)' } | insert style 'light_cyan_dimmed'
  {
    options: {
        case_sensitive: false,
        completion_algorithm: prefix,
        sort: false,
    },
    completions: [...$branches, ...$files, ...$commits]
  }
}

# The words of the command line in `buffer` up to the cursor, ending with the word being
# completed ('' after a space).
def git-buffer-words [buffer: string, place?: record]: nothing -> list<string> {
  use git-completion-utils [args-split]
  let preceding = $buffer | str substring ..($place.cursor? | default ($buffer | str length))
  let words = $preceding | args-split
  if ($preceding | is-empty) or ($preceding ends-with ' ') { $words | append '' } else { $words }
}

def "nu-complete git checkout" [buffer: string, place?: record] {
  git-checkout-candidates (git-buffer-words $buffer $place | skip 2)
}

def "nu-complete git stash-list" [] {
  use git-completion-utils [git-lines]
  git-lines stash list | parse "{value}: {description}"
}

def "nu-complete git tags" [] {
  use git-completion-utils [git-lines]
  git-lines tag --no-color
}

# Local branches, plus the named remote's branches as `:branch` (or bare after --delete).
# `words` are the arguments after `push`, ending with the word being completed.
def git-push-candidates [words: list<string>]: nothing -> list<string> {
  use git-completion-utils [git-lines]
  mut remote = ""
  mut option_value = ""
  mut after_separator = false
  mut deleting = false
  # Scan through refspecs too: Git accepts flags before or after the remote.
  for token in ($words | drop 1) {
    if ($option_value | is-not-empty) {
      if $option_value == '--repo' { $remote = $token }
      $option_value = ""
      continue
    }
    if not $after_separator {
      if $token == '--' {
        $after_separator = true
        continue
      }
      if $token in ['--delete' '-d'] {
        $deleting = true
        continue
      }
      if $token == '--no-delete' {
        $deleting = false
        continue
      }
      if $token == '--repo' {
        $option_value = $token
        continue
      }
      if $token starts-with '--repo=' {
        $remote = $token | str substring 7..
        continue
      }
      if $token in ['--exec' '--push-option' '-o' '--receive-pack' '--recurse-submodules'] {
        $option_value = $token
        continue
      }
      if $token starts-with '-' { continue }
    }
    if ($remote | is-empty) { $remote = $token }
  }

  let local_branches = git-lines for-each-ref '--format=%(refname:short)' refs/heads
  if ($remote | is-empty) {
    return $local_branches
  }

  # The trailing slash excludes similarly named remotes such as upstream2.
  let prefix = $'refs/remotes/($remote)/'
  let remote_branches = git-lines for-each-ref '--format=%(refname)' $prefix | each {|ref| $ref | str replace $prefix '' } | where $it != 'HEAD'
  if $deleting {
    return $remote_branches
  }
  $local_branches | append ($remote_branches | each { |branch| $":($branch)" })
}

def "nu-complete git push" [buffer: string, place: record] {
  let words = git-buffer-words $buffer $place
  let push_index = $words | enumerate | where item == push | get -o 0.index | default 1
  git-push-candidates ($words | skip ($push_index + 1))
}

# Changed and untracked files that `git add` would stage.
def "nu-complete git add" [] {
  use git-completion-utils [repo-prefix status-entries format-status-files]
  let prefix = repo-prefix
  status-entries --untracked --prefix $prefix | where {|e| ($e.xy | str substring 1..1) != '.' } | format-status-files $prefix
}

# Files with staged or unstaged changes, for `git commit <pathspec>`.
def "nu-complete git commit files" [] {
  use git-completion-utils [status-entries format-status-files]
  status-entries | format-status-files
}

# Untracked files and directories, for `git clean`.
def "nu-complete git untracked" [] {
  use git-completion-utils [repo-prefix status-entries format-status-files]
  let prefix = repo-prefix
  status-entries --untracked --prefix $prefix | where xy == '??' | format-status-files $prefix
}

# Paths with merge conflicts, for `git mergetool`.
def "nu-complete git conflicted" [] {
  use git-completion-utils [status-entries describe-status format-status-files]
  status-entries | where {|e| (describe-status $e.xy) == 'Unmerged' } | format-status-files
}

# `git restore` restores the worktree by default and the index with --staged.
def "nu-complete git restore" [place?: record] {
  use git-completion-utils [status-entries format-status-files]
  let words = $place.command? | default []
  let staged = ($words | any {|w| $w in ['--staged' '-S'] or ($w =~ '^-[^-]*S') })
  let worktree = ($words | any {|w| $w in ['--worktree' '-W'] })
  let column = if $staged and not $worktree { 0 } else { 1 }
  status-entries | where {|e| ($e.xy | str substring $column..$column) != '.' } | format-status-files
}

# `git diff`: changed files (staged ones with --cached/--staged) and revisions.
def "nu-complete git diff" [place?: record] {
  use git-completion-utils [status-entries format-status-files get-refs]
  let words = $place.command? | default []
  let column = if ($words | any {|w| $w in ['--cached' '--staged'] }) { 0 } else { 1 }
  let files = status-entries | where {|e| ($e.xy | str substring $column..$column) != '.' } | format-status-files
  if '--' in ($words | drop 1) { return $files }
  {options: {sort: false}, completions: ($files | append (get-refs))}
}

# `git reset`: a commit to reset to, or staged paths to unstage (only paths after `--`).
def "nu-complete git reset" [place?: record] {
  use git-completion-utils [status-entries format-status-files get-refs get-recent-commits]
  let staged = status-entries | where {|e| ($e.xy | str substring 0..0) not-in ['.' '?'] } | format-status-files
  if '--' in ($place.command? | default [] | drop 1) { return $staged }
  {options: {sort: false}, completions: (get-refs | append (get-recent-commits) | append $staged)}
}

# Revisions first; falls back to path completion after `--` or when no ref matches.
def "nu-complete git refs or paths" [token?: record, place?: record] {
  use git-completion-utils [get-refs]
  if '--' in ($place.command? | default [] | drop 1) { return null }
  let text = $token.text? | default '' | str lowercase
  let refs = get-refs
  if ($text | is-not-empty) and not ($refs | any {|r| $r.value | str lowercase | str starts-with $text }) { return null }
  {options: {sort: false}, completions: $refs}
}

# Paths first; offers revisions only when the typed prefix matches one.
def "nu-complete git paths or refs" [token?: record, place?: record] {
  use git-completion-utils [get-refs]
  let text = $token.text? | default '' | str lowercase
  if ($text | is-empty) or '--' in ($place.command? | default [] | drop 1) { return null }
  let refs = get-refs | where {|r| $r.value | str lowercase | str starts-with $text }
  if ($refs | is-empty) { null } else { $refs }
}

# `git branch`: branch names to delete/rename/configure, and a start point for a new branch.
def "nu-complete git branch" [place?: record] {
  use git-completion-utils [git-lines get-refs]
  let words = $place.command? | default []
  let flags = $words | where {|w| $w starts-with '-' }
  let remote = $flags | any {|f| $f in ['-r' '--remotes'] or ($f =~ '^-[^-]*r') }
  let manage = $flags | any {|f| $f in ['-d' '-D' '--delete' '-m' '-M' '--move' '-c' '-C' '--copy' '--edit-description' '--unset-upstream' '-u' '--set-upstream-to'] or ($f =~ '^-[^-]*[dDmMcC]') }
  let branches = if $remote {
    git-lines for-each-ref '--format=%(refname:lstrip=2)' refs/remotes | where $it !~ '/HEAD$'
  } else {
    git-lines for-each-ref '--format=%(refname:short)' refs/heads
  }
  let positionals = git-positional-words branch ($words | skip 1 | drop 1)
  if $manage or ($positionals | is-empty) { $branches } else { {options: {sort: false}, completions: (get-refs)} }
}

# `git tag`: existing tags (to delete/verify or overwrite), then a commit for a new tag.
def "nu-complete git tag" [place?: record] {
  use git-completion-utils [git-lines get-refs]
  let words = $place.command? | default []
  let manage = $words | any {|w| $w in ['-d' '--delete' '-v' '--verify'] }
  let positionals = git-positional-words tag ($words | skip 1 | drop 1)
  if $manage or ($positionals | is-empty) { git-lines tag --no-color } else { {options: {sort: false}, completions: (get-refs)} }
}

def "nu-complete git worktrees" [] {
  let result = try { '' | ^git worktree list --porcelain -z | complete } catch { return [] }
  if $result.exit_code != 0 { return [] }
  $result.stdout
  | split row "\u{0}\u{0}"
  | where {|block| $block starts-with 'worktree ' }
  | skip 1 # the main worktree cannot be locked, moved or removed
  | each {|block|
      let fields = $block | split row "\u{0}"
      let path = $fields.0 | str substring 9..
      let branch = $fields | where {|f| $f starts-with 'branch ' } | get -o 0 | default 'detached' | str replace 'branch refs/heads/' ''
      {value: ($path | to nuon), display_override: $path, description: $branch}
    }
}

def "nu-complete git submodules" [] {
  use git-completion-utils [git-lines from-repo-root]
  let root = git-lines rev-parse --show-toplevel | get -o 0
  if $root == null { return [] }
  git-lines config --file ($root | path join .gitmodules) --get-regexp '^submodule\..*\.path$'
  | parse --regex '^\S+ (?<path>.+)$'
  | get path
  | from-repo-root
  | each {|path| {value: ($path | to nuon), display_override: $path, description: Submodule} }
}

# Every config key git knows about, with the current value for keys that are set.
def "nu-complete git config keys" [] {
  use git-completion-utils [git-lines]
  let set = git-lines config list | parse --regex '^(?<value>[^=]+)(?:=(?<description>.*))?$' | uniq-by value
    | update description {|row| $row.description | default '' }
  let known = git-lines help --config-for-completion | where {|key| $key not-in $set.value } | each {|key| {value: $key, description: ''} }
  {options: {sort: false}, completions: ($set | append $known)}
}

def "nu-complete git config sections" [] {
  use git-completion-utils [git-lines]
  git-lines config list --name-only | each {|key| $key | str replace -r '\.[^.]+$' '' } | uniq
}

def "nu-complete git aliases" [] {
  use git-completion-utils [git-lines]
  git-lines config --get-regexp '^alias\.'
  | parse --regex '^alias\.(?<value>\S+) (?<description>.*)$'
}

# Commands and aliases for `git <tab>`.
def "nu-complete git subcommands" [] {
  use git-completion-utils [git-lines]
  # `git help -a` also lists concept guides ("User-facing ...", "Developer-facing ..."); skip them.
  git-lines help -a
  | reduce -f {guide: false, rows: []} {|line, acc|
      if not ($line starts-with ' ') {
        $acc | update guide ($line =~ '^(User|Developer)-facing')
      } else if $acc.guide or not ($line starts-with '   ') {
        $acc
      } else {
        $acc | update rows ($acc.rows | append $line)
      }
    }
  | get rows
  | parse -r '\s*(?P<value>[^ ]+)(?: \s*(?P<description>\S.*))?'
  | append (nu-complete git aliases)
  | append ($GIT_COMMANDS | where $it !~ '--' | each {|name| {value: $name, description: ''} })
  | uniq-by value
}

# Commands, aliases and concept guides for `git help`.
def "nu-complete git help" [] {
  use git-completion-utils [git-lines]
  let guides = git-lines help -g | where $it starts-with "   " | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
  nu-complete git subcommands | append $guides
}

def "nu-complete git notes refs" [] {
  use git-completion-utils [git-lines]
  git-lines for-each-ref '--format=%(refname)' refs/notes
}

def "nu-complete git reflog entries" [] {
  use git-completion-utils [git-lines]
  git-lines reflog --max-count=200 '--format=%gd%x09%gs' | parse "{value}\t{description}"
}

def "nu-complete git authors" [] {
  use git-completion-utils [git-lines]
  git-lines log --max-count=1000 '--format=%aN <%aE>'
  | uniq
  | each {|author| {value: ($author | to nuon), display_override: $author} }
}

# ---------------------------------------------------------------------------------------------
# Dispatch

# Completions for one kind of argument. `place.command` starts with the command (`git pull`)
# followed by its arguments; the last one is the word being completed.
def git-complete-kind [kind: string, token: record, place: record]: nothing -> any {
  use git-completion-utils [git-lines]
  match $kind {
    none => []
    paths => null
    add => (nu-complete git add)
    untracked => (nu-complete git untracked)
    commit-files => (nu-complete git commit files)
    restore => (nu-complete git restore $place)
    conflicted => (nu-complete git conflicted)
    diff => (nu-complete git diff $place)
    reset => (nu-complete git reset $place)
    refs => (nu-complete git refs)
    commits | rebase => (nu-complete git commits)
    branches => (nu-complete git local branches)
    upstreams => (nu-complete git available upstream)
    mergeable | switch => (nu-complete git mergable sources)
    tags => (nu-complete git tags)
    remotes => (nu-complete git remotes)
    remote-refs => (nu-complete git remote refs $place)
    stashes => (nu-complete git stash-list)
    worktrees => (nu-complete git worktrees)
    submodules => (nu-complete git submodules)
    config-keys => (nu-complete git config keys)
    config-sections => (nu-complete git config sections)
    help => (nu-complete git help)
    notes-refs => (nu-complete git notes refs)
    reflog => (nu-complete git reflog entries)
    full-refs => (nu-complete git full refs)
    refs-or-paths => (nu-complete git refs or paths $token $place)
    paths-or-refs => (nu-complete git paths or refs $token $place)
    branch => (nu-complete git branch $place)
    tag => (nu-complete git tag $place)
    authors => (nu-complete git authors)
    repo-keys => (git-lines repo info --keys)
    hooks => [
      applypatch-msg pre-applypatch post-applypatch pre-commit pre-merge-commit prepare-commit-msg
      commit-msg post-commit pre-rebase post-checkout post-merge pre-push pre-receive update
      proc-receive post-receive post-update reference-transaction push-to-checkout pre-auto-gc
      post-rewrite sendemail-validate fsmonitor-watchman p4-changelist p4-prepare-changelist
      p4-post-changelist p4-pre-submit post-index-change
    ]
    jump-mode => [diff merge grep ws]
    git-var => [
      GIT_AUTHOR_IDENT GIT_COMMITTER_IDENT GIT_EDITOR GIT_SEQUENCE_EDITOR GIT_PAGER
      GIT_DEFAULT_BRANCH GIT_SHELL_PATH GIT_ATTR_SYSTEM GIT_ATTR_GLOBAL GIT_CONFIG_SYSTEM
      GIT_CONFIG_GLOBAL
    ]
    checkout => (git-checkout-candidates ($place.command | skip 1 | each { git-unquote }))
    push => (git-push-candidates ($place.command | skip 1 | each { git-unquote }))
    _ => []
  }
}

# Options recorded in GIT_OPTIONS for `key` (`@rev` and `@diff` are the shared sets).
def git-table-opts [key: string]: nothing -> list<record> {
  let src = $key | str trim --left --char '@'
  $GIT_OPTIONS | lines | where {|line| $line starts-with $"($key)\t" }
  | split column "\t" key short long value neg ph desc
  | each {|r|
      {
        short: (if $r.short == '' { null } else { $r.short })
        long: (if $r.long == '' { null } else { $r.long })
        neg: ($r.neg == '1'), value: $r.value, ph: $r.ph, desc: $r.desc, src: $src
      }
    }
}

# `-h` output of a builtin, or nothing for anything else.
def git-help-text [...words: string]: nothing -> string {
  if $words.0 not-in $GIT_BUILTINS or ($words | str join ' ') in $GIT_NO_HELP { return '' }
  let result = try { '' | ^git ...$words -h | complete } catch { return '' }
  $result.stdout + $result.stderr
}

# Every option of `git <key>`: its own `-h` (or the hand-written table for scripts and commands
# without parse-options help) plus the shared revision and diff options.
def git-options [key: string]: nothing -> list<record> {
  use git-completion-utils [parse-help]
  let words = $key | split row ' '
  let hand = git-table-opts $key
  let own = if ($hand | is-not-empty) or $key == '' {
    $hand
  } else if $key == stash {
    parse-help (git-help-text stash push)
  } else if $key == config {
    parse-help (git-help-text config '--get')
  } else {
    parse-help (git-help-text ...$words)
  }
  let diff = if $key in $GIT_WITH_DIFF { git-table-opts '@diff' } else { [] }
  let rev = if $key in $GIT_WITH_REV { git-table-opts '@rev' } else { [] }
  let shared = $diff | append $rev
  let all = if $key in $GIT_LEGACY_HELP { $shared | append $own } else { $own | append $shared }
  let fallback = $GIT_DESC_FALLBACK | lines | where $it != '' | each { split row "\t" }
  $all
  | where {|o| $o.long != help and $o.short != h }
  | uniq-by long short
  | each {|o|
      if ($o.desc | is-not-empty) { return $o }
      let name = $o.long | default $o.short
      let found = $fallback | where {|f| $f.0 in [$"($key) ($name)" $name] } | get -o 0.1
      $o | update desc ($found | default '')
    }
}

# What completes the value of an option: a list, a completer kind, `path`, or null.
def git-value-source [key: string, opt: record]: nothing -> any {
  let spec = $GIT_FLAG_VALUES | get -o ($opt.long | default '')
  if ($spec | describe | str starts-with 'record') {
    # A null for this command means "no values", so look keys up instead of using `default`.
    let names = $spec | columns
    let parent = $key | split row ' ' | first
    return (if $key in $names { $spec | get $key } else if $parent in $names { $spec | get $parent } else { $spec | get -o _ })
  }
  if $spec != null { return $spec }
  if ($opt.ph =~ '(?i)file|path|dir') { 'path' } else { null }
}

# Completion rows for a value, each prefixed (`--color=`, `-X`) as typed.
def git-value-rows [source: any, token: record, place: record, prefix: string]: nothing -> any {
  let rows = if ($source | describe | str starts-with 'list') {
    $source | each {|v| {value: ($v | into string)} }
  } else if $source == path {
    return (if ($prefix | is-empty) { null } else { [] })
  } else if $source == null {
    return []
  } else {
    let out = git-complete-kind $source $token $place
    if $out == null { return null }
    let out = if ($out | describe | str starts-with 'record') { $out.completions } else { $out }
    $out | each {|row| if ($row | describe) == string { {value: $row} } else { $row } }
  }
  if ($prefix | is-empty) { return {options: {sort: false}, completions: $rows} }
  $rows | each {|row|
    let shown = $row.display_override? | default $row.value
    let full = $"($prefix)($shown)"
    if 'display_override' in $row { $row | update value ($full | to nuon) | update display_override $full } else { $row | update value $full }
  }
}

# Flag names (and `--flag=value` forms) for `git <key>`.
def git-flag-rows [key: string, opts: list<record>, token: record, place: record]: nothing -> any {
  let text = $token.text
  let eq = $text | parse --regex '^(?<flag>--[^=]+)=' | get -o 0.flag
  if $eq != null {
    let opt = $opts | where long == ($eq | str substring 2..) | get -o 0
    if $opt == null { return [] }
    return (git-value-rows (git-value-source $key $opt) $token $place $"($eq)=")
  }
  let negated = $text starts-with '--no'
  let rows = $opts | each {|o|
    let values = git-value-source $key $o
    let enum = if ($values | describe | str starts-with 'list') { $values | each { into string } } else { [] }
    let row = {|value| {value: $value, description: $o.desc} }
    let eq_only = $o.value == req and (($o.src? == rev and $o.long in $GIT_EQ_ONLY) or $key == '' and $o.long == list-cmds)
    let long = if $o.long == null { [] } else if $eq_only {
      [(do $row $"--($o.long)=")] | append ($enum | each {|v| do $row $"--($o.long)=($v)" })
    } else if $o.value == opt {
      [(do $row $"--($o.long)")] | append ($enum | each {|v| do $row $"--($o.long)=($v)" })
    } else {
      [(do $row $"--($o.long)")]
    }
    let stuck = $o.value == opt or ($o.value == req and $o.short in $GIT_STUCK_SHORTS)
    let short = if $o.short == null { [] } else {
      [(do $row $"-($o.short)")] | append (if $stuck { $enum | each {|v| do $row $"-($o.short)($v)" } } else { [] })
    }
    let negation = if $negated and $o.neg { [{value: $"--no-($o.long)", description: $"negate --($o.long)"}] } else { [] }
    $long | append $short | append $negation
  } | flatten
  $rows | uniq-by value
}

# The option a flag word refers to (`--strategy`, `-s`), if any.
def git-find-option [opts: list<record>, word: string]: nothing -> any {
  if ($word starts-with '--') { return ($opts | where long == ($word | str substring 2..) | get -o 0) }
  if ($word =~ '^-[A-Za-z0-9]$') { return ($opts | where short == ($word | str substring 1..) | get -o 0) }
  null
}

# Does this option take the following word as its value?
def git-takes-value [opt: any]: nothing -> bool {
  $opt != null and $opt.value == req and $opt.long not-in $GIT_LASTARG_DEFAULT
}

# Indices of the positional arguments in `args` (options and their values skipped; everything
# after `--` counts). `options` is the option list, or the command to read it for when needed.
def git-positional-indices [options: any, args: list<string>]: nothing -> list<int> {
  let has_options = $args | any {|word| ($word starts-with '-') and $word != '-' }
  let opts = if not $has_options { [] } else if ($options | describe) == string { git-options $options } else { $options }
  $args | enumerate | reduce -f {found: [], skip: false, dashes: false} {|it, acc|
    let word = $it.item
    if $acc.skip {
      $acc | update skip false
    } else if $acc.dashes or not ($word starts-with '-') or $word == '-' {
      $acc | update found ($acc.found | append $it.index)
    } else if $word == '--' {
      $acc | update dashes true
    } else {
      $acc | update skip (git-takes-value (git-find-option $opts $word))
    }
  } | get found
}

def git-positional-words [options: any, args: list<string>]: nothing -> list<string> {
  let indices = git-positional-indices $options $args
  $args | enumerate | where {|it| $it.index in $indices } | get item
}

# A word from `place.command` with its surrounding quotes removed (`"my dir"`).
def git-unquote []: string -> string {
  $in | str replace -r `^(["'])(.*)\1$` '$2'
}

# The words of an alias, with `!` shell aliases reduced to the git command they run (if any).
def git-alias-words [value: string]: nothing -> list<string> {
  use git-completion-utils [args-split]
  if not ($value starts-with '!') { return ($value | args-split) }
  let words = $value | str substring 1.. | args-split
  let start = $words | enumerate | where item == git | get -o 0.index
  if $start == null { return [] }
  $words | skip ($start + 1) | take until {|w| $w in [';' '&&' '||' '|' '}'] or ($w ends-with ';') }
  | where $it !~ '^\$'
}

# Replace a leading git alias with what it stands for (`co -b x` -> `checkout -b x`). Returns
# null for words that are neither a git command nor an alias of one.
def git-expand-alias [words: list<string>]: nothing -> any {
  use git-completion-utils [git-lines]
  mut words = $words
  for _ in 1..8 {
    if ($words.0 in $GIT_COMMANDS) { return $words }
    let value = git-lines config --get $"alias.($words.0)" | str join ' ' | str trim
    if ($value | is-empty) { return null }
    let expansion = git-alias-words $value
    if ($expansion | is-empty) { return null }
    $words = $expansion | append ($words | skip 1)
  }
  null
}

# Subcommands of `git <command>` (`stash` -> list, show, ...) with their descriptions.
def git-subcommand-rows [command: string]: nothing -> list<record<value: string, description: string>> {
  $GIT_SUBCOMMANDS | lines | where {|line| $line starts-with $"($command) " }
  | each {|line| let cols = $line | split row "\t"; {value: ($cols.0 | split row ' ' | get 1), description: $cols.1} }
}

# Complete `git <command> <args...>` (command already alias-expanded is fine too).
def git-complete-command [words: list<string>, token: record]: nothing -> any {
  let words = git-expand-alias $words
  if $words == null { return null }
  let command = $words.0
  mut key = $command
  mut args = $words | skip 1
  # A subcommand (`stash show`) is the first non-option argument, when there is one.
  let sub_rows = git-subcommand-rows $command
  let subs = $sub_rows.value? | default []
  if ($subs | is-not-empty) {
    let index = git-positional-indices $command ($args | drop 1) | get -o 0
    let first = if $index == null { null } else { {index: $index, item: ($args | get $index | git-unquote)} }
    if $first != null and $first.item in $subs {
      $key = $"($command) ($first.item)"
      $args = $args | drop nth $first.index
    } else if $first == null and not ($token.text starts-with '-') {
      let rows = if $command == config { $sub_rows | append (nu-complete git config keys).completions } else { $sub_rows }
      return {options: {sort: false}, completions: $rows}
    }
  }
  let key = $key
  let args = $args
  let place = {command: ([$"git ($key)"] | append $args)}
  let after_dashes = '--' in ($args | drop 1)
  if not $after_dashes and ($token.text starts-with '-') {
    return (git-flag-rows $key (git-options $key) $token $place)
  }
  # The value of the option just before the cursor.
  let prev = $args | drop 1 | last
  # Without a row, a command takes paths; a subcommand without one takes nothing.
  let fallback = if ($key | str contains ' ') { "\t...args:none" } else { "\t...args:paths" }
  let spec = $GIT_POSITIONALS | lines | where {|line| $line starts-with $"($key)\t" } | get -o 0 | default $fallback | split row "\t" | get 1
  let slots = $spec | split row ' ' | each {|s| let p = $s | split row ':'; {kind: $p.1, rest: ($p.0 starts-with '...')} }
  let needs_options = ($prev != null and ($prev starts-with '-') and $prev != '--' and not $after_dashes) or ($slots.kind | uniq | length) > 1
  let opts = if $needs_options { git-options $key } else { [] }
  if not $after_dashes and $prev != null and ($prev =~ '^-') {
    let opt = git-find-option $opts $prev
    if $opt != null and ($opt.value == req) {
      return (git-value-rows (git-value-source $key $opt) $token $place '')
    }
  }
  # Which positional slot the cursor is in, skipping options and their values.
  let index = if ($slots.kind | uniq | length) == 1 { 0 } else { git-positional-indices $opts ($args | drop 1) | length }
  let slot = $slots | get -o $index | default (if ($slots | last | get rest) { $slots | last } else { null })
  if $slot == null { return [] }
  git-complete-kind $slot.kind $token $place
}

# Completions for everything after `git`.
def "nu-complete git" [token: record, place: record] {
  let words = $place.command | skip 1
  let before = $words | drop 1
  # Global options come before the command; `-C`, `--git-dir` and `--work-tree` change which
  # repository the completers should look at.
  mut i = 0
  mut dirs = []
  mut env_vars = {}
  while $i < ($before | length) and (($before | get $i) starts-with '-') {
    let word = $before | get $i
    let pair = $word | parse --regex '^(?<name>--[^=]+)=(?<value>.*)$' | get -o 0
    let name = $pair.name? | default $word
    let value = if $pair != null { $pair.value } else if $word in $GIT_GLOBAL_VALUED { $before | get -o ($i + 1) } else { null }
    # `place.command` keeps quotes: `-C "my dir"`.
    let value = if $value == null { null } else { $value | git-unquote }
    # Its value is the word being completed: stay in the global options.
    if $pair == null and $word in $GIT_GLOBAL_VALUED and $value == null {
      $i = $before | length
      break
    }
    match $name {
      '-C' => { $dirs = $dirs | append $value }
      '--git-dir' => { $env_vars = $env_vars | upsert GIT_DIR $value }
      '--work-tree' => { $env_vars = $env_vars | upsert GIT_WORK_TREE $value }
      _ => {}
    }
    $i += if $pair == null and $word in $GIT_GLOBAL_VALUED { 2 } else { 1 }
  }
  let i = $i
  let dir = $dirs | reduce -f $env.PWD {|d, acc| $acc | path join ($d | str replace -r '^~(?=/|$)' $nu.home-dir) } | path expand
  let env_vars = $env_vars
  try {
    cd $dir
    with-env $env_vars {
      if $i < ($before | length) {
        git-complete-command ($before | skip $i | append ($words | last)) $token
      } else {
        # The cursor is on a global option, its value, or the command name.
        let prev = $before | last
        if $prev in [-C --git-dir --work-tree] { return null }
        if $prev == '-c' { return (nu-complete git config keys | get completions | update value {|row| $"($row.value)=" }) }
        if $prev == '--attr-source' { return (nu-complete git refs) }
        if $prev in $GIT_GLOBAL_VALUED { return [] }
        if ($token.text starts-with '-') { return (git-flag-rows '' (git-options '') $token {command: [git]}) }
        nu-complete git subcommands
      }
    }
  } catch { [] }
}

export extern "git" [
  ...args: external_arg@"nu-complete git"  # a git command or alias, and its arguments
]
