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
    > **_NOTE_** - Some apps will show up as question marks (`?`), this either means the app or the location to the app doesn't exist. You can try right-clicking the icon and selecting **Options > Show in Finder**.

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

## iTerm2 (iterm2/) - Terminal tool for macOS

- `setup.sh` - Symlinks the plist file to `~/.config/iterm2`. Then configures iterm2 to use this directory for its configuration.

- `com.googlecode.iterm2.plist` - My iterm2 configuration file.

## macOS (macos/) - macOS configuration

- `setup.sh` - Executes a long list of commands to configure various macOS preferences.

## Node (node/) - Node.js

- `setup.sh` - Installs the node versions listed in the fnm install file. Then sets the version to use to the version listed in the fnm use file. Lastly, it installs the npm pages globally listed in the npm install file.

- `fnm install.list` - The list of node versions to install.

- `fnm use.list` -

- `nvm install.list` - The list of npm packages to install.

## Packages (packages/) - Brew apps to install

- `setup.sh` - Installs the brew applications listed in the brewfile.

- `Brewfile` - The curated list of applications to install. It includes brew apps, brew cask apps and mac app store apps.

## Pyenv (pyenv/) - Version manager for Python

- `setup.sh` - Installs the python versions listed in the pyenv install file. Then sets the global python version to the version listed in the pyenv global file.

- `pyenv global.list` - The python version that will be set as the global version.

- `pyenv install --skip-existing.list` - The list of python versions to install.

## Python (python/) - Pip and Pipx scripts

- `setup.sh` - Creates the directory for all virtual environments. Installs the python pip packages listed in the pip install file. Installs the python pipx packages listed in the pipx install file. Re-installs all the pipx packages incase a new version of python has been configured. Sets up virtual fish (a python virtual environment tool for the fish shell). Adds pipx and poetry tab completion to fish shell.

- `pip install --upgrade.list` - The list of pip packages to install.

- `pipx install.list` - The list of pipx packages to install. Pipx is a tool to run python pip packages that have standalone applications.

- `vf install.list` - The commands for virtual fish install and plugins to configure. Virtual fish is a python virtual environment manager for fish shell.

## Rbenv (rbenv/) - Version manager for Ruby

- `setup.sh` - Installs the ruby versions listed in the rbenv install file. Then sets the global ruby version to the version listed in the rbenv global file.

- `rbenv global.list` - The ruby version that will be set as the global version.

- `rbenv install --skip-existing.list` - The list of ruby versions to install.

## Ruby (ruby/) - Gem install

- `setup.sh` - Installs the ruby gems listed in the gem install file. Also, runs update gems.

- `gem install.list` - The list of ruby gems to install.

## Scripts (scripts/) - Helper functions for `setup.sh` scripts

- `functions.sh` - Helper functions for the various shell scripts in this repo.

## Terminal (terminal/) - macOS Terminal configuration

- `setup.sh` - Copies the `com.apple.Terminal.plist` preference file to `~/Library/preferences/`.

- `com.apple.Terminal.plist` - The terminal preferences to use.

## Vim (vim/) - VIM configuration

- `setup.sh` - Installs and configures the ultimate VIM config.

## VS Code (vscode/) - Microsoft Visual Studio Code configuration

- `setup.sh` - Symlinks the vscode json config file. Then installs the list of vs code extensions.

- `code --install-extension.list` - The list of vs code extensions to install.

- `settings.json` - My vs code configuration file.
