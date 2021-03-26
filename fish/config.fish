# Add my functions and aliases to fish shell
source ~/.config/fish/my_functions.fish

# Install fisher (the fish package manager)
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Setup theme
set -gx theme_nerd_fonts yes
set -gx theme_show_exit_status yes
#set -gx theme_color_scheme solarized-dark

# Better ls colors
set -gx CLICOLOR 1
set -gx LSCOLORS gxfxcxdxbxegedabagacad

# Don't write bytecode for Python
set -gx PYTHONDONTWRITEBYTECODE 1

# Settings for PIPENV
set -gx PIPENV_DEFAULT_PYTHON_VERSION 3.8.3
set -gx PIPENV_SHELL_FANCY 1
set -gx PIPENV_MAX_SUBPROCESS 32

# Shell and Editor settings
set -gx EDITOR code
set -gx SHELL /usr/local/bin/fish

# Setup pyenv
set -gx PATH $HOME/.pyenv/bin $PATH
if type -q pyenv
    source (pyenv init - | psub)
end

# Setup rbenv
if type -q rbenv
    source (rbenv init - | psub)
end

# Setup GO and goenv
set -gx GOENV_ROOT $HOME/.goenv
set -gx PATH $GOENV_ROOT/bin $PATH
if type -q goenv
    source (goenv init - | psub)
end
set -gx PATH $GOROOT/bin $PATH

# Setup fnm (node.js version manager)
set -gx PATH $HOME/.fnm $PATH
if type -q fnm
    fnm env | source
end

# Lastpass timeout
set -gx LPASS_AGENT_TIMEOUT 28800

# Django load .env variables
set -gx DJANGO_READ_DOT_ENV_FILE True

set -gx GPG_TTY (tty)

# Needed for MacPorts
set -gx PATH /opt/local/bin $PATH
set -gx PATH /opt/local/sbin $PATH
