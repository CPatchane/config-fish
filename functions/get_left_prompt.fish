function get_left_prompt --description 'Get first line left prompt content'
    set -l color_1 '1C55A2'
    set -l color_2 '428CF1'
    set -l color_3 '78A8F2'
    set_color white -b $color_1
    printf ' %s ' (whoami)
    set_color normal
    set_color $color_1 -b $color_2
    printf ''
    set_color black -b $color_2
    if [ (prompt_pwd) = '~' ]
        printf '  ~ '
        set_color $color_2 -b normal
        printf ''
    else if [ (prompt_pwd) = '/' ]
        printf '  / '
        set_color $color_2 -b normal
        printf ''
    else
        printf '  '
        set_color $color_2 -b $color_3
        printf ''
        set_color black -b $color_3
        printf ' %s ' (prompt_pwd)
        set_color $color_3 -b normal
        printf ''
    end
    set_color normal
end
