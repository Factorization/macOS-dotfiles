#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*


info "Creating virtualenvs directory..."
mkdir -p "$(realpath -m ~)/.virtualenvs" &>/dev/null
success "Finished creating directory."

PIPX_REINSTALL_COMPLETE=false
if pyenv which pipx &>/dev/null; then
    info "Re-installing PIPX packages..."
    fish -c "pipx reinstall-all"
    substep_info "Adding PIPX tab completion..."
    fish -c "register-python-argcomplete --shell fish pipx | ."
    PIPX_REINSTALL_COMPLETE=true
    success "Finished re-installing PIPX packages."
fi

if pyenv which vf &>/dev/null; then
    info "Uninstalling VirtualFish..."
    fish -c "vf uninstall &>/dev/null"
    success "Finished uninstalling VirtualFish."
fi

find * -name "*.list" -not -wholename "*global*" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    info "Installing $1 packages..."
    while read package; do
        if [[ $package == $COMMENT ]]; then continue; fi
        substep_info "Installing $package..."
        fish -c "$cmd $package"
    done < "$fn"
    success "Finished installing $1 packages."
done

if pyenv which pipx &>/dev/null && [ "$PIPX_REINSTALL_COMPLETE" = false ]; then
    info "Re-installing PIPX packages..."
    fish -c "pipx reinstall-all"
    fish -c "register-python-argcomplete --shell fish pipx | ."
    success "Finished re-installing PIPX packages."
fi

if fish -c "pipx list | grep --quiet poetry"; then
    info "Adding Poetry tab completion..."
    fish -c "poetry completions fish > ~/.config/fish/completions/poetry.fish"
    success "Finished adding Poetry tab completion."
fi
