fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
