#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/functions.sh

SOURCE="$(realpath -m .)"
DESTINATION="$(realpath -m ~/Library/KeyBindings)"
mkdir -p "$DESTINATION"

info "Adding key bindings..."

find * -name "*.dict" | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

success "Finished adding key bindings."
