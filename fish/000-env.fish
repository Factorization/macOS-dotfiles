# This file is used to load environment variables before fish starts loading
# Fish doesn't source config.fish until the end, so needed environment variables
# for various plugins will not work if they are only in config.fish

# Add Homebrew to path
set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths
set -gx fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -gx fish_user_paths "/opt/homebrew/sbin" $fish_user_paths

# add pyenv to path
set -gx PYENV_ROOT $HOME/.pyenv
set -gx fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Addes pipx
set -x PATH $HOME/.local/bin $PATH

# Setup plugins for virtual fish
set -x VIRTUALFISH_PLUGINS "auto_activation compat_aliases projects"
