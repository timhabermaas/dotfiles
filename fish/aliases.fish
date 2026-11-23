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
alias gc='git branch --sort=-committerdate --format="%(refname:short)" | grep -vxF -- "$(git branch --show-current)" | fzf | xargs git checkout'
# Switch to bookmark using jj
alias jc 'jj new (jj bookmark list --all-remotes --sort committer-date- -T \'if(remote != "git", name ++ if(remote, "@" ++ remote) ++ "\n")\' | fzf)'

alias gpl="git pull"
alias gph="git push"
