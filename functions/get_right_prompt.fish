function get_right_prompt --description 'Get right prompt content'
    # if git repository
    if git rev-parse --git-dir > /dev/null 2>&1
        set_color yellow -b normal
        printf ''
        set_color black -b yellow
        printf '  '
        set_color brblack -b yellow
        printf ''
        set_color normal -b brblack
        printf ' %s' (__fish_git_prompt '%s')
        set_color normal
    else
        printf ' '
    end
end
