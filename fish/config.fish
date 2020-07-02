
source ~/.config/fish/my_functions.fish

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

if status --is-login
    # Setup theme
    set -gx theme_nerd_fonts yes
    set -gx theme_show_exit_status yes
    #set -gx theme_color_scheme solarized-dark

    # Better ls colors
    set -gx CLICOLOR 1
    set -gx LSCOLORS gxfxcxdxbxegedabagacad

    # Don't write bytecode, Python!
    set -gx PYTHONDONTWRITEBYTECODE 1

    # Settings for PIPENV
    set -gx PIPENV_DEFAULT_PYTHON_VERSION 3.8.3
    set -gx PIPENV_SHELL_FANCY 1
    set -gx PIPENV_MAX_SUBPROCESS 32

    # Shell and Editor settings
    set -gx EDITOR code
    set -gx SHELL /usr/local/bin/fish

    # Setup pyenv, rbenv and goenv
    set -gx PATH $HOME/.pyenv/bin $PATH
    source (pyenv init - | psub)
    source (rbenv init - | psub)
    set -gx GOENV_ROOT $HOME/.goenv
    set -gx PATH $GOENV_ROOT/bin $PATH
    source (goenv init - | psub)
    set -gx PATH $GOROOT/bin $PATH

    # Setup NVM
    # set -gx NVM_DIR "$HOME/.nvm"
    # nvm use node > /dev/null 2>&1

    # Homebrew path
    set -gx fish_user_paths "/usr/local/sbin" $fish_user_paths

    # Pipx path
    set -gx PATH $HOME/.local/bin $PATH

    # VirtaulFish plugins
    set -gx VIRTUALFISH_PLUGINS "auto_activation compat_aliases"

end

set -gx GPG_TTY (tty)
