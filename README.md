# Fish configuration

My personal [fish](https://fishshell.com) prompt configuration. I personaly prefer it on a black background but it also fits with other backgrounds.

### Screenshots

<img width="949" alt="fish_prompt_white" src="https://user-images.githubusercontent.com/10224453/34644867-544fe49c-f33f-11e7-8206-2d7bc8114058.png">

<img width="949" alt="fish_prompt" src="https://user-images.githubusercontent.com/10224453/34644826-625a95b0-f33e-11e7-9d10-90415e2b2f51.png">

### Features

Mainly:

- Prompt using two lines
- Custom Git prompt using a [nerdfont](https://github.com/ryanoasis/nerd-fonts)
- Initialize a Node environment ([nodenv](https://github.com/nodenv/nodenv)) and a Ruby environment ([rbenv](https://github.com/rbenv/rbenv))
- Set Go environment variables
- Add custom aliases


The purpose of this configuration is for my personal usage only. I share it on Github to version it and it could help some people to set their own fish environment.

### How to use it? (macOS)

1) Install the [nerdfont](https://github.com/ryanoasis/nerd-fonts) of your choice and use it in your terminal. As the prompt will use some special characters from these fonts, you will need it if your want to have all icons.

2) Put all the config files and folders (this repository content) in your `~/.config/fish` folder. This latter should already be present if you've installed fish.

3) Install `nodenv` and `rbenv`. If you don't need/use these environments you can comment (or even remove) the related lines from the `config.fish` file:
    ```diff
    # Nodenv
    - status --is-interactive; and source (nodenv init -|psub)
    + # status --is-interactive; and source (nodenv init -|psub)
    # Rbenv
    - status --is-interactive; and source (rbenv init -|psub)
    + # status --is-interactive; and source (rbenv init -|psub)
    ```
4) If you don't need the `golang` environment, you can comment also (or even remove) the Go related lines from the `config.fish` file:
    ```diff
    # Go
    - set -x GOPATH $HOME/Dev/go
    - set -x GOROOT /usr/local/opt/go/libexec
    - set -x PATH $GOPATH $PATH
    - set -x PATH $GOPATH/bin $PATH
    + # set -x GOPATH $HOME/Dev/go
    + # set -x GOROOT /usr/local/opt/go/libexec
    + # set -x PATH $GOPATH $PATH
    + # set -x PATH $GOPATH/bin $PATH
    ```
