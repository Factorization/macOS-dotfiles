#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

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

info "Updating gems..."
fish -c "gem update --system"
fish -c "gem update"
success "Finished updating gems."
