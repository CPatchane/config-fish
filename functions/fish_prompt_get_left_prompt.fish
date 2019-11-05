function fish_prompt_get_left_prompt --description 'Get first line left prompt content'
    set -l cl_blue_1 '1C55A2'
    set -l cl_blue_2 '428CF1'
    set -l cl_blue_3 '78A8F2'
    set -l cl_black '000000'
    set_color white -b $cl_blue_1
    # If we are in a virtualenv, we display its name
    if set -q VIRTUAL_ENV; and set -q PYENV_VERSION
        printf '(%s)' $PYENV_VERSION
    end
    printf ' %s ' (whoami)
    set_color normal
    set_color $cl_blue_1 -b $cl_blue_2
    printf ''
    set_color $cl_black -b $cl_blue_2
    if [ (prompt_pwd) = '~' ]
        printf '  ~ '
        set_color $cl_blue_2 -b normal
        printf ''
    else if [ (prompt_pwd) = '/' ]
        printf '  / '
        set_color $cl_blue_2 -b normal
        printf ''
    else
        printf '  '
        set_color $cl_blue_2 -b $cl_blue_3
        printf ''
        set_color $cl_black -b $cl_blue_3
        printf ' %s ' (prompt_pwd)
        set_color $cl_blue_3 -b normal
        printf ''
    end
    set_color normal
end
