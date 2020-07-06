# macOS-dotfiles

My dotfiles for macOS

## Usage

1. Generate new SSH keys and add them to GitHub account

    ```bash
    ssh-keygen
    cat ~/.ssh/id_rsa.pub | pbcopy
    ```

1. Install Homebrew and git:

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git
    ```

1. Clone this repository:

    ```bash
    mkdir -p ~/Projects
    git clone git@github.com:Factorization/macOS-dotfiles.git ~/Projects/dotfiles
    ```

1. Ensure you are signed in to the App Store.

1. Run the `~/Projects/dotfiles/bootstrap.sh` script.

# Customization

I strongly recommend you fork this repository and customize it to fit your need.

## Git

- The .gitconfig file includes my `[user]` config. Make sure to replace with your own username and email

# Contents

## Root (/)

- `bootstrap.sh` - Calls all of the `setup.sh` scripts in the sub directories. Then runs the `update_all.sh` script.

- `go_update.sh` - Runs the `goenv` setup script. See the `goenv` section below for more detail.

- `node_update.sh` - Runs the `node` setup script. see the `node` section below for more detail.

- `python_update.sh` - Runs the `pyenv` setup script and the `python` setup script. See the individual sections for more details.

- `ruby_update.sh` - Runs the `rbenv` setup script and the `ruby` setup script. See the individual sections for more details.

- `update_all.sh` - Runs fisher update, brew update, brew upgrade, brew cask upgrade, brew cleanup and the go, python, and ruby update scripts.

## Dock (dock/) - macOS Dock config

- `setup.sh` - Copies the `com.apple.dock.plist` to `~/Library/Preferences`. This setups up the configuration for the Dock.
    > **_NOTE_** Some apps will show up as question marks (`?`), this either means the app or the location to the app doesn't exist. You can try right-clicking the icon and selecting **Options > Show in Finder**.

- `com.apple.dock.plist` - Binary file that contains all of the Dock configuration. To read the file run:

    ```bash
    defaults read ./com.apple.dock.plist
    ```

## Fish (fish/) - Fish shell  (replaces Bash or ZSH)

- `setup.sh` - Symlinks all the `.fish` files to `~/.config/fish/`. Also, adds fish to `/etc/shells` and runs `chsh` (change shell) to set fish as the default shell.

- `config.fish` - Global fish configuration file.

- `fishfile` - All of the packages that fisher (the fish package manager) will install. Fisher is compatible with Oh My Fish! packages.

- `my_functions.fish` - Functions and alias I commonly use. This script is sourced in config.fish.

## Git (git/) - Version control tool

- `setup.sh` - Symlinks all the git files to `~/`.

- `.gitconfig` - Sets my Git configuration username and email. Also sets some core configuration and pull options.

- `.gitignore_global` - Contains my global gitignore configuration. This file is used in the `.gitconfig` file.

## Goenv (goenv/) - Version manager for Golang

- `setup.sh` - Installs the go versions listed in the goenv install file. Then sets the global go version to the version listed in goenv global file.

- `goenv global.list` - The go version that will be set as the global version.

- `goenv install --skip-existing.list` - The list of go versions to install.

## Iterm2 (iterm2/) - Terminal tool for macOS

- `setup.sh` - Symlinks the plist file to `~/.config/iterm2`. Then configures iterm2 to use this directory for its configuration.

- `com.googlecode.iterm2.plist` - My iterm2 configuration.

## macOS (macos/) - macOS configuration

- `setup.sh` - Executes a long list of commands to configure various macOS preferences.

## Node (node/) - Node.js

- `setup.sh` -

- `nvm install.list` -

## Packages (packages/) - Brew apps to install

- `setup.sh` -

- `Brewfile` -

## Pyenv (pyenv/) - Version manager for Python

- `setup.sh` -

- `pyenv global.list` -

- `pyenv install --skip-existing.list` -

## Python (python/) - Pip and Pipx scripts

- `setup.sh` -

- `pip install --upgrade.list` -

- `pipx install.list` -

- `vf install.list` -

## Rbenv (rbenv/) - Version manager for Ruby

- `setup.sh` -

- `rbenv global.list` -

- `rbenv install --skip-existing.list` -

## Ruby (ruby/) - Gem install

- `setup.sh` -

- `gem install.list` -

## Scripts (scripts/) - Helper functions for setup.sh scripts

- `functions.sh` -

## Terminal (terminal/) - macOS Terminal configuration

- `setup.sh` -

- `com.apple.Terminal.plist` -

## Vim (vim/) - VIM configuration

- `setup.sh` -

## Vscode (vscode/) - Microsoft VScode configuration

- `setup.sh` -

- `code --install-extension.list` -

- `settings.json` -
