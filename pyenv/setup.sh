#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE_REPO="https://github.com/pyenv/pyenv.git"

DESTINATION="$(realpath -m ~/.pyenv)"
COMMENT=\#*

substep_info "Updating pyenv..."
git clone "$SOURCE_REPO" "$DESTINATION" 2>/dev/null || git -C "$DESTINATION" pull
substep_success "Finished updating."

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
