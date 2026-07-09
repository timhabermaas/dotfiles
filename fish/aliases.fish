alias s="git status"
alias c="git commit --verbose"
alias p="git add -p"
alias d="git diff"
alias pu="git push"

alias tf="terraform"

alias n="nvim ."

# Rerun a command you've recently executed
alias rr="eval (history | fzf)"
# The grep ignores the current branch (marked with *)
alias gc="git branch --sort=-committerdate | grep -v '^\*' | fzf | xargs git checkout"

alias gpl="git pull"
alias gph="git push"
