# macOS-dotfiles

My dotfiles for macOS

## Usage

1. Generate new SSH keys and add them to GitHub account

    ```bash
    ssh-keygen
    cat ~/.ssh/id_rsa.pub | pbcopy
    ```

1. Install Homebrew and git

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git
    ```

1. Clone this repository

    ```bash
    mkdir -p ~/Projects
    git clone git@github.com:Factorization/macOS-dotfiles.git ~/Projects/dotfiles
    ```

1. Ensure you are signed in to the App Store

1. Run the `bootstrap.sh` script
