# Rbenv (if rbenv exists)
if command -vq rbenv
    if not string match -q '*rbenv*' $PATH
        status --is-interactive; and source (rbenv init -|psub)
    end
end
