#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

COMMENT=\#*

find * -name "*.list" -not -wholename "*global*" | while read fn; do
    cmd="${fn%.*}"
    cmd="${cmd:2}"
    set -- $cmd
    info "Installing $1 $2 packages..."
    while read package; do
        if [[ $package == $COMMENT ]]; then continue; fi
        substep_info "Installing $package..."
        fish -c "$cmd $package"
    done < "$fn"
    success "Finished installing $1 $2 packages."
done
