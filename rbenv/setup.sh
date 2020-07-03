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
        $cmd $package
    done < "$fn"
    success "Finished installing $1 packages."
done

find * -name "*global.list" | while read fn; do
    cmd="${fn%.*}"
    set -- $cmd
    info "Setting $1 global version..."
    while read version; do
        if [[ $version == $COMMENT ]]; then continue; fi
        substep_info "to $version..."
        $cmd $version
    done < "$fn"
    success "Finished setting $1 global version."
done
