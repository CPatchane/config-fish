#
### GLOBAL VARIABLES
#

# Colors for ls command
set -x LSCOLORS "Exfxcxdxbxegedabagacad"

# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR
set -x SUDO_EDITOR "rvim -u NONE"

## ENV

# Go
set -x GOPATH $HOME/Dev/go
set -x GOROOT /usr/local/opt/go/libexec
set -x PATH $GOPATH $PATH
set -x PATH $GOPATH/bin $PATH

# Nodenv
status --is-interactive; and source (nodenv init -|psub)

# Rbenv
status --is-interactive; and source (rbenv init -|psub)

#
### ALIAS
#
# Main
if [ -f $HOME/.config/fish/aliases/main.fish ]
    source $HOME/.config/fish/aliases/main.fish
end

# Private aliases (c.f. with servers address...)
## aliases/private.fish will be ignored by git (.gitignore)
if [ -f $HOME/.config/fish/aliases/private.fish ]
    source $HOME/.config/fish/aliases/private.fish
end

# Git
if [ -f $HOME/.config/fish/aliases/git.fish ]
    source $HOME/.config/fish/aliases/git.fish
end

#
### GIT PROMPT CONFIGURATION
# See the file /usr/local/share/fish/functions/__fish_git_prompt.fish
#
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showupstream 'yes'

set -l git_bg1 brblack
set -l git_bg2 grey
set -l dodger_blue '297EF2'
set __fish_git_prompt_color_branch yellow -b $git_bg1
set __fish_git_prompt_color_dirtystate $dodger_blue -b $git_bg2
set __fish_git_prompt_color_invalidstate red -b $git_bg2
set __fish_git_prompt_color_stagedstate $dodger_blue -b $git_bg2
set __fish_git_prompt_color_cleanstate $dodger_blue -b $git_bg2
set __fish_git_prompt_color_stashstate $dodger_blue -b $git_bg2
set __fish_git_prompt_color_upstream grey -b $git_bg1
set __fish_git_prompt_color_untrackedfiles $dodger_blue -b $git_bg2
set __fish_git_prompt_color grey -b $git_bg1

set __fish_git_prompt_char_cleanstate '  '
set __fish_git_prompt_char_dirtystate '  '
set __fish_git_prompt_char_invalidstate '  '
set __fish_git_prompt_char_stagedstate '  '
set __fish_git_prompt_char_stashstate '  '
set __fish_git_prompt_char_stateseparator ' '
set __fish_git_prompt_char_untrackedfiles '  '
set __fish_git_prompt_char_upstream_ahead '  '
set __fish_git_prompt_char_upstream_behind '  '
set __fish_git_prompt_char_upstream_diverged '  '
set __fish_git_prompt_char_upstream_equal '  '
set __fish_git_prompt_char_upstream_prefix ' '

#
### PROMPT
#

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0

# fish_prompt defined in ~/.config/fish/functions/fish_prompt.fish
