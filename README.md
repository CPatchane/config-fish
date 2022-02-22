# My [Fish](<[fish](https://fishshell.com)>) configuration

My personal [fish](https://fishshell.com) prompt configuration. I prefer it on a black background but it can fit with other background colors.

### Screenshots

<img width="949" alt="fish_prompt_white" src="https://user-images.githubusercontent.com/10224453/34644867-544fe49c-f33f-11e7-8206-2d7bc8114058.png">

<img width="949" alt="fish_prompt" src="https://user-images.githubusercontent.com/10224453/34644826-625a95b0-f33e-11e7-9d10-90415e2b2f51.png">

_Screenshots made using [iTerm2](https://iterm2.com/downloads.html) app (not from the OS X Terminal app)_

### Features

Mainly:

- Prompt using two lines
- Custom Git prompt using a [nerdfont](https://github.com/ryanoasis/nerd-fonts)
- Add custom aliases for git and some CLIs with private aliases
- Add some useful functions like `yupgrade` (see [`./functions` directory](./functions))
- Handle environment configuration when needed (see [the environments part](#environements))
- Handle private/local aliases, environment or configuration (see the [private/local configuration part](#private-local-configuration))

#### Environements

This configuration handle some environments if it found the related command (see [`./env` directory](./env)):
  - __[if `nodenv` installed]__ Initialize a Node environment using [nodenv](https://github.com/nodenv/nodenv)
  - __[if `rbenv` installed]__ Initialize a Ruby environment using [rbenv](https://github.com/rbenv/rbenv)
  - __[if `pyenv` installed]__ Initialize a Python environment using [pyenv](https://github.com/pyenv/pyenv) with virtualenv management ([pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv))
  - __[if `go` installed]__ Set [Go](https://golang.org/) environment variables
  - __[if `mysql@5.7` installed]__ Set environment variables and CLIs paths for mysql@5.7

> You can install all these packages if you use [brew](https://brew.sh) as a packages manager: `brew install nodenv rbenv go pyenv pyenv-virtualenv mysql@5.7`

#### Private / Local configurations

You can add private/local only configurations/environments/aliases if you need to. Just add a `private.fish` which will be ignored by `git` and won't be commited:
- in the root folder for a private fish configuration
- in the `env/` folder for a private environment set up
- in the `aliases/` folder for private aliases

### How to install it? (macOS)

1.  If it's not done yet, install `fish` using [brew](https://brew.sh) by doing `brew install fish`. Then run `fish` in your terminal to use the `fish` shell. This configuration need a recent fish version (v3.1+).

2.  Install the [nerdfont](https://github.com/ryanoasis/nerd-fonts) of your choice and use it in your terminal. As the prompt will use some special characters from these fonts, you will need it if you want to have all icons.

3.  Put all the config files and folders (this repository content) in your `~/.config/fish` folder. This latter should already be present if you've installed [`fish`](https://fishshell.com). You can also simply remove the original config folder and `git clone` like following:

    ```
    mv ~/.config/fish /tmp/
    git clone https://github.com/CPatchane/config-fish.git ~/.config/fish
    ```

4. Load your config by doing `source ~/.config/fish` (it should be run by default when opening a new shell with `fish`)
