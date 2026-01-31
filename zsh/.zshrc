# PATH
eval $(/opt/homebrew/bin/brew shellenv)
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Zsh Completion
autoload -Uz compinit && compinit -C

# Options
setopt HIST_IGNORE_DUPS
setopt AUTO_CD
setopt CORRECT_ALL

# Alias
alias typora="open -a Typora"
alias lg="lazygit"
