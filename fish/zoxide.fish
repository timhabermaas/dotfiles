zoxide init fish | source

function zi
    set dir (zoxide query -l | fzf)
    if test -n "$dir"
        z "$dir"
    end
end
