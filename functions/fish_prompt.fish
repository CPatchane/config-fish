function fish_prompt --description 'Write out the prompt'
    set last_status $status

    # get prompts for the first line
    set -l left_prompt (fish_prompt_get_left_prompt)
    set -l right_prompt (fish_prompt_get_right_prompt)

    # spaces
    set -l left_length (fish_prompt_visual_length $left_prompt)
    set -l right_length (fish_prompt_visual_length $right_prompt)
    set -l spaces (math "$COLUMNS - $left_length - $right_length")

    # Display first line
    printf '\n'
    printf '%s' $left_prompt
    set_color -b normal
    printf "%-"$spaces"s" " "
    printf '%s' $right_prompt
    set_color normal

    # Display second line
    set -l color_cursor '8829F9'
    printf '\n'
    set_color white -b $color_cursor
    printf '  '
    set_color $color_cursor -b normal
    printf ' '
    set_color normal
end
