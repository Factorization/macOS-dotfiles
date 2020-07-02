#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

PIPX_REINSTALL_COMPLETE=false
if [ -x "$(command -v pipx)" ]; then
    info "Re-installing PIPX packages..."
    pipx reinstall-all
    PIPX_REINSTALL_COMPLETE=true
    success "Finished re-installing PIPX packages."
fi

find * -name "*.list" -not -wholename "*global*" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    info "Installing $1 packages..."
    while read package; do
        if [[ $package == $COMMENT ]]; then continue; fi
        substep_info "Installing $package..."
        $cmd $package
    done < "$fn"
    success "Finished installing $1 packages."
done

if [ -x "$(command -v pipx)" ] && [ "$PIPX_REINSTALL_COMPLETE" = false ]; then
    info "Re-installing PIPX packages..."
    pipx reinstall-all
    success "Finished re-installing PIPX packages."
fi
