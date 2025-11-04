# Bunenv (if bunenv exists)
if command -vq bunenv
    if not string match -q '*bunenv*' $PATH
        status --is-interactive; and bunenv init - &> /dev/null
    end
end
