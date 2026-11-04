# See https://direnv.net/docs/hook.html
if command -q direnv
    direnv hook fish | source
end
