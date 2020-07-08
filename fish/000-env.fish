# This file is used to load environment variables before fish starts loading
# Fish doesn't source config.fish until the end, so needed environment variables
# for various plugins will not work if they are only in config.fish

# Addes pipx and fish plugins
set -x PATH $HOME/.local/bin $PATH

# Setup plugins for virtual fish
set -x VIRTUALFISH_PLUGINS "auto_activation compat_aliases projects"
