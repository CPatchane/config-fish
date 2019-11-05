function fish_prompt_visual_length --description\
    "Return visual length of string, i.e. without terminal escape sequences"
    # using perl
    # printf $argv | perl -pe 's/\x1b.*?[mGKH]//g' | wc -m
    # using fish string
    printf (string replace -ra '\x1b.*?[mGKH]' '' $argv) | wc -m
end
