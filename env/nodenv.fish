# Nodenv (if nodenv exists)
if type -q nodenv
    status --is-interactive; and source (nodenv init -|psub)
end
