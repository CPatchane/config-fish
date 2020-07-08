function fish_prompt_get_right_prompt --description 'Get right prompt content'
    # if git repository
    if git rev-parse --git-dir > /dev/null 2>&1
        set -l cl_gorse 'FFEB3B'
        set -l cl_empress '757575'
        set -l cl_black '000000'
        set_color $cl_gorse -b normal
        printf ''
        set_color $cl_black -b $cl_gorse
        printf '  '
        set_color $cl_empress -b $cl_gorse
        printf ''
        set_color normal -b $cl_empress
        printf ' %s' (fish_git_prompt '%s')
        set_color normal
    else
        printf ' '
    end
end
