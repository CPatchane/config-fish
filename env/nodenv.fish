# Nodenv (if nodenv exists)
if command -vq nodenv
    status --is-interactive; and source (nodenv init -|psub)
end
