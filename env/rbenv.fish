# Rbenv (if rbenv exists)
if command -vq rbenv
    status --is-interactive; and source (rbenv init -|psub)
end
