# Pyenv (if pyenv exists) with virtualenv if pyenv-virtualenv plugin installed
if type -q pyenv
    status --is-interactive; and source (pyenv init -|psub)
    if which pyenv-virtualenv-init > /dev/null
        status --is-interactive; and source (pyenv virtualenv-init -|psub)
    end
end
