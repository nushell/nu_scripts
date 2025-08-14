# no-extended
extern "fzf" [

	...args
]

# no-extended
extern "fzf +x" [

	...args
]

# case-sensitive match
extern "fzf +i" [

	...args
]

# Do not sort the result
extern "fzf +s" [

	...args
]

# Disable multi-select
extern "fzf +m" [

	...args
]

# ripgrep->fzf->vim [QUERY]  https://junegunn.github.io/fzf/tips/ripgrep-integration/#wrap-up
export def rg-fzf-nvim [] {
    let RELOAD = 'rg --column --color=always --smart-case {q}'
    let OPENER = '
        if $env.FZF_SELECT_COUNT == 0 {
            nvim {1} +{2}     # No selection. Open the current line in Vim.
        } else {
            nvim +cw -q {+f}  # Build quickfix list for the selected items.
        }
    '
  ( fzf --disabled --ansi --multi
      --bind $"start:reload:($RELOAD)" --bind $"change:reload:($RELOAD)"
      --bind $"enter:become:($OPENER)" --bind $"ctrl-o:execute:($OPENER)"
      --bind 'ctrl-a:select-all,ctrl-d:deselect-all,ctrl-/:toggle-preview'
      --delimiter ':'
      --preview 'bat --style=full --color=always --highlight-line {2} {1}'
      --preview-window '~4,+{2}+4/3,<80(up)'
      --query "$*" )
}
# ripgrep->fzf->vim [QUERY]
export alias rfv = rg-fzf-nvim
