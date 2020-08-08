# Nodenv (if nodenv exists)
if command -vq nodenv
    if not string match -q '*nodenv*' $PATH
        status --is-interactive; and source (nodenv init -|psub)
    end
end
