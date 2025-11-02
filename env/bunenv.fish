# Bunenv (if bunenv exists)
if command -vq bunenv
    if not string match -q '*bunenv*' $PATH
        status --is-interactive; and source (bunenv init -|psub)
    end
end
