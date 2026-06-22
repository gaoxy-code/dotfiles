# starship
eval "$(starship init zsh)"

# autosugestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#### fast syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh Completion
autoload -Uz compinit && compinit -C

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# Alias
alias typora="open -a Typora"
alias ghostty="open -a Ghostty"
alias lg="lazygit"
alias ll="ls -alF"

# ローカル固有の設定を読み込む（存在する場合のみ）
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.localexport PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
