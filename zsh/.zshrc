# starship
eval "$(starship init zsh)"

# autosugestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
#### fast syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh Completion
autoload -Uz compinit && compinit -C

# Alias
alias typora="open -a Typora"
alias lg="lazygit"
