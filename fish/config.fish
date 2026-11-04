if status is-interactive
    # Commands to run in interactive sessions can go here

    # Requires nix PATH to be correctly set up, so run it as late as possible.
    if command -q direnv
        direnv hook fish | source
    end
end

fish_add_path /opt/homebrew/bin

jj util completion fish | source
